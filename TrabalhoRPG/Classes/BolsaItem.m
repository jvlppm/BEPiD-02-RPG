//
//  Item.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "BolsaItem.h"

@implementation BolsaItem

- (id) initWithItem: (Item*) item quantity: (int) quantity {
    self = [super init];
    if(self) {
        self.item = item;
        self.quantidade = quantity;
    }
    return self;
}

@end
