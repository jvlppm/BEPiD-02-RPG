//
//  EstadoJogo.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/13/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cenario.h"

@interface EstadoJogo : NSObject

+ (id) unico;

@property Cenario* cenaAtual;

@end