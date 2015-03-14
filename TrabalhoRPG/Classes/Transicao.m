//
//  Transicao.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Transicao.h"
#import "Item.h"
#import "Inventorio.h"

@implementation Transicao

- (id) initFromFile: (NSString*) file {
    self = [super init];
    if(self)
        self.arquivo = file;
    return self;
}

+ (Transicao*) fromDictionary: (NSDictionary*) data {
    Transicao* transicao = [[Transicao alloc] initFromFile:data[@"arquivo"]];
    
    if ([data[@"tipo"] isEqualToString: @"cena"])
        transicao.tipo = ParaCenario;
    else if ([data[@"tipo"] isEqualToString: @"item"]) {
        transicao.tipo = ParaCenaItem;
        transicao.excluiItems = @[data[@"arquivo"]];
    }
    else {
        NSLog(@"%@", [NSString stringWithFormat:@"Tipo de transicao desconhecido: %@", data[@"tipo"]]);
        return nil;
    }
    
    transicao.requerItems = data[@"requerItens"];
    if (data[@"excluiItens"])
        transicao.excluiItems = data[@"excluiItens"];
    
    return transicao;
}

- (BOOL) available {
    if(self.requerItems) {
        for (NSString* itemFile in self.requerItems) {
            if (![Inventorio contemItem:itemFile])
                return NO;
        }
    }
    
    if(self.excluiItems) {
        for (NSString* itemFile in self.excluiItems) {
            if ([Inventorio contemItem:itemFile])
                return NO;
        }
    }
    
    return YES;
}

@end
