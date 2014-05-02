//
//  MCScenario.h
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCScene.h"

@interface MCScenario : NSObject

#pragma mark - Public interface

- (id)initWithScene:(MCScene *)scene;
- (void)forward;

#pragma mark - Protected interface

- (void)registerStep:(SEL)step;
- (void)prepare;
- (void)finalStep;

@end
