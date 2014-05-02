//
//  MC3BusScenario.m
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import "MC3BusScenario.h"

@interface MC3BusScenario ()

@property (strong, nonatomic) SKNode *world;
@property (strong, nonatomic) SKSpriteNode *road;
@property (strong, nonatomic) SKSpriteNode *motorcycle;
@property (strong, nonatomic) SKSpriteNode *car;
@property (strong, nonatomic) SKSpriteNode *bus;
@property (strong, nonatomic) SKSpriteNode *leftie;

@end

@implementation MC3BusScenario

- (id)initWithScene:(MCScene *)scene
{
    self = [super init];
    
    if (self) {
        self.world = [SKNode node];
        [scene addChild:self.world];
        
        [self registerStep:@selector(theresABike)];
        [self registerStep:@selector(theresACar)];
        [self registerStep:@selector(theresABus)];
        [self registerStep:@selector(weAreMovingForward)];
        [self registerStep:@selector(moveCameraUp)];
        [self registerStep:@selector(destinyAwaits)];
        [self registerStep:@selector(iWasActuallyOnTheRight)];
        [self registerStep:@selector(takingLargeTurn)];
        [self registerStep:@selector(soMeToo)];
        [self registerStep:@selector(lifeContinued)];
    }
    
    return self;
}

- (void)prepare
{
    [self.world removeAllChildren];
    
    self.road = [SKSpriteNode spriteNodeWithImageNamed:@"mc3-road"];
    self.road.texture.filteringMode = SKTextureFilteringLinear;
    self.road.position = CGPointMake(self.world.parent.scene.size.width / 2, 0);
    self.road.anchorPoint = CGPointMake(0.5, 0);
    [self.road setScale:1];
    
    [self.world addChild:self.road];
    
    self.leftie = [SKSpriteNode spriteNodeWithImageNamed:@"bluecar"];
    self.leftie.zRotation = M_PI;
    [self.leftie setScale:0.5];
    self.leftie.position = CGPointMake(565, 1020);
    [self.world addChild:self.leftie];
}

- (void)theresABike
{
    self.motorcycle = [SKSpriteNode spriteNodeWithImageNamed:@"moto"];
    [self.motorcycle setScale:0.5];
    
    [self motorcycleIsAtOrigin];
    
    [self.world addChild:self.motorcycle];
}

- (void)motorcycleIsAtOrigin
{
    self.motorcycle.position = CGPointMake(707, 101);
}

- (void)theresACar
{
    self.car = [SKSpriteNode spriteNodeWithImageNamed:@"bluecar"];
    [self.car setScale:0.5];
    
    [self carIsAtOrigin];
    
    [self.world addChild:self.car];
}

- (void)carIsAtOrigin
{
    self.car.position = CGPointMake(795, 207);
}

- (void)weAreMovingForward
{
    // Mistake: I'm crossing the road at the same time as the car, looks dangerous
    // Didn't realize it until I made this animation
    
    SKAction *moveMotorcycle = [SKAction moveByX:0 y:284 duration:1];
    moveMotorcycle.timingMode = SKActionTimingLinear;

    SKAction *moveCar = [SKAction moveByX:0 y:204 duration:1];
    moveCar.timingMode = SKActionTimingEaseOut;
    
    [self.motorcycle runAction:moveMotorcycle];
    [self.car runAction:moveCar];
}

- (void)theresABus
{
    self.bus = [SKSpriteNode spriteNodeWithImageNamed:@"bus"];
    self.bus.position = CGPointMake(643, 550);
    
    [self.world addChild:self.bus];
}

- (void)destinyAwaits
{
    // The destiny was waiting for me, the car of doom advances
    CGMutablePathRef carPath = CGPathCreateMutable();
    CGPathMoveToPoint(carPath, NULL, 0, 0);
    CGPathAddCurveToPoint(carPath, NULL,
                          0, -175,
                          20, -225,
                          45, -250);
    
    SKAction *moveCar = [SKAction followPath:carPath duration:1];
    moveCar.timingMode = SKActionTimingEaseOut;
    [self.leftie runAction:moveCar];
}

- (void)iWasActuallyOnTheRight
{
    // I knew the bus could hide a leftie, so I kept to the right, to have a better visibility
    // Also, I slowed down beforehand
    SKAction *move = [SKAction moveByX:31 y:0 duration:0.3];
    move.timingMode = SKActionTimingEaseInEaseOut;
    [self.motorcycle runAction:move];
}

- (void)moveCameraUp
{
    // Let's see what's happening a bit further
    self.world.position = CGPointMake(self.world.position.x, self.world.position.y - 300);
}

- (void)takingLargeTurn
{
    // The car at the right unexpectedly went on my lane to have a larger turn
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddCurveToPoint(path,
                          NULL,
                          0, 40,
                          -20, 80,
                          -20, 120);
    
    SKAction *action = [SKAction followPath:path duration:1];
    action.timingMode = SKActionTimingEaseIn;
    
    SKAction *motoAction = [SKAction moveByX:0 y:120 duration:1];
    action.timingMode = SKActionTimingEaseIn;
    
    [self.car runAction:action];
    [self.motorcycle runAction:motoAction];
}

- (void)soMeToo
{
    // Didn't have any choice but to do the same
    self.motorcycle.position = CGPointMake(self.motorcycle.position.x, 385);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddCurveToPoint(path,
                          NULL,
                          0, 40,
                          -20, 80,
                          -20, 120);
    
    SKAction *action = [SKAction followPath:path duration:1];
    action.timingMode = SKActionTimingEaseIn;
    
    [self.motorcycle runAction:action];
}

- (void)lifeContinued
{
    CGMutablePathRef carPath = CGPathCreateMutable();
    CGPathMoveToPoint(carPath, NULL, 0, 0);
    CGPathAddCurveToPoint(carPath, NULL,
                          0, 100,
                          100, 100,
                          200, 100);
    
    SKAction *moveCarAction = [SKAction followPath:carPath duration:1];
    
    CGMutablePathRef motoPath = CGPathCreateMutable();
    CGPathMoveToPoint(motoPath, NULL, 0, 0);
    CGPathAddCurveToPoint(motoPath, NULL,
                          -10, 300,
                          0, 350,
                          10, 450);
    SKAction *moveMotorcycleAction = [SKAction followPath:motoPath duration:1];
    
    [self.car runAction:moveCarAction];
    [self.motorcycle runAction:moveMotorcycleAction];
}

@end
