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
#include "Json.h"

@implementation Cenario

+ (id)fromJsonFile: (NSString*) file {
    NSDictionary* dictionary = [Json fromFile: file];
    if (dictionary == nil)
        return nil;
    
    Cenario* cena = [[Cenario alloc] init];
    if (cena) {
        cena.imagem = dictionary[@"imagem"];
        cena.nome = dictionary[@"nome"];
        cena.descricao = dictionary[@"descricao"];
        cena.chanceBatalha = [dictionary[@"chanceBatalha"] doubleValue];

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

- (void)adicionaTransicao: (NSString*) nome cena: (int) numero {
    [_acoes addObject: [[Transicao alloc] initToScene: numero]];
}

- (void) adicionaObjeto: (NSString*) nome x: (int) posX y: (int) posY to: (Transicao*) transicao {
    Objeto* obj = [[Objeto alloc] init];
    obj.posicao = CGPointMake(posX, posY);
    obj.imagem = nome;
    obj.transicao = transicao;
}

- (void) adicionaObjeto: (NSString*) nome x: (int) posX y: (int) posY codigoItem: (int) code {
    Objeto* obj = [[Objeto alloc] init];
    obj.posicao = CGPointMake(posX, posY);
    obj.imagem = nome;
    obj.transicao = [[Transicao alloc] initToItem:code];
}

- (void) adicionaObjeto: (NSString*) nome x: (int) posX y: (int) posY cena: (int) scene {
    Objeto* obj = [[Objeto alloc] init];
    obj.posicao = CGPointMake(posX, posY);
    obj.imagem = nome;
    obj.transicao = [[Transicao alloc] initToScene:scene];
}

@end
