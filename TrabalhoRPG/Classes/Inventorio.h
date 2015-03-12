//
//  Inventorio.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Inventorio : NSObject

@property NSArray* items;

+ (id) inventorioUnico;

@end
