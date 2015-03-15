//
//  GameOverViewController.m
//  TrabalhoRPG
//
//  Created by João Vitor on 3/15/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "GameOverViewController.h"
#import "EstadoJogo.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController

- (void)viewWillAppear:(BOOL)animated {
    [[EstadoJogo unico] descartarJogo];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = item;
}


- (void) back {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
