//
//  GUOCheckMarkRecognizer.h
//  CheckPlease
//
//  Created by guo on 13-4-7.
//  Copyright (c) 2013年 guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawRecognizer : UIGestureRecognizer
@property (assign, nonatomic) CGPoint lastPreviousPoint;
@property (assign, nonatomic) CGPoint lastCurrentPoint;
@property (assign, nonatomic) CGFloat lineLengthSoFar;
@end
