//
//  Objeto.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Objeto.h"

@implementation Objeto

+ (Objeto*) fromDictionary: (NSDictionary*) data {
	Objeto* obj = [[Objeto alloc] init];
    obj.posicao = CGPointMake(data["x"], data["y"]);
    obj.imagem = data["imagem"];
    obj.transicao = [Transicao fromDictionary: data["transicao"]];
    return obj;
}

@end
