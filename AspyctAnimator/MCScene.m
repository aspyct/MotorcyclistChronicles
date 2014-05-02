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

@property (strong, nonatomic) SKLabelNode *mousePositionLabel;

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
        self.mousePositionLabel = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
        self.mousePositionLabel.zPosition = 1;
        self.mousePositionLabel.fontSize = 21;
        self.mousePositionLabel.position = CGPointMake(50, 10);
        [self addChild:self.mousePositionLabel];
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

- (void)rightMouseDown:(NSEvent *)theEvent
{
    NSLog(@"Right mouse up");
}

- (void)rightMouseUp:(NSEvent *)theEvent
{
    NSLog(@"Right mouse down");
}

-(void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"Mouse down");
}

- (void)scrollWheel:(NSEvent *)theEvent
{
    NSLog(@"This is how i Scroll!");
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    CGFloat x = [theEvent locationInNode:self].x;
    CGFloat y = [theEvent locationInNode:self].y;
    self.mousePositionLabel.text = [NSString stringWithFormat:@"(%.0f,%.0f)", x, y];
    
}

- (void)mouseUp:(NSEvent *)theEvent
{
    // TODO remove the temporary line
    // Or perform next step if no line is being drawn
    NSLog(@"Mouse up");
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
