//
//  CenaViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/12/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CenaViewController.h"
#import "Cenario.h"
#import "EstadoJogo.h"
#import "GameScene.h"
#import "CenaItemViewController.h"
#import "Item.h"

@interface CenaViewController () {
    NSArray* opcoes;
    GameScene* emExibicao;
}

@property (weak, nonatomic) IBOutlet UILabel *lblNomeCena;
@property (weak, nonatomic) IBOutlet SKView *skView;
@property (weak, nonatomic) IBOutlet UITextView *tvDescricaoCena;
@property (weak, nonatomic) IBOutlet UITableView *tableAcoes;

@end

@implementation CenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do view setup here.
    [self refresh];
}

- (void)viewWillAppear:(BOOL)animated {
    [self refresh];
    EstadoJogo* estado = [EstadoJogo unico];
    estado.novoJogo = NO;
}

#pragma mark Scene Controller

- (void) refresh {
    
    EstadoJogo* estadoJogo = [EstadoJogo unico];
    Cenario* cenaJogo = estadoJogo.cenaAtual;
    
    if (emExibicao) {
        [emExibicao removeFromParent];
        emExibicao = nil;
    }
    
    if (cenaJogo) {
        emExibicao = [[GameScene alloc] init];
        [emExibicao setSize:self.skView.bounds.size];
        emExibicao.scaleMode = SKSceneScaleModeAspectFit;
        [self.skView presentScene:emExibicao];
        
        self.lblNomeCena.text = cenaJogo.nome;
        self.tvDescricaoCena.text = cenaJogo.descricao;
        
        [emExibicao setBackground:cenaJogo.imagem];
        [emExibicao setObjects: cenaJogo.objetos];
        emExibicao.gameDelegate = self;
        
        [self refreshOpcoes: cenaJogo];
    }
}

- (void) refreshOpcoes: (Cenario*) atual {
    NSMutableArray* avOptions = [[NSMutableArray alloc] init];
    
    for (Acao* acao in atual.acoes) {
        if ([acao.transicao available])
            [avOptions addObject:acao];
    }
    
    opcoes = avOptions;
    [self.tableAcoes reloadData];
}

- (void) makeTransition: (Transicao*) transicao {
    if (transicao.tipo == ParaCenario) {
        EstadoJogo* estadoJogo = [EstadoJogo unico];
        estadoJogo.cenaAtual = [Cenario fromFile:transicao.arquivo];
        [self refresh];
    }
    else if (transicao.tipo == ParaCenaItem) {
        CenaItemViewController* itemViewController = (CenaItemViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"itemView"];
        itemViewController.item = [Item fromFile:transicao.arquivo];
        [self showViewController:itemViewController sender:self];
    }
}

#pragma mark Game Delegate

- (void) objectTapped: (Objeto*) obj {
    [self makeTransition:obj.transicao];
}

#pragma mark Table Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [opcoes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Acao* opcao = opcoes[indexPath.row];
    
    cell.textLabel.text = opcao.texto;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    Acao* opcao = opcoes[row];
    [self makeTransition:opcao.transicao];
}

@end
