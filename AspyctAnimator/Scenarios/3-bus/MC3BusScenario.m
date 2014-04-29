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
        [self registerStep:@selector(onARoadWithTwoLanes:)];
        [self registerStep:@selector(theresABike:)];
    }
    
    return self;
}

- (void)onARoadWithTwoLanes:(MCScene *)scene
{
    CGRect roadRect = CGRectMake(200, 200, 300, 500);
    MCRoadNode *road = [MCRoadNode roadInRect:roadRect lanes:2];
    [scene addChild:road];
}

- (void)theresABike:(MCScene *)scene
{
    
}

@end
