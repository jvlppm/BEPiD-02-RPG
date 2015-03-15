//
//  Ataque.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Ataque.h"
#import "Json.h"

@implementation Ataque

+ (Ataque *)fromFile:(NSString *)file {
    return [self fromDictionary:[Json fromFile:file]];
}

+ (Ataque *)fromDictionary:(NSDictionary *)data {
    return [[self alloc] initFromDictionary:data];
}

- (instancetype)initFromDictionary:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.forca = [ValorLevel fromDictionary:data[@"forca"]];
        self.quantidadeMaxima = [ValorLevel fromDictionary:data[@"quantidadeMaxima"]];
        self.nome = data[@"nome"];
        self.tipo = data[@"tipo"];
    }
    return self;
}

@end
