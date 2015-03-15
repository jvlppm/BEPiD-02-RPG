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
    return [[ValorLevel alloc] initFromDictionary:data];
}

- (instancetype)initFromDictionary:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        valorBase = [data[@"base"] floatValue];
        multiplicador = [data[@"porLevel"] floatValue];
    }
    return self;
}

- (float) calculaValor: (float) level {
    return valorBase + multiplicador * level;
}

@end
