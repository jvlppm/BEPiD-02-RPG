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
        return [[Transicao alloc] initToScene: data[@"arquivo"]];

    if ([data[@"tipo"] isEqualToString: @"item"])
        return [[Transicao alloc] initToItem: data[@"arquivo"]];

    NSLog(@"%@", [NSString stringWithFormat:@"Tipo de transicao desconhecido: %@", data[@"tipo"]]);
    return nil;
}

- (id) initToScene: (NSString*) file {
    self = [super init];
    if (self) {
        _arquivo = file;
        _tipo = ParaCenario;
    }
    return self;
}

- (id) initToItem: (NSString*) file {
    self = [super init];
    if (self) {
        _arquivo = file;
        _tipo = ParaCenaItem;
    }
    return self;
}

@end
