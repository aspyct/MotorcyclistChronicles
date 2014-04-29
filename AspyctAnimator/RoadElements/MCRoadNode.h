//
//  MCRoadNode.h
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MCRoadNode : SKShapeNode

+ (MCRoadNode *)roadInRect:(CGRect)rect lanes:(NSUInteger)lanes;

@end
