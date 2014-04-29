//
//  AAAppDelegate.h
//  AspyctAnimator
//

//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>

#import "MCScene.h"

@interface MCAppDelegate : NSObject <NSApplicationDelegate, MCSceneDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet SKView *skView;

@end
