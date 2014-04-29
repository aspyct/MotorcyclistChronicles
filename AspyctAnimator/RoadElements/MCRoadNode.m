//
//  MCRoadNode.m
//  AspyctAnimator
//
//  Created by Antoine d'Otreppe on 29/04/14.
//  Copyright (c) 2014 Antoine d'Otreppe. All rights reserved.
//

#import "MCRoadNode.h"

@implementation MCRoadNode

+ (MCRoadNode *)roadInRect:(CGRect)rect lanes:(NSUInteger)lanes
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Create the intermediary (dashed) lines.
    // There are `lanes - 1` intermediary lines.
    for (NSUInteger i = 0; i <= lanes; i += 1) {
        CGFloat lineX = rect.origin.x + rect.size.width / lanes * i;
        CGFloat lineStartY = rect.origin.y;
        CGFloat lineEndY = lineStartY + rect.size.height;
        
        if (i == 0 || i == lanes) {
            // it's either the first or last line.
        }
        
        CGPathMoveToPoint(path, NULL, lineX, lineStartY);
        CGPathAddLineToPoint(path, NULL, lineX, lineEndY);
    }
    
    // Create the shape
    MCRoadNode *road = [MCRoadNode node];
    road.path = path;
    
    return road;
}

@end
