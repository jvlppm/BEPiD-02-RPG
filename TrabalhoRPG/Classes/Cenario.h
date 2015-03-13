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

@property NSString* imagem;
@property NSString* nome;
@property NSString* descricao;
@property NSMutableArray* acoes;
@property NSMutableArray* objetos;

- (id)initFromJsonFilePath: (NSString*) path;

- (id)initWithImage: (NSString*) image andName: (NSString*) name;
- (void)adicionaAcao: (Acao*) acao;
- (void)adicionaTransicao: (NSString*) nome cena: (int) numero;

- (void) adicionaObjeto: (NSString*) nome x: (int) posX y: (int) posY to: (Transicao*) transicao;
- (void) adicionaObjeto: (NSString*) nome x: (int) posX y: (int) posY cena: (int) scene;
- (void) adicionaObjeto: (NSString*) nome x: (int) posX y: (int) posY codigoItem: (int) code;

@end
