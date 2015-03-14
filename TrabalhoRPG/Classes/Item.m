//
//  CenaItem.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (Item*) fromDictionary: (NSDictionary*) data {
    Item* obj = [[Item alloc] init];
    obj.nome = data[@"nome"];
    obj.descricao = data[@"descricao"];
    obj.imagem = data[@"imagem"];
    return obj;
}

@end
