//
//  EstadoJogo.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/13/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cenario.h"
#import "Personagem.h"

@interface EstadoJogo : NSObject

+ (id) unico;

@property (getter=getCenaAtual, setter=setCenaAtual:) Cenario* cenaAtual;
@property (getter=getNovoJogo, setter=setNovoJogo:) BOOL novoJogo;
@property (getter=getEnergiaJogador, setter=setEnergiaJogador:) float energiaJogador;
@property (getter=getAtaques, setter=setAtaques:) NSArray* ataques;
@property (getter=getLevel, setter=setLevel:) float level;

@property Personagem* jogador;

- (void) descartarJogo;

- (void) adicionaAtaque: (NSString*) ataque;

@end
