//
//  EstadoJogo.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/13/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

// Estado atual do jogo em andamento

#import "EstadoJogo.h"
#include "Mundo.h"

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
@end
