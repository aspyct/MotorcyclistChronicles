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

- (void)prepare:(MCScene *)scene;
- (void)forward:(MCScene *)scene;

#pragma mark - Protected interface

- (void)registerStep:(SEL)step;

@end
