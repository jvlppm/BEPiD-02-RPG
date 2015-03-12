//
//  Cena.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Acao.h"

@interface Cenario : NSObject

@property NSString* imagem;
@property NSString* nome;
@property NSMutableArray* acoes;
@property NSMutableArray* objetos;

- (id)initWithImage: (NSString*) image andName: (NSString*) name;
- (void)adicionaAcao: (Acao*) acao;

@end
