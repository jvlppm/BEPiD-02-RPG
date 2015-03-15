//
//  InimigoPossivel.m
//  TrabalhoRPG
//
//  Created by João Vitor on 3/15/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "InimigoPossivel.h"

@implementation InimigoPossivel

+ (InimigoPossivel*) fromDictionary: (NSDictionary*) data {
    InimigoPossivel* obj = [[InimigoPossivel alloc] init];
    
    obj.arquivo = data[@"arquivo"];
    obj.chance = [data[@"chance"] floatValue];
    obj.level_min = [data[@"level_min"] floatValue];
    obj.level_max = [data[@"level_max"] floatValue];
    
    return obj;
}

@end
