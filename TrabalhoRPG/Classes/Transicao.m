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
        return [[Transicao alloc] initToScene: object[@"numero"]];

    if ([object[@"tipo"] isEqualToString: @"item"])
        return [[Transicao alloc] initToItem: object[@"numero"]];

    NSLog([NSString stringWithFormat:@"Tipo de transicao desconhecido: %@", object[@"tipo"]]);
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
