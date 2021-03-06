//
//  Cena.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "Cenario.h"
#import "Json.h"
#import "InimigoPossivel.h"

@implementation Cenario

+ (id)fromFile: (NSString*) file {
    NSDictionary* dictionary = [Json fromFile: file];
    if (dictionary == nil)
        return nil;
    
    Cenario* cena = [[Cenario alloc] init];
    if (cena) {
        cena.arquivo = file;
        cena.imagem = dictionary[@"imagem"];
        cena.nome = dictionary[@"nome"];
        cena.descricao = dictionary[@"descricao"];
        
        NSMutableArray* inimigos = [[NSMutableArray alloc] init];
        
        for (NSDictionary* ini in dictionary[@"inimigosPossiveis"]) {
            [inimigos addObject:[InimigoPossivel fromDictionary:ini]];
        }
        
        cena.inimigosPossiveis = inimigos;

        NSMutableArray* acoes = [[NSMutableArray alloc] init];
        for (id data in dictionary[@"acoes"])
            [acoes addObject: [Acao fromDictionary: data]];
        cena.acoes = acoes;

        NSMutableArray* objetos = [[NSMutableArray alloc] init];
        for (id data in dictionary[@"objetos"])
            [objetos addObject: [Objeto fromDictionary: data]];
        cena.objetos = objetos;
    }
    return cena;
}

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
