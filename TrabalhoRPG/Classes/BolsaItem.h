//
//  Item.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Item de inventório

#import <Foundation/Foundation.h>
#import "Item.h"

@interface BolsaItem : NSObject

- (id) initWithItem: (Item*) item quantity: (int) quantity;

@property Item* item;
@property int quantidade;

@end
