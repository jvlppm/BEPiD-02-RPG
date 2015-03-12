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
        cenas[1] = [Mundo cena01];
    }
    return self;
}

+ (Cenario*) cenaInicial {
    Cenario* cena = [[Cenario alloc] initWithImage: @"CenaInicial.png" andName: @"Cena inicial"];
    cena.descricao = @"Descricao cena 00";
    [cena adicionaTransicao:@"Entrar porta" cena:1];
    return cena;
}

+ (Cenario*) cena01 {
    Cenario* cena = [[Cenario alloc] initWithImage: @"Cena01.png" andName: @"Cena 01"];
    cena.descricao = @"Descricao cena 01";
    [cena adicionaObjeto: @"item0.png" x: 5 y: 5 codigoItem: 0];
    [cena adicionaTransicao:@"Voltar" cena:0];
    return cena;
}

@end
