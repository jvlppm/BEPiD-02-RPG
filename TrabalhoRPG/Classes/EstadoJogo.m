//
//  EstadoJogo.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/13/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Estado atual do jogo em andamento

#import "EstadoJogo.h"
#import "Mundo.h"
#import "Json.h"

@interface EstadoJogo ()

@end

@implementation EstadoJogo

+ (id) unico {
    static EstadoJogo* singleton = nil;
    @synchronized(self) {
        if (singleton == nil) {
            singleton = [[self alloc] init];
        }
    }
    return singleton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _jogador = [Personagem fromDictionary:[Json fromFile:@"Jogador"]];
    }
    return self;
}

- (void) descartarJogo {
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (void) setCenaAtual:(Cenario *)cenaAtual {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:cenaAtual.arquivo forKey:@"ultimaCena"];
    [defaults synchronize];
}

- (Cenario*) getCenaAtual {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString* ultimaCena = [defaults objectForKey:@"ultimaCena"];
    if (!ultimaCena)
        ultimaCena = @"Cena0";
    return [Cenario fromFile:ultimaCena];
}

- (BOOL)getNovoJogo {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return ![defaults valueForKey:@"jogoEmAndamento"];
}

- (void)setNovoJogo:(BOOL)novoJogo {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if (novoJogo)
        [defaults removeObjectForKey:@"jogoEmAndamento"];
    else
        [defaults setValue:@"" forKey:@"jogoEmAndamento"];
}

- (float)getEnergiaJogador {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    id value = [defaults valueForKey:@"energiaJogador"];
    if (!value)
        return [_jogador.energia calculaValor:[self getLevel]];
    
    return [value floatValue];
}

- (void)setEnergiaJogador:(float)value {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:value forKey:@"energiaJogador"];
    [defaults synchronize];
}

-(float) getLevel {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    float lvl = [defaults floatForKey:@"levelJogador"];
    if (lvl <= 0)
        return 1;
    return lvl;
}

-(void) setLevel: (float)value {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:value forKey:@"levelJogador"];
    [defaults synchronize];
}

-(float) getXP {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    float lvl = [defaults floatForKey:@"xpJogador"];
    if (lvl <= 0)
        return 0;
    return lvl;
}

-(void) setXP: (float)value {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:value forKey:@"xpJogador"];
    [defaults synchronize];
}

-(float) getLevelXP {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    float lvl = [defaults floatForKey:@"levelXP"];
    if (lvl <= 0)
        return 10;
    return lvl;
}

-(void) setLevelXP: (float)value {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:value forKey:@"levelXP"];
    [defaults synchronize];
}

-(NSArray*) getAtaques {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* ataques = [defaults objectForKey:@"ataquesJogador"];
    if (!ataques)
        ataques = _jogador.ataques;
    return ataques;
}

-(void) setAtaques: (NSArray*) value {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:@"ataquesJogador"];
    [defaults synchronize];
}

- (void)adicionaAtaque:(NSString *)ataque {
    NSMutableArray* novosAtaques = [[NSMutableArray alloc] initWithArray:self.ataques];
    [novosAtaques addObject:ataque];
    self.ataques = novosAtaques;
}

- (void)adicionaId:(NSString *)key {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey: key];
    [defaults synchronize];
}

- (BOOL) contemId: (NSString*) key {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}
@end
