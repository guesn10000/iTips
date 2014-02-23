//
//  GUOCheckMarkRecognizer.m
//  CheckPlease
//
//  Created by guo on 13-4-7.
//  Copyright (c) 2013年 guo. All rights reserved.
//

#import "DrawRecognizer.h"
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#define kMinimumCheckMarkAngle 50
#define kMaximumCheckMarkAngle 135
#define kMinimumCheckMarkLength 10

@implementation DrawRecognizer
@synthesize lastPreviousPoint;
@synthesize lastCurrentPoint;
@synthesize lineLengthSoFar;

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    lastPreviousPoint = point;
    lastCurrentPoint = point;
    lineLengthSoFar = 0.0f;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint previousPoint = [touch previousLocationInView:self.view];
    CGPoint currentPoint = [touch locationInView:self.view];
    CGFloat angle = angleBetweenLines(lastPreviousPoint, lastCurrentPoint, previousPoint, currentPoint);
    if (angle >= kMinimumCheckMarkAngle && angle <= kMaximumCheckMarkAngle && lineLengthSoFar >= kMinimumCheckMarkLength) {
        self.state = UIGestureRecognizerStateEnded;
    }
    else if (lineLengthSoFar >= 30 * kMinimumCheckMarkLength && (angle <= kMinimumCheckMarkAngle || angle >= kMaximumCheckMarkAngle)) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"手势错误" delegate:nil cancelButtonTitle:@"再试一次" otherButtonTitles:nil, nil];
        [alert show];
    }
    lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
    lastPreviousPoint = previousPoint;
    lastCurrentPoint = currentPoint;
}

@end
