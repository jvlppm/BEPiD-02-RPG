//
//  Inventorio.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Inventorio.h"

@implementation Inventorio

+ (id) inventorioUnico {
    static Inventorio* unico = nil;
    @synchronized(self) {
        if (unico == nil)
            unico = [self alloc];
    }
    return unico;
}

@end
