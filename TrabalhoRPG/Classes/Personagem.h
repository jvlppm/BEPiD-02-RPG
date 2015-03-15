//
//  Inimigo.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Personagem / Inimigo para batalhas

#import <Foundation/Foundation.h>
#include "Ataque.h"

@interface Personagem : NSObject

@property NSString* nome;
@property NSString* imagem;
@property NSArray* ataques;

@property int level;
@property ValorLevel* energia;

@end
