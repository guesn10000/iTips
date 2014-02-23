//
//  GUODesktopViewController.h
//  iTips
//
//  Created by guo on 13-4-22.
//  Copyright (c) 2013年 guo5. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BallView.h"
#import "DrawRecognizer.h"
#import <CoreMotion/CoreMotion.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SaveDataToFile.h"
#define kAccelerationThreshold 1.7
#define kUpdateInterval (1.0f / 60.0f)
#define kMinimumGestureLength    25
#define kMaximumVariance         5
//#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
//#define BARBUTTON(TITLE, SELECTOR) 	[[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR] autorelease]
#define POINT(X)	[[self.points objectAtIndex:X] CGPointValue]

@interface LoginViewController : UIViewController <UIAccelerometerDelegate, UIGestureRecognizerDelegate>

{
	NSMutableArray *points;
	CGRect circle;
}
@property (retain) NSMutableArray *points;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (assign, nonatomic) BOOL brokenScreenShowing;
@property (assign, nonatomic) SystemSoundID soundID;
@property (strong, nonatomic) UIImage *fixed;
@property (strong, nonatomic) UIImage *broken;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSString *passWord;
@property (strong, nonatomic) NSString *mainViewBackground;
@property (nonatomic) CGPoint gestureStartPoint;
@property (weak, nonatomic) IBOutlet UIView *circleTouch;
@end

