//
//  BattleViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor on 3/14/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblNomeInimigo;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeJogador;
@property (weak, nonatomic) IBOutlet UIProgressView *pbInimigo;
@property (weak, nonatomic) IBOutlet UIProgressView *pbJogador;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
