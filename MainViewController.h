//
//  GUOMainViewController.h
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "WeekCount.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *checkSingle;
@property (weak, nonatomic) IBOutlet UIButton *checkDouble;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;

@end
