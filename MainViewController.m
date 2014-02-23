//
//  GUOMainViewController.m
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.weekDay = 0;
    appDelegate.timeSegment = 0;
    WeekCount *getWeek = [[WeekCount alloc] init];
    NSDate *now = [NSDate date];
    int week = [getWeek weekCount:now];
    if (week % 2 == 0) {
        _checkDouble.hidden = NO;
        _checkSingle.hidden = YES;
    }
    else {
        _checkSingle.hidden = NO;
        _checkDouble.hidden = YES;
    }
    if (week != -1) {
        _weekLabel.text = [NSString stringWithFormat:@"%i周", week];
    }
    else {
        _weekLabel.text = @"假期";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
