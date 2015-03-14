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
    }
    return self;
}

@end
