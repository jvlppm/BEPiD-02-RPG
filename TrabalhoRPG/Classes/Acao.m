//
//  Acao.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Acao.h"

@implementation Acao

- (id) initNamed: (NSString*) name to: (Transicao*) transition {
    self = [super init];
    if (self) {
        _nome = name;
        _transicao = transition;
    }
    return self;
}

@end
