//
//  Transicao.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Transicao.h"

@implementation Transicao

+ (Transicao*) fromDictionary: (NSDictionary*) data {
    if ([data[@"tipo"] isEqualToString: @"cena"])
        return [[Transicao alloc] initToScene: [data[@"numero"] floatValue]];

    if ([data[@"tipo"] isEqualToString: @"item"])
        return [[Transicao alloc] initToItem: [data[@"numero"] floatValue]];

    NSLog(@"%@", [NSString stringWithFormat:@"Tipo de transicao desconhecido: %@", data[@"tipo"]]);
    return nil;
}

- (id) initToScene: (int) number {
    self = [super init];
    if (self) {
        _numero = number;
        _tipo = ParaCenario;
    }
    return self;
}

- (id) initToItem: (int) item {
    self = [super init];
    if (self) {
        _numero = item;
        _tipo = ParaCenaItem;
    }
    return self;
}

@end
