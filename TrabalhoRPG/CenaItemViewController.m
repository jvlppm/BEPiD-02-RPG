//
//  CenaItemViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor on 3/14/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "CenaItemViewController.h"
#import "Inventorio.h"
#import "Item.h"
#import "EstadoJogo.h"

@interface CenaItemViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ivItem;
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet UITextView *tvDescricao;

@end

@implementation CenaItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.lblNome.text = self.item.nome;
    self.ivItem.image = [UIImage imageNamed:self.item.imagem];
    self.tvDescricao.text = self.item.descricao;
    
    if ([self.item.nome isEqualToString:@"Cama"] ) {
        EstadoJogo* estado = [EstadoJogo unico];
        estado.energiaJogador = [estado.jogador.energia calculaValor:estado.level];
    }
    else {
        [Inventorio adicionaItem:self.item];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
