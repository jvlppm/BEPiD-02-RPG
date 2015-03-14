//
//  Inventorio.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Inventório do personagem principal

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Inventorio : NSObject

+ (BOOL) contemItem: (NSString*) named;
+ (void) adicionaItem: (Item*) item;
+ (void) usaItem: (Item*) item;

@end
