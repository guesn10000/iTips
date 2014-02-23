//
//  ZZTasksListTableViewController.h
//  TasksManager_Demo3
//
//  Created by guo on 13-4-17.
//  Copyright (c) 2013年 spi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TaskEditViewController.h"
#import "SaveDataToFile.h"

@interface TasksListTableViewController : UITableViewController <UIAccelerometerDelegate>
@property NSDate *keepDate;
@property (strong, nonatomic) NSString *keepType;

@end
