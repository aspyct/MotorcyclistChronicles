//
//  MC3BusScenario.m
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import "MC3BusScenario.h"

#import "MCRoadNode.h"

@implementation MC3BusScenario

- (id)init
{
    self = [super init];
    
    if (self) {
        [self registerStep:@selector(theresABike:)];
    }
    
    return self;
}

- (void)prepare:(MCScene *)scene
{
    SKTexture *texture = [SKTexture textureWithImageNamed:@"mc3-road"];
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithTexture:texture];
    background.texture.filteringMode = SKTextureFilteringLinear;
    background.position = CGPointMake(scene.size.width / 2, 0);
    background.anchorPoint = CGPointMake(0.5, 0);
    [background setScale:1];
    
    [scene addChild:background];
}

- (void)theresABike:(MCScene *)scene
{
    SKSpriteNode *motorcycle = [SKSpriteNode spriteNodeWithImageNamed:@"moto"];
    motorcycle.position = CGPointMake(718, 101);
    [motorcycle setScale:0.5];
    
    [scene addChild:motorcycle];
};

@end
