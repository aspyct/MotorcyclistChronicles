//
//  AAAppDelegate.m
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import "MCAppDelegate.h"
#import "MCScenario.h"
#import "MC3BusScenario.h"

@interface MCAppDelegate ()

@property (strong, nonatomic) MCScenario *scenario;

@end

@implementation MCAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    /* Pick a size for the scene */
    MCScene *scene = [MCScene sceneWithSize:CGSizeMake(1680, 1050)];
    
    scene.delegate = self;

    /* Set the scale mode to scale to fit the window */
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    self.scenario = [[MC3BusScenario alloc] init];

    [self.skView presentScene:scene];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

#pragma mark - MCSceneDelegate

- (void)nextStepRequested:(MCScene *)scene
{
    [self.scenario forward:scene];
}

- (void)previousStepRequested:(MCScene *)scene
{
    NSLog(@"Back");
}

@end
