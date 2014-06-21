//
//  Contants.h
//  FlappyBird
//
//  Created by GaoYu on 14-6-21.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#ifndef FlappyBird_Contants_h
#define FlappyBird_Contants_h

typedef NS_OPTIONS(NSUInteger, CollisionCategory) {
    heroType    = (1 << 0),
    terrainType = (1 << 1),
    pipeType    = (1 << 2),
    holeType    = (1 << 3)
};

#endif
