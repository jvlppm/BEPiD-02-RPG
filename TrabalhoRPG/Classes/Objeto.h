//
//  Objeto.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Objeto Gráfico (clicável) para ser incluído em uma cena.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#include "Transicao.h"

@interface Objeto : NSObject

+ (Objeto*) fromDictionary: (NSDictionary*) data;

@property NSString* imagem;
@property CGRect posicao;
@property Transicao* transicao;

@end
