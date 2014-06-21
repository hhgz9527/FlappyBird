//
//  MenuScene.m
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import "MenuScene.h"
#import "Hero.h"
#import "Terrain.h"
#import "GameScene.h"

@implementation MenuScene

-(void)didMoveToView:(SKView *)view{
    [super didMoveToView:view];
    [self createBackgroundImage];
    [self createStartButton];
    [self createHero];
    [Terrain addTerrain:self];
}

-(void)createStartButton{
    SKSpriteNode *start = [SKSpriteNode spriteNodeWithImageNamed:@"start.png"];
    start.position = CGPointMake(CGRectGetMidX(self.view.frame), 400);
    start.name = @"start";
    [self addChild:start];
    self.scaleMode = SKSceneScaleModeAspectFit;

}

-(void)createHero{
    SKSpriteNode *hero = [Hero createSpriteOn:self];
    hero.position = CGPointMake(CGRectGetMidX(self.view.frame), 300);
    self.scaleMode = SKSceneScaleModeAspectFit;

}

-(void)createBackgroundImage{
    SKTexture *background = [SKTexture textureWithImageNamed:@"background.png"];
    SKSpriteNode *backgroundNode = [SKSpriteNode spriteNodeWithTexture:background size:self.view.frame.size];
    backgroundNode.position = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    [self addChild:backgroundNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:point];
        if ([node.name isEqualToString:@"start"]) {
            SKTransition *transition = [SKTransition fadeWithDuration:.5f];
            GameScene *game = [[GameScene alloc] initWithSize:self.size];
            [self.scene.view presentScene:game transition:transition];
        }
        
    }
}

@end
