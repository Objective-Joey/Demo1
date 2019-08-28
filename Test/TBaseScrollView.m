//
//  TBaseScrollView.m
//  Test
//
//  Created by btcc on 27/8/2019.
//  Copyright © 2019 btcc. All rights reserved.
//

#import "TBaseScrollView.h"

@implementation TBaseScrollView

/**
 同时识别多个手势
 
 @param gestureRecognizer gestureRecognizer description
 @param otherGestureRecognizer otherGestureRecognizer description
 @return return value description
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
//    if (![otherGestureRecognizer.view isKindOfClass:[TBaseScrollView class]]) {
//        
//        CGPoint orgin = self.frame.origin;
//        if (orgin.y==0 && self.contentOffset.y >= 0) {
//            return NO;
//        }
//        if (orgin.y==100) {
//            UIPanGestureRecognizer * pan  = (UIPanGestureRecognizer *) otherGestureRecognizer;
//            CGPoint point =  [pan velocityInView:self];
//            if (fabs(point.y)>fabs(point.x) && point.y<0) {
//                return NO;
//            }
//        }
//
//    }
    
    return YES;
}

@end
