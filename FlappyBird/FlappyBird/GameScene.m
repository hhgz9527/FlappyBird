//
//  GameScene.m
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import "GameScene.h"
#import "MenuScene.h"
#import "Contants.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_hero flap];
}

-(void)update:(NSTimeInterval)currentTime{
    [_hero update];
}

-(void)didMoveToView:(SKView *)view{
    [super didMoveToView:view];
    [self createBackgroundImage];
    [self createHero];
    [self createTerrain];
    [self timer];
}

-(void)createBackgroundImage{
    SKTexture *texture = [SKTexture textureWithImageNamed:@"background.png"];
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithTexture:texture size:self.view.frame.size];
    node.position = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    [self addChild:node];
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.gravity = CGVectorMake(0, -3);
}

-(void)createHero{
    _hero = [Hero createNodeOn:self];
    self.hero.position = CGPointMake(50.0f, 450.0f);
}

-(void)createTerrain{
    [Terrain addTerrain:self];
}

-(void)timer{
    _dietimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(createPipe) userInfo:nil repeats:YES];

}

-(void)createPipe{
    [Pipe addNewNodeTo:self];
}

-(void)die{
    [_dietimer invalidate];
    SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
    MenuScene *menu = [[MenuScene alloc] initWithSize:self.size];
    [self.scene.view presentScene:menu transition:reveal];
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    uint32_t collision = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask);
    if (collision == (heroType | pipeType)){
//        [_hero godown];
        [self die];
        NSLog(@"die");
    }else if (collision == (heroType | terrainType)){
        [self die];
        NSLog(@"die");
    }
}

-(void)didEndContact:(SKPhysicsContact *)contact{
    
}
@end
