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

+ (ValorLevel*) fromDictionary: (NSDictionary*) data {
    float base= [data[@"base"] floatValue];
    float mult = [data[@"porLevel"] floatValue];
    return [[ValorLevel alloc] initWith:base multiplying:mult];
}

- (id) initWith: (float) base multiplying: (float) levelMultiplier {
    self = [super init];
    if (self) {
        valorBase = base;
        multiplicador = levelMultiplier;
    }
    return self;
}

- (float) calculaValor: (float) level {
    return valorBase + multiplicador * level;
}

@end
