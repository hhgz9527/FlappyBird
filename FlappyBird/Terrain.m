//
//  Terrain.m
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import "Terrain.h"
#import "Contants.h"

@implementation Terrain

+(void)addTerrain:(SKNode *)parentNode{
    SKTexture *terrainTexture = [SKTexture textureWithImageNamed:@"terrain.png"];    
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithTexture:terrainTexture size:CGSizeMake(640, 60)];
    node.zPosition = 1;
    node.anchorPoint = CGPointMake(0, 1);
    node.position = CGPointMake(0.0f, 60);
    [parentNode addChild:node];
    [node runAction:[SKAction repeatActionForever:
                     [SKAction sequence:@[
                                          [SKAction moveToX:-320 duration:5.0], [SKAction moveToX:0 duration:0.0f]
                                          ]]]];
    
    SKNode *terrainNode = [SKNode node];
    terrainNode.position = CGPointMake(160.0f, 35);
    terrainNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(320, 20)];
    terrainNode.physicsBody.dynamic = NO;
    terrainNode.physicsBody.affectedByGravity = 0;
    terrainNode.physicsBody.categoryBitMask = terrainType;
    terrainNode.physicsBody.contactTestBitMask = heroType;
    [parentNode addChild:terrainNode];
    
    
}

@end
