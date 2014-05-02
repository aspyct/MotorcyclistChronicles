//
//  MCScenario.m
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import "MCScenario.h"

@interface MCScenario ()

@property (strong, nonatomic) NSMutableArray *steps;
@property (nonatomic) NSUInteger nextStep;

@end

@implementation MCScenario

- (id)init
{
    self = [super init];
    
    if (self) {
        self.steps = [NSMutableArray array];
    }
    
    return self;
}

- (void)prepare:(MCScene *)scene
{
    // Override me
}

- (void)finalStep:(MCScene *)scene
{
    // Override me
}

- (void)forward:(MCScene *)scene
{
    if (self.nextStep < self.steps.count) {
        NSString *nextStep = self.steps[self.nextStep];
        self.nextStep += 1;
        
        SEL nextStepSel = NSSelectorFromString(nextStep);
        [self performSelector:nextStepSel withObject:scene];
    } else if (self.nextStep == self.steps.count) {
        self.nextStep += 1;
        [self finalStep:scene];
    }
}

- (void)back:(MCScene *)scene
{
    
}

- (void)registerStep:(SEL)step
{
    [self.steps addObject:NSStringFromSelector(step)];
}

@end
