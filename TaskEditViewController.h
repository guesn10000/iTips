//
//  ZZEditTaskViewController.h
//  TasksManager_Demo3
//
//  Created by guo on 13-4-17.
//  Copyright (c) 2013年 spi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TasksListTableViewController.h"
#import "SetTaskClockViewController.h"
#import "SaveDataToFile.h"

@interface TaskEditViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UITextField *taskTime;
@property (weak, nonatomic) IBOutlet UITextField *taskType;
- (IBAction)nameDone:(id)sender;
- (IBAction)timeDone:(id)sender;
@property (assign, nonatomic) NSUInteger selectedSnack;
@property (strong, nonatomic) NSString *tempName;
@property (strong, nonatomic) NSString *tempTime;
@property (strong, nonatomic) NSString *tempType;
@property NSDate *editDate;
@property NSString *tag;
@end
