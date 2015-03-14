//
//  CenaViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/12/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "CenaViewController.h"
#include "Cenario.h"
#include "EstadoJogo.h"
#include "Mundo.h"

@interface CenaViewController () {
    NSArray* opcoes;
}

@property (weak, nonatomic) IBOutlet UILabel *lblNomeCena;
@property (weak, nonatomic) IBOutlet UIImageView *imvCena;
@property (weak, nonatomic) IBOutlet UITextView *tvDescricaoCena;
@property (weak, nonatomic) IBOutlet UITableView *tableAcoes;

@end

@implementation CenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    // Do view setup here.
    self.tableAcoes.delegate = self;
    self.tableAcoes.dataSource = self;
}

- (void) refresh {
    EstadoJogo* estado = [EstadoJogo unico];
    Cenario* atual = estado.cenaAtual;
    if (atual) {
        self.lblNomeCena.text = atual.nome;
        self.tvDescricaoCena.text = atual.descricao;
        self.imvCena.image = [UIImage imageNamed:atual.imagem];
        opcoes = atual.acoes;
        [self.tableAcoes reloadData];
    }
}

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
    
    cell.textLabel.text = opcao.nome;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    Acao* opcao = opcoes[row];
    EstadoJogo* estado = [EstadoJogo unico];
    Mundo* mundo = [Mundo unico];
    estado.cenaAtual = mundo.cenas[opcao.transicao.numero];
    [self refresh];
}

@end
