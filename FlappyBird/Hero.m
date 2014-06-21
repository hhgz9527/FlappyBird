//
//  Hero.m
//  FlappyBird
//
//  Created by GaoYu on 14-6-20.
//  Copyright (c) 2014年 Warlock. All rights reserved.
//

#import "Hero.h"
#import "Contants.h"

@implementation Hero

- (instancetype)init
{
    self = [super initWithImageNamed:@"hero1.png"];
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.width * .95f, self.size.height * .95f)];
        self.physicsBody.dynamic = YES;
        self.physicsBody.categoryBitMask = heroType;
        self.physicsBody.collisionBitMask = 0;
        self.physicsBody.contactTestBitMask = pipeType;
        NSArray *animation = @[[SKTexture textureWithImageNamed:@"hero1"],[SKTexture textureWithImageNamed:@"hero2"]];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:animation timePerFrame:0.5f resize:NO restore:YES]] withKey:@"flyHero"];
        
    }
    return self;
}

+(id)createNodeOn:(SKNode *)parent{
    id hero = [[Hero alloc] init];
    [parent addChild:hero];
    return hero;
}

+(id)createSpriteOn:(SKNode *)parent{
    SKNode *hero = [self createNodeOn:parent];
    hero.physicsBody = nil;
    return hero;
}

-(void)flap{
    self.physicsBody.velocity = CGVectorMake(0, 0);
    [self.physicsBody applyImpulse:CGVectorMake(0, 3)];
}

-(void)update{
    if (self.physicsBody.velocity.dy > 30.0) {
        self.zRotation = (CGFloat) M_PI / 6.0f;
    }else if (self.physicsBody.velocity.dy < -100.0){
        self.zRotation = - (CGFloat) M_PI / 4.0;
    }else{
        self.zRotation = 0.0f;
    }
}

-(void)godown{
    [self.physicsBody applyImpulse:CGVectorMake(0, -10)];
}
@end
