//
//  Hero.h
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Hero : SKSpriteNode

+(id)createNodeOn:(SKNode *)parent;
+(id)createSpriteOn:(SKNode *)parent;

-(void)update;
-(void)godown;
-(void)flap;

@end
