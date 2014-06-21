//
//  Pipe.m
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import "Pipe.h"
#import "Contants.h"

@implementation Pipe

+(void)addNewNodeTo:(SKNode *)parentNode{
    
    CGFloat offset = 620;
    CGFloat startY = -50.0f + arc4random_uniform(4) * 60.0f;
    [parentNode addChild:[self createPipeY:(offset + startY) isTopPipe:YES]];
    [parentNode addChild:[self createHole:(startY)]];
    [parentNode addChild:[self createPipeY:startY isTopPipe:NO]];
}

+(id)createPipeY:(CGFloat)y isTopPipe:(BOOL)isTopPipe{
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:@"pipe.png"];
    node.position = CGPointMake(320, y);
    node.yScale = isTopPipe ? 1.0f : -1.0f;
    node.zPosition = 0;
    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:node.size];
    node.physicsBody.dynamic = NO;
    node.physicsBody.categoryBitMask = pipeType;
    node.physicsBody.collisionBitMask = holeType;
    node.physicsBody.contactTestBitMask = heroType;
    [self animtaion:node];
    return node;
}

+(id)createHole:(CGFloat)startY{
    CGSize size = CGSizeMake(52, 85);
    SKSpriteNode *node = [SKSpriteNode node];
    node.position = CGPointMake(320, startY);
    node.zPosition = 0;
    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    node.physicsBody.dynamic = NO;
    node.physicsBody.categoryBitMask = holeType;
    node.physicsBody.contactTestBitMask = heroType;
    node.physicsBody.collisionBitMask = 0;
    [self animtaion:node];
    return node;
}

+(void)animtaion:(SKNode *)node{
    [node runAction:
     [SKAction sequence:@[
                          [SKAction moveToX:-50 duration:6.0],
                          [SKAction removeFromParent]]]];
     
     
}
@end
