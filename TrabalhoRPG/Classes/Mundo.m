//
//  Mundo.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Mundo.h"
#import "Cenario.h"

@implementation Mundo {
}

+ (id) unico {
    static Mundo* singleton = nil;
    @synchronized(self) {
        if (singleton == nil)
            singleton = [[self alloc] initWorld];
    }
    return singleton;
}

- (instancetype)initWorld
{
    self = [super init];
    if (self) {
        NSMutableArray* loadCenas = [[NSMutableArray alloc] init];
        for(int i = 0;;i++) {
            NSString* arquivo = [NSString stringWithFormat:@"Cena%d", i];
            Cenario* cena = [Cenario fromJsonFile:arquivo];
            if (!cena)
                break;
            [loadCenas addObject:cena];
        }
        _cenas = loadCenas;
    }
    return self;
}

@end
