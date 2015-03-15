//
//  CenaItem.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Item.h"
#import "Json.h"

@implementation Item

+ (NSArray*) All {
    static NSMutableArray* all = nil;
    @synchronized(self) {
        if (all == nil) {
            all = [[NSMutableArray alloc] init];
            for (NSString* file in @[@"ItemChave"]) {
                [all addObject: [Item createFromFile: file]];
            }
        }
    }
    return all;
}

+ (Item*) createFromFile: (NSString*) name {
    NSDictionary* data = [Json fromFile: name];
    if (!data)
        return nil;

    Item* obj = [[Item alloc] init];
    obj.arquivo = name;
    obj.nome = data[@"nome"];
    obj.descricao = data[@"descricao"];
    obj.imagem = data[@"imagem"];
    return obj;
}

+ (Item*) fromFile: (NSString*) name {
    for (Item* item in [Item All]) {
        if ([item.arquivo isEqualToString:name]) {
            return item;
        }
    }
    return nil;
}

@end
