//
//  BattleViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor on 3/14/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "BattleViewController.h"
#import "ValorLevel.h"
#import "EstadoJogo.h"

@interface BattleViewController () {
    float energiaInimigo;
    NSArray* ataques;
    NSTimer* timer;
}
@property (weak, nonatomic) IBOutlet UILabel *lblNomeInimigo;
@property (weak, nonatomic) IBOutlet UIProgressView *pbInimigo;
@property (weak, nonatomic) IBOutlet UIProgressView *pbJogador;
@property (weak, nonatomic) IBOutlet UIImageView *ivInimigo;
@property (weak, nonatomic) IBOutlet UITableView *tableAtaques;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblNomeInimigo.text = self.inimigo.nome;
    self.ivInimigo.image = [UIImage imageNamed:self.inimigo.imagem];
    
    energiaInimigo = [self.inimigo.energia calculaValor:self.inimigo.level];
    [self refresh];
}

- (void)viewWillDisappear:(BOOL)animated {
    [timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refresh {
    self.pbInimigo.progress = energiaInimigo / [self.inimigo.energia calculaValor:self.inimigo.level];
    EstadoJogo* estado = [EstadoJogo unico];
    self.pbJogador.progress = estado.energiaJogador / [estado.jogador.energia calculaValor:estado.level];
    
    NSMutableArray* listaAtaques = [[NSMutableArray alloc] init];
    for (NSString* at in estado.ataques) {
        [listaAtaques addObject:[Ataque fromFile:at]];
    }
    ataques = listaAtaques;
    [self.tableAtaques reloadData];
}

- (void) ataqueInimigo {
    EstadoJogo* estado = [EstadoJogo unico];
    
    int nAt = arc4random() % self.inimigo.ataques.count;
    Ataque* opcao = [Ataque fromFile:self.inimigo.ataques[nAt]];
    
    float atMult = [self.inimigo getAtaqueMult: opcao.tipo];
    float defMult = [estado.jogador getDefesaMult: opcao.tipo];

    estado.energiaJogador -= [opcao.forca calculaValor:_inimigo.level] * defMult * atMult;
    self.tableAtaques.userInteractionEnabled = true;
    self.tableAtaques.alpha = 1;
    [self refresh];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Table Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ataques count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Ataque* opcao = ataques[indexPath.row];
    
    cell.textLabel.text = opcao.nome;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    Ataque* opcao = ataques[row];
    
    EstadoJogo* estado = [EstadoJogo unico];
    
    float atMult = [estado.jogador getAtaqueMult: opcao.tipo];
    float defMult = [self.inimigo getDefesaMult: opcao.tipo];

    energiaInimigo -= [opcao.forca calculaValor:estado.level] * defMult * atMult;
    [self refresh];
    
    self.tableAtaques.userInteractionEnabled = false;
    self.tableAtaques.alpha = 0.5;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(ataqueInimigo)
                                           userInfo:nil
                                            repeats:NO];
}

@end
