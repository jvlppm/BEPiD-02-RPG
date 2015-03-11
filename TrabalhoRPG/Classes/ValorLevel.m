//
//  ValorLevel.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "ValorLevel.h"

@interface ValorLevel () {
    int valorBase;
    int multiplicador;
}

@end

@implementation ValorLevel

- (id) initWith: (int) base multiplying: (int) levelMultiplier {
    self = [super init];
    if (self) {
        valorBase = base;
        multiplicador = levelMultiplier;
    }
    return self;
}

- (int) calculaValor: (int) level {
    return valorBase + multiplicador * level;
}

@end
