//
//  BattleViewController.h
//  TrabalhoRPG
//
//  Created by João Vitor on 3/14/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Personagem.h"

@interface BattleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property Personagem* inimigo;
@property NSString* idInimigo;

@end
