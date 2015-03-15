//
//  Ataque.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Descrição de um ataque para batalha

#import <Foundation/Foundation.h>
#include "ValorLevel.h"

@interface Ataque : NSObject
@property NSString* tipo;
@property NSString* nome;
@property ValorLevel* forca;
@property ValorLevel* quantidadeMaxima;

+ (Ataque*) fromFile: (NSString*) file;
+ (Ataque*) fromDictionary: (NSDictionary*) data;
- (id) initFromDictionary: (NSDictionary*) data;
@end
