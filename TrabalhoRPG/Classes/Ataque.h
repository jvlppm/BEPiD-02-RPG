//
//  Ataque.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "ValorLevel.h"

typedef enum : NSUInteger {
    Fire,
    Water,
    Grass,
} TipoAtaque;

@interface Ataque : NSObject

@property ValorLevel* quantidadeMaxima;
@property int vezesUsado;
@property TipoAtaque tipo;

@end
