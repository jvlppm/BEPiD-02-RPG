//
//  CenaItem.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Descrição de um item

#import <Foundation/Foundation.h>

@interface Item : NSObject

+ (NSArray*) All;

@property NSString* arquivo;
@property NSString* nome;
@property NSString* descricao;
@property NSString* imagem;

+ (Item*) fromFile: (NSString*) name;

@end
