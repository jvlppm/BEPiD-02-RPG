//
//  Cena.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Cenario.h"
//#import "Acao.h"

@implementation Cenario

- (id)initWithImage: (NSString*) image andName: (NSString*) name {
    self = [super init];
    if (self) {
        _imagem = image;
        _nome = name;
    }
    return self;
}

- (void)adicionaAcao: (Acao*) acao {
    [_acoes addObject:acao];
}

@end
