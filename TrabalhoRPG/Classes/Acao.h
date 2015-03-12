//
//  Acao.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transicao.h"

@interface Acao : NSObject

@property NSString* nome;
@property Transicao* transicao;

- (id) initNamed: (NSString*) name to: (Transicao*) transition;

@end
