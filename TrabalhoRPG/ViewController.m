//
//  ViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor P. Moraes on 3/11/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "ViewController.h"
#import "EstadoJogo.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnNewGame;
@property (weak, nonatomic) IBOutlet UIImageView *ivCenaAtual;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    EstadoJogo* estado = [EstadoJogo unico];
    self.ivCenaAtual.image = [UIImage imageNamed:estado.cenaAtual.imagem];
    self.btnNewGame.enabled = !estado.novoJogo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)novoJogo:(id)sender {
    EstadoJogo* estado = [EstadoJogo unico];
    [estado descartarJogo];
}
@end
