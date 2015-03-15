//
//  ValorLevel.h
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Valor que varia de acordo com um determinado level

#import <Foundation/Foundation.h>

@interface ValorLevel : NSObject

+ (ValorLevel*) fromDictionary: (NSDictionary*) data;
- (float) calculaValor: (float) level;

@end
