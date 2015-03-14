//
//  Inventorio.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Inventorio.h"
#import "BolsaItem.h"

@implementation Inventorio

+ (NSMutableArray*) Itens {
    static NSMutableArray* itens;
    @synchronized(self) {
        if (itens == nil)
            itens = [[NSMutableArray alloc] init];
    }
    return itens;
}

+ (id) unico {
    static Inventorio* unico = nil;
    @synchronized(self) {
        if (unico == nil)
            unico = [self alloc];
    }
    return unico;
}

+ (BOOL) contemItem: (NSString*) named {
    @synchronized(self) {
        for (BolsaItem* bolsa in [self Itens]) {
            if ([bolsa.item.arquivo isEqualToString:named]) {
                return bolsa.quantidade > 0;
            }
        }
    }
    return NO;
}

+ (void) adicionaItem: (Item*) item {
    @synchronized(self) {
        for (BolsaItem* bolsa in [self Itens]) {
            if (bolsa.item == item) {
                bolsa.quantidade++;
                return;
            }
        }
        [[self Itens] addObject:[[BolsaItem alloc] initWithItem: item quantity: 1]];
    }
}

+ (void) usaItem: (Item*) item {
    @synchronized(self) {
        for (BolsaItem* bolsa in [self Itens]) {
            if (bolsa.item == item) {
                if (bolsa.quantidade-- <= 0)
                    [[self Itens] removeObject:bolsa];
                return;
            }
        }
    }
}

@end
