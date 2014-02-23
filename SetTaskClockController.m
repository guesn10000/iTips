//
//  ZZSetTimeViewController.m
//  TasksManager_Demo3
//
//  Created by guo on 13-4-18.
//  Copyright (c) 2013年 spi. All rights reserved.
//

#import "SetTaskClockViewController.h"

@interface SetTaskClockViewController ()

@end

@implementation SetTaskClockViewController
@synthesize datePicker;
@synthesize saveName;
@synthesize saveTag;


- (void)viewDidLoad
{
    [super viewDidLoad];
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableDictionary *temp = [loadDataFromFile loadGameData:@"SetTimeSegueForTasksManager"];
    self.saveName = [temp valueForKey:@"File_TaskName"];
    self.saveTag = [temp valueForKey:@"File_TaskTag"];
    _saveType = [temp valueForKey:@"File_TaskType"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    
    if ([[segue identifier] isEqualToString:@"setTime"]) {
        NSDate *clockTime = [datePicker date];
        //ZZEditTaskViewController *des = [segue destinationViewController];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//用来显示格式
        [dateFormatter setDateFormat:@"yyyy年MM月dd日hh时mm分ss秒"];//设定格式
        NSString *tempTimeOfFile = [dateFormatter stringFromDate:clockTime];
        NSString *tempNameOfFile = saveName;
        NSString *tempTagOfFile = saveTag;
        NSDate *tempEditDateOfFile = clockTime;
        NSString *tempTypeOfFile = _saveType;
        
        NSMutableDictionary *dicOfFile = [[NSMutableDictionary alloc] initWithObjectsAndKeys:tempTimeOfFile, @"tempTimeOfFile", tempNameOfFile, @"tempNameOfFile", tempTagOfFile, @"tempTagOfFile", tempEditDateOfFile, @"tempEditDateOfFile", tempTypeOfFile, @"tempTypeOfFile", nil];
        [saveDataToFile saveGameData:dicOfFile saveFileName:@"SetTimeBackSegueForTasksManager"];
    }
}


@end
