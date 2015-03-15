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

+ (id) unico {
    static Inventorio* unico = nil;
    @synchronized(self) {
        if (unico == nil)
            unico = [self alloc];
    }
    return unico;
}

+ (BOOL) contemItem: (NSString*) named {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSInteger quantity = [defaults integerForKey:named];
    return quantity && quantity > 0;
}

+ (void) adicionaItem: (Item*) item {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSInteger quantity = [defaults integerForKey:item.arquivo];
    if(!quantity)
        quantity = 1;
    else
        quantity++;
    
    [defaults setInteger:quantity forKey:item.arquivo];
    [defaults synchronize];
}

+ (void) usaItem: (Item*) item {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSInteger quantity = [defaults integerForKey:item.arquivo];
    if(!quantity || quantity <= 1)
        quantity = 0;
    else
        quantity--;
    
    [defaults setInteger:quantity forKey:item.arquivo];
    [defaults synchronize];
}

@end
