//
//  ZZSetTimeViewController.h
//  TasksManager_Demo3
//
//  Created by guo on 13-4-18.
//  Copyright (c) 2013年 spi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskEditViewController.h"
#import "SaveDataToFile.h"

@interface SetTaskClockViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) NSString *saveName;
@property NSString *saveTag;
@property (strong, nonatomic) NSString *saveType;
@end
