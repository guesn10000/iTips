//
//  GUODesktopViewController.m
//  iTips
//
//  Created by guo on 13-4-22.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize imageView;
@synthesize motionManager;
@synthesize brokenScreenShowing;
@synthesize soundID;
@synthesize fixed;
@synthesize broken;
@synthesize queue;

@synthesize points;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    _passWord = [loadDataFromFile loadGameData2:@"PassWord"][0];
    _mainViewBackground = [loadDataFromFile loadGameData2:@"MainViewBackground"][0];
    if ([_mainViewBackground isEqualToString:@"海底的泡泡龙"]) {
        self.fixed = [UIImage imageNamed:@"sea.png"];
    }
    else if ([_mainViewBackground isEqualToString:@"天空的小鸟"]) {
        self.fixed = [UIImage imageNamed:@"sky.png"];
    }
    else {//@"宇宙与地球"
        self.fixed = [UIImage imageNamed:@"yuzhou.png"];
    }

    
    imageView.image = fixed;
    self.view.backgroundColor = [UIColor colorWithPatternImage:imageView.image];
    self.motionManager = [[CMMotionManager alloc] init];
    self.queue = [[NSOperationQueue alloc] init];
    self.motionManager.accelerometerUpdateInterval = kUpdateInterval;
    [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error) {
         [(id)self.view setAcceleration:accelerometerData.acceleration];
         [self.view performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:NO];
     }];
    
    if ([_passWord isEqualToString:@"打钩"]) {
        DrawRecognizer *check = [[DrawRecognizer alloc] initWithTarget:self action:@selector(finishGuesture:)];
        [self.view addGestureRecognizer:check];
    }
    
    else if ([_passWord isEqualToString:@"翻页"]) {
        UISwipeGestureRecognizer *horizontal =
        [[UISwipeGestureRecognizer alloc]
         initWithTarget:self action:@selector(reportHorizontalSwipe:)];
        horizontal.direction = UISwipeGestureRecognizerDirectionLeft|
        UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:horizontal];
    }
    
    else if ([_passWord isEqualToString:@"摇动"]) {
        DrawRecognizer *check = [[DrawRecognizer alloc] initWithTarget:self action:nil];
        [self.view addGestureRecognizer:check];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
        NSURL *url = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
        
        CMMotionManager *motionManager2 = [[CMMotionManager alloc] init];
        motionManager2.accelerometerUpdateInterval = kUpdateInterval;
        NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
        [motionManager2 startAccelerometerUpdatesToQueue:queue2 withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            if (error) {
                [motionManager2 stopAccelerometerUpdates];
            }
            else {
                if (!brokenScreenShowing) {
                    CMAcceleration acceleration = accelerometerData.acceleration;
                    if (acceleration.x > kAccelerationThreshold || acceleration.y > kAccelerationThreshold || acceleration.z > kAccelerationThreshold) {
                        [imageView performSelectorOnMainThread:@selector(setImage:) withObject:broken waitUntilDone:NO];
                        self.view.backgroundColor = [UIColor colorWithPatternImage:imageView.image];
                        AudioServicesPlaySystemSound(soundID);
                        brokenScreenShowing = YES;
                        [self performSegueWithIdentifier:@"mainView" sender:self];
                    }
                }
            }
        }];
    }
    
    else if ([_passWord isEqualToString:@"划圆圈"]) {
        _circleTouch.hidden = NO;
    }
    
    else {// if ([_passWord isEqualToString:@"捏合"]) {
        DrawRecognizer *check = [[DrawRecognizer alloc] initWithTarget:self action:nil];
        [self.view addGestureRecognizer:check];
        UIPinchGestureRecognizer *pinchGesture =
        [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(doPinch:)];
        pinchGesture.delegate = self;
        [self.view addGestureRecognizer:pinchGesture];
    } 
}


- (void)doPinch:(UIPinchGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self performSegueWithIdentifier:@"mainView" sender:self];
    }
}

- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer
{
    [self performSegueWithIdentifier:@"mainView" sender:self];
}

- (void) finishGuesture: (DrawRecognizer *) gesture
{
    [self performSegueWithIdentifier:@"mainView" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



//----------------------------------------------------------------------------------------------------------------
// Return dot product of two vectors normalized
float dotproduct (CGPoint v1, CGPoint v2)
{
	float dot = (v1.x * v2.x) + (v1.y * v2.y);
	float a = ABS(sqrt(v1.x * v1.x + v1.y * v1.y));
	float b = ABS(sqrt(v2.x * v2.x + v2.y * v2.y));
	dot /= (a * b);
	
	return dot;
}

// Return distance between two points
float distance (CGPoint p1, CGPoint p2)
{
	float dx = p2.x - p1.x;
	float dy = p2.y - p1.y;
	
	return sqrt(dx*dx + dy*dy);
}

// Calculate and return least bounding rectangle
- (CGRect) centeredRectangle
{
	float x = 0.0f;
	float y = 0.0f;
	for (NSValue *pt in self.points)
	{
		x += [pt CGPointValue].x;
		y += [pt CGPointValue].y;
	}
	
	// Calculate weighted center
	x /= self.points.count;
	y /= self.points.count;
	
	float minx = 9999.0f;
	float maxx = -9999.0f;
	float miny = 9999.0f;
	float maxy = -9999.0f;
	
	for (NSValue *pt in self.points)
	{
		minx = MIN(minx, [pt CGPointValue].x);
		miny = MIN(miny, [pt CGPointValue].y);
		maxx = MAX(maxx, [pt CGPointValue].x);
		maxy = MAX(maxy, [pt CGPointValue].y);
	}
	
	return CGRectMake(minx, miny, (maxx - minx), (maxy - miny));
}

// Return a point with respect to a given origin
CGPoint centerPoint(CGPoint pt, CGPoint origin)
{
	return CGPointMake(pt.x - origin.x, pt.y - origin.y);
}

// On new touch, start a new array of points
- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
	self.points = [NSMutableArray array];
	CGPoint pt = [[touches anyObject] locationInView:self.circleTouch];
	[self.points addObject:[NSValue valueWithCGPoint:pt]];
}

// Add each point to the array
- (void) touchesMoved:(NSSet *) touches withEvent:(UIEvent *) event
{
	CGPoint pt = [[touches anyObject] locationInView:self.circleTouch];
	[self.points addObject:[NSValue valueWithCGPoint:pt]];
}

// At the end of touches, determine whether a circle was drawn
- (void) touchesEnded:(NSSet *) touches withEvent:(UIEvent *) event
{
	if (!self.points) {
        return;
    }
	if (self.points.count < 3) {
        return;
    }
    
    
	// Test 1: The start and end points must be between 60 pixels of each other
	CGRect tcircle;
	if (distance(POINT(0), POINT(self.points.count - 1)) < 60.0f)
	{
        tcircle = [self centeredRectangle];
    }
    
	// Test 2: Count the distance traveled in degrees. Must fall within 45 degrees of 2 PI
	CGPoint center = CGPointMake(CGRectGetMidX(tcircle), CGRectGetMidY(tcircle));
	float distance = ABS(acos(dotproduct(centerPoint(POINT(0), center), centerPoint(POINT(1), center))));
	for (int i = 1; i < (self.points.count - 1); i++)
		distance += ABS(acos(dotproduct(centerPoint(POINT(i), center), centerPoint(POINT(i+1), center))));
	if ((ABS(distance - 2 * M_PI) < (M_PI / 4.0f))) {
        circle = tcircle;
        [self performSegueWithIdentifier:@"mainView" sender:self];
    }
    
}

@end
