//
//  Transicao.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

// Informações para uma transição de tela

typedef enum : NSUInteger {
    ParaCenario,
    ParaCenaItem,
} TipoTransicao;

@interface Transicao : NSObject

@property TipoTransicao tipo;
@property NSString* arquivo;

@property NSArray* requerItems;
@property NSArray* excluiItems;

+ (Transicao*) fromDictionary: (NSDictionary*) data;

- (BOOL) available;

@end
