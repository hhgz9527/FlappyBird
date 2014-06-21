//
//  GameScene.h
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Hero.h"
#import "Terrain.h"
#import "Pipe.h"

@interface GameScene : SKScene<SKPhysicsContactDelegate>

@property(nonatomic,retain)Hero *hero;
@property(nonatomic,retain)NSTimer *dietimer;

@end
