//
//  GameScene.m
//  TrabalhoRPG
//
//  Created by João Vitor on 3/14/15.
//  Copyright (c) 2015 João Vitor P. Moraes. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKSpriteNode* background;
}

- (void) setBackground: (NSString*) image {
    if (background)
        [background removeFromParent];
    
    background = [[SKSpriteNode alloc] initWithImageNamed:image];
    background.size = self.frame.size;
    background.position = CGPointMake(
                                      self.frame.size.width / 2,
                                      self.frame.size.height / 2);
    
    
    [self addChild:background];
}

@end
