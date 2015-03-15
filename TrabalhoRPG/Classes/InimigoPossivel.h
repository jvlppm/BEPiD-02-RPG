//
//  InimigoPossivel.h
//  TrabalhoRPG
//
//  Created by João Vitor on 3/15/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InimigoPossivel : NSObject

+ (InimigoPossivel*) fromDictionary: (NSDictionary*) data;

@property NSString* arquivo;
@property float chance;
@property int level_min;
@property int level_max;

@end
