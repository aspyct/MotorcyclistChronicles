//
//  AAMyScene.h
//  AspyctAnimator
//

//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class MCScene;

@protocol MCSceneDelegate <NSObject>

@required
- (void)nextStepRequested:(MCScene *)scene;
- (void)previousStepRequested:(MCScene *)scene;

@end

@interface MCScene : SKScene

@property (weak, nonatomic) id<MCSceneDelegate> delegate;

@end
