//
//  EstadoJogo.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/13/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Estado atual do jogo em andamento

#import "EstadoJogo.h"
#include "Mundo.h"

@implementation EstadoJogo

+ (id) unico {
    static EstadoJogo* singleton = nil;
    @synchronized(self) {
        if (singleton == nil)
            singleton = [[self alloc] initGame];
    }
    return singleton;
}

- (id) initGame {
    self = [super init];
    if (self) {
        self.cenaAtual = [Cenario fromFile:@"Cena0"];
    }
    return self;
}

@end
