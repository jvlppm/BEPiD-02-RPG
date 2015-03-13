//
//  CenaViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/12/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "CenaViewController.h"
#include "Cenario.h"
#include "EstadoJogo.h"

@interface CenaViewController ()

@end

@implementation CenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    // Do view setup here.
}

- (void) refresh {
    EstadoJogo* estado = [EstadoJogo unico];
    Cenario* atual = estado.cenaAtual;
    if (atual) {
        
    }
}

@end
