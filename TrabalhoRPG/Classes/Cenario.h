//
//  Cena.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Acao.h"
#import "Objeto.h"
#import <CoreGraphics/CoreGraphics.h>

// Conteudo para montar uma cena na tela

@interface Cenario : NSObject

@property NSString* arquivo;
@property NSString* imagem;
@property NSString* nome;
@property NSString* descricao;
@property NSMutableArray* acoes;
@property NSMutableArray* objetos;
@property double chanceBatalha;

+ (NSArray*) All;

+ (Cenario*) fromFile: (NSString*) file;

- (id)initWithImage: (NSString*) image andName: (NSString*) name;
- (void)adicionaAcao: (Acao*) acao;
- (void)adicionaTransicao: (NSString*) nome cena: (NSString*) identifier;

@end
