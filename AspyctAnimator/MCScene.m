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
@property (strong, nonatomic) SKShapeNode *drawnShape;

@end

enum {
    ARROW_LEFT = 123,
    ARROW_RIGHT = 124,
    ARROW_DOWN = 125,
    ARROW_UP = 126,
    SPACE = 49,
    BACKSPACE = 51,
    DELETE = 117
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
            if (!self.paused) {
                [self.delegate nextStepRequested:self];
            }
            break;
        }
        case ARROW_LEFT:
        {
            if (!self.paused) {
                [self.delegate previousStepRequested:self];
            }
            break;
        }
        case BACKSPACE:
        {
            [self reset];
            break;
        }
        case SPACE:
        {
            self.paused = !self.paused;
        }
        case DELETE:
        {
            [self removeDrawings];
            break;
        }
        default:
        {
            NSLog(@"Pressed key: %u", theEvent.keyCode);
        }
    }
}

- (void)reset
{
    [self.delegate resetRequested:self];
    self.paused = NO;
    
    [self removeDrawings];
}

- (void)removeDrawings
{
    [self.drawnShape removeFromParent];
    self.drawnShape = nil;
}

- (void)mouseDown:(NSEvent *)theEvent
{
    CGPoint location = [theEvent locationInNode:self];
    CGMutablePathRef path;
    
    if (self.drawnShape == nil) {
        self.drawnShape = [[SKShapeNode alloc] init];
        [self addChild:self.drawnShape];
        
        path = CGPathCreateMutable();
    } else {
        path = CGPathCreateMutableCopy(self.drawnShape.path);
    }
    
    CGPathMoveToPoint(path, NULL, location.x, location.y);
    self.drawnShape.strokeColor = [NSColor redColor];
    self.drawnShape.path = path;
    
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    CGPoint location = [theEvent locationInNode:self];
    
    CGMutablePathRef path = CGPathCreateMutableCopy(self.drawnShape.path);
    CGPathAddLineToPoint(path, NULL, location.x, location.y);
    self.drawnShape.path = path;
    
    // TODO Some CGPaths are probably leaking
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    CGFloat x = [theEvent locationInNode:self].x;
    CGFloat y = [theEvent locationInNode:self].y;
    self.mousePositionLabel.text = [NSString stringWithFormat:@"(%.0f,%.0f)", x, y];
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

@end
