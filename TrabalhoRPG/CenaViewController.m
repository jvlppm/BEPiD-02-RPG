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
#import "Mundo.h"
#import "GameScene.h"
#import "CenaItemViewController.h"
#import "Item.h"
#import "Json.h"

@interface CenaViewController () {
    NSArray* opcoes;
    
    EstadoJogo* estadoJogo;
    Mundo* mundo;
    Cenario* atual;
    
    GameScene* cenaJogo;
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
    estadoJogo = [EstadoJogo unico];
    mundo = [Mundo unico];
    atual = estadoJogo.cenaAtual;
    [self refresh];
}

#pragma mark Scene Controller

- (void) refresh {
    
    if (cenaJogo)
        [cenaJogo removeFromParent];
    
    if (atual) {
        cenaJogo = [[GameScene alloc] init];
        [cenaJogo setSize:self.skView.bounds.size];
        cenaJogo.scaleMode = SKSceneScaleModeAspectFit;
        [self.skView presentScene:cenaJogo];
        
        self.lblNomeCena.text = atual.nome;
        self.tvDescricaoCena.text = atual.descricao;
        
        [cenaJogo setBackground:atual.imagem];
        [cenaJogo setObjects: atual.objetos];
        cenaJogo.gameDelegate = self;
        
        opcoes = atual.acoes;
        [self.tableAcoes reloadData];
    }
}

- (void) makeTransition: (Transicao*) transicao {
    if (transicao.tipo == ParaCenario) {
        atual = [Cenario fromFile:transicao.arquivo];
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
