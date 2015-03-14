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
    NSString* objKey;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        objKey = @"object";
    }
    return self;
}

- (void) setBackground: (NSString*) image {
    if (background)
        [background removeFromParent];
    
    background = [[SKSpriteNode alloc] initWithImageNamed:image];
    background.anchorPoint = CGPointMake(0, 0);
    background.size = self.frame.size;
    
    [self addChild:background];
}

- (void) setObjects: (NSArray*) objects {
    int i = 0;
    for(Objeto* obj in objects) {
        SKSpriteNode* objNode = [[SKSpriteNode alloc] initWithImageNamed:obj.imagem];
        
        [self addChild:objNode];
        
        CGSize tela = self.frame.size;
        
        objNode.anchorPoint = CGPointMake(0, 1);
        objNode.name = [[NSString alloc] initWithFormat:@"obj%d", i++];
        objNode.userData = [NSMutableDictionary dictionaryWithObject:obj forKey:objKey];
        
        [objNode setPosition:CGPointMake(
                                         tela.width * obj.posicao.origin.x,
                                         tela.height * (1 - obj.posicao.origin.y))];
        
        float w = tela.width * obj.posicao.size.width;
        float h = tela.height * obj.posicao.size.height;
        
        [objNode setXScale:w/objNode.frame.size.width];
        [objNode setYScale:h/objNode.frame.size.height];
    }
}

//handle touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    Objeto* obj = node.userData[objKey];
    
    if(obj && self.gameDelegate) {
        [self.gameDelegate objectTapped:obj];
    }
}

@end
