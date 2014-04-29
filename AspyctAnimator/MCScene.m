//
//  AAMyScene.m
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import "MCScene.h"
#import "MCRoadNode.h"

@interface MCScene ()

@property (strong, nonatomic) SKSpriteNode *spaceship;
@property (strong, nonatomic) NSArray *steps;
@property (nonatomic) NSUInteger nextStep;

@end

enum {
    ARROW_LEFT = 123,
    ARROW_RIGHT = 124,
    ARROW_DOWN = 125,
    ARROW_UP = 126
};

@implementation MCScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        self.spaceship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        self.steps = @[@"step1", @"step2"];
        
        /*
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
         */
    }
    return self;
}

- (void)keyDown:(NSEvent *)theEvent
{
    // Nothing to do, just avoid the beep
}

- (void)keyUp:(NSEvent *)theEvent
{
    switch (theEvent.keyCode) {
        case ARROW_RIGHT:
        {
            [self.delegate nextStepRequested:self];
            break;
        }
        case ARROW_LEFT:
        {
            [self.delegate previousStepRequested:self];
            break;
        }
    }
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSLog(@"Mouse dragged");
}

-(void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"Mouse down");
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    // TODO draw a temporary line
    NSLog(@"Mouse moved");
}

- (void)mouseUp:(NSEvent *)theEvent
{
    // TODO remove the temporary line
    // Or perform next step if no line is being drawn
    NSLog(@"Mouse up");
}

- (void)step1
{
    CGRect roadRect = CGRectMake(200, 200, 300, 500);
    MCRoadNode *road = [MCRoadNode roadInRect:roadRect lanes:2];
    [self addChild:road];
    
    self.spaceship.position = CGPointMake(200, 400);
    self.spaceship.scale = 0.5;
    
    SKAction *action = [SKAction group:@[[SKAction rotateByAngle:M_PI duration:1],
                                         [SKAction moveByX:200 y:20 duration:4]]];
    
    [self.spaceship runAction:action];
    [self addChild:self.spaceship];
}

- (void)step2
{
    SKAction *action = [SKAction scaleTo:1 duration:2];
    [self.spaceship runAction:action];
}

- (void)lastStep
{
    [self removeAllChildren];
    
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    [label setScale:0];
    label.text = @"That's it folks !";
    label.fontSize = 120;
    label.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    
    [self addChild:label];
    [label runAction:[SKAction scaleTo:1 duration:0.3]];
}

#pragma mark - Helpers

@end
