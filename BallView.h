//
//  GUOBallView.h
//  Ball
//
//  Created by guo on 13-4-9.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "SaveDataToFile.h"
#import <AudioToolbox/AudioToolbox.h>

@interface GUOBallView : UIView
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) CGPoint currentPoint;
@property (assign, nonatomic) CGPoint previousPoint;
@property (assign, nonatomic) CMAcceleration acceleration;
@property (assign, nonatomic) CGFloat ballXVelocity;
@property (assign, nonatomic) CGFloat ballYVelocity;
@property (assign, nonatomic) SystemSoundID soundID;
@end
