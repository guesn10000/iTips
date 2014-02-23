//
//  GUOBallView.m
//  Ball
//
//  Created by guo on 13-4-9.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "BallView.h"

@implementation GUOBallView
@synthesize soundID;

- (void)commonInit
{
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSString *mainViewBG;
    mainViewBG = [loadDataFromFile loadGameData2:@"MainViewBackground"][0];
    if ([mainViewBG isEqualToString:@"海底的泡泡龙"]) {
        self.image = [UIImage imageNamed:@"paopao.png"];
    }
    else if ([mainViewBG isEqualToString:@"天空的小鸟"]) {
        self.image = [UIImage imageNamed:@"bird.png"];
    }
    else {
        self.image = [UIImage imageNamed:@"diqiu.png"];
    }
    self.currentPoint = CGPointMake((self.bounds.size.width / 2.0f) +
                                    (self.image.size.width / 2.0f),
                                    (self.bounds.size.height / 2.0f) + (self.image.size.height / 2.0f));
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.image drawAtPoint:self.currentPoint];
}

#pragma mark -

- (void) setCurrentPoint:(CGPoint)newPoint {
    
    self.previousPoint = self.currentPoint;
    _currentPoint = newPoint;
    
    if (self.currentPoint.x < 0) {
        _currentPoint.x = 0;
        self.ballXVelocity = 0;
    }
    
    if (self.currentPoint.y < 0) {
        _currentPoint.y = 0;
        self.ballYVelocity = 0;
    }

    if (self.currentPoint.x > self.bounds.size.width - self.image.size.width) {
        _currentPoint.x = self.bounds.size.width - self.image.size.width;
        self.ballXVelocity = -(self.ballXVelocity / 2.0);
        //AudioServicesPlaySystemSound(soundID);
    }
    
    if (self.currentPoint.y > self.bounds.size.height - self.image.size.height) {
        _currentPoint.y = self.bounds.size.height - self.image.size.height;
        self.ballYVelocity = -(self.ballYVelocity / 2.0);
        //AudioServicesPlaySystemSound(soundID);
    }
    
    CGRect currentImageRect = CGRectMake(self.currentPoint.x, self.currentPoint.y, self.currentPoint.x + self.image.size.width, self.currentPoint.y + self.image.size.height);
    CGRect previousImageRect = CGRectMake(self.previousPoint.x, self.previousPoint.y, self.previousPoint.x + self.image.size.width, self.currentPoint.y + self.image.size.width);
    [self setNeedsDisplayInRect:CGRectUnion(currentImageRect, previousImageRect)];
}

- (void) update {
    static NSDate *lastUpdateTime;
    
    if (lastUpdateTime != nil) {
        NSTimeInterval secondsSinceLastDraw = -([lastUpdateTime timeIntervalSinceNow]);
        
        self.ballYVelocity = self.ballYVelocity - (self.acceleration.y * secondsSinceLastDraw);
        self.ballXVelocity = self.ballXVelocity + (self.acceleration.x * secondsSinceLastDraw);
        
        CGFloat xAcceleration = secondsSinceLastDraw * self.ballXVelocity * 1000;
        CGFloat yAcceleration = secondsSinceLastDraw * self.ballYVelocity * 1000;
        
        self.currentPoint = CGPointMake(self.currentPoint.x + xAcceleration, self.currentPoint.y + yAcceleration);
    }
    lastUpdateTime = [[NSDate alloc] init];
}

@end
