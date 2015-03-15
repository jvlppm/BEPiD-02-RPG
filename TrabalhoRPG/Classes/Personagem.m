//
//  Inimigo.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "Personagem.h"

@implementation Personagem

+ (Personagem*) fromDictionary: (NSDictionary*) data {
    Personagem* perso = [[Personagem alloc] init];
    
    perso.nome = data[@"nome"];
    perso.imagem = data[@"imagem"];
    perso.energia = [ValorLevel fromDictionary:data[@"energia"]];
    perso.xp = [ValorLevel fromDictionary:data[@"xp"]];
    perso.ataques = data[@"ataques"];
    
    perso.statusAtaque = data[@"status_ataque"];
    perso.statusDefesa = data[@"status_defesa"];
    return perso;
}

- (float) getAtaqueMult: (NSString*) tipo {
    id value = self.statusAtaque[tipo];
    if(!value)
        return 1;
    return [value floatValue];
}

- (float) getDefesaMult: (NSString*) tipo {
    id value = self.statusDefesa[tipo];
    if(!value)
        return 1;
    return [value floatValue];
}

@end
