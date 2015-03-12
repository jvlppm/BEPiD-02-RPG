//
//  Mundo.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Mundo.h"
#import "Cenario.h"

@implementation Mundo {
    Cenario* cenas[1];
}

+ (id) mundoUnico {
    static Mundo* unico = nil;
    @synchronized(self) {
        if (unico == nil)
            unico = [[self alloc] initWorld];
    }
    return unico;
}

- (instancetype)initWorld
{
    self = [super init];
    if (self) {
        cenas[0] = [Mundo cenaInicial];
    }
    return self;
}

+ (Cenario*) cenaInicial {
    Cenario* cena = [[Cenario alloc] initWithImage: @"CenaInicial.png" andName: @"Cena inicial"];
    [cena adicionaAcao: [[Acao alloc] initNamed:@"" to: [[Transicao alloc] initToScene: 1]]];
    return cena;
}

@end
