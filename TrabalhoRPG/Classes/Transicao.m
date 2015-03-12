//
//  Transicao.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Transicao.h"

@implementation Transicao

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
