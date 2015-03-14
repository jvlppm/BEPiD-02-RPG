//
//  GameScene.h
//  TrabalhoRPG
//
//  Created by João Vitor on 3/14/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Objeto.h"

@protocol GameSceneDelegate <NSObject>

- (void) objectTapped: (Objeto*) obj;

@end

@interface GameScene : SKScene

@property (weak) id <GameSceneDelegate> gameDelegate;

- (void) setBackground: (NSString*) image;
- (void) setObjects: (NSArray*) objects;

@end
