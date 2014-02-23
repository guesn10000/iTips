//
//  ZZEditTaskViewController.m
//  TasksManager_Demo3
//
//  Created by guo on 13-4-17.
//  Copyright (c) 2013年 spi. All rights reserved.
//

#import "TaskEditViewController.h"

@interface TaskEditViewController ()

@end

@implementation TaskEditViewController
@synthesize taskName;
@synthesize taskTime;
@synthesize tempName;
@synthesize tempTime;
@synthesize editDate;
@synthesize selectedSnack;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableDictionary *temp = [loadDataFromFile loadGameData:@"SetTimeBackSegueForTasksManager"];
    tempName = [temp valueForKey:@"tempNameOfFile"];
    tempTime = [temp valueForKey:@"tempTimeOfFile"];
    _tempType = [temp valueForKey:@"tempTypeOfFile"];
    selectedSnack = NSNotFound;
    self.tag = [temp valueForKey:@"tempTagOfFile"];
    self.editDate = [temp valueForKey:@"tempEditDateOfFile"];
    
    
    taskName.text = tempName;
    taskTime.text = tempTime;
    _taskType.text = _tempType;
    selectedSnack = NSNotFound;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    
    if ([[segue identifier] isEqualToString:@"setTime"]) {
        NSString *taskNameOfFile = taskName.text;
        NSString *taskTagOfFile = _tag;
        NSString *taskTypeOfFile = _tempType;
        NSMutableDictionary *dicOfFile = [[NSMutableDictionary alloc] initWithObjectsAndKeys:taskNameOfFile, @"File_TaskName", taskTagOfFile, @"File_TaskTag", taskTypeOfFile, @"File_TaskType", nil];
        [saveDataToFile saveGameData:dicOfFile saveFileName:@"SetTimeSegueForTasksManager"];
    }
    else {//save data
        
        SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
        NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
        
        if ([_tag isEqualToString:@"-1"]) {//add task and save
            if (!tempTaskList) {
                tempTaskList = [NSMutableArray array];
            }
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:taskName.text, @"taskName", taskTime.text, @"taskTime", editDate, @"taskDate", self.tempType, @"taskType", nil];
            [tempTaskList insertObject:dic atIndex:0];
        }
        else {//edit task and save
            if (!tempTaskList) {
                tempTaskList = [NSMutableArray array];
            }
            SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
            NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
            self.editDate = [tempTaskList[[_tag intValue]] objectForKey:@"taskDate"];
            NSMutableDictionary *dicOfFile = [[NSMutableDictionary alloc] initWithObjectsAndKeys:taskTime.text, @"tempTimeOfFile", taskName.text, @"tempNameOfFile", _tag, @"tempTagOfFile", editDate, @"tempEditDateOfFile", self.tempType, @"tempTypeOfFile", nil];
            [saveDataToFile saveGameData:dicOfFile saveFileName:@"SetTimeBackSegueForTasksManager"];
            
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:taskName.text, @"taskName", taskTime.text, @"taskTime", editDate, @"taskDate", self.tempType, @"taskType", nil];
            
            int tempTag = [self.tag intValue];
            [tempTaskList replaceObjectAtIndex:tempTag withObject:dic];
        }
        [saveDataToFile saveGameData2:tempTaskList saveFileName:@"appTaskList"];
    }
    
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row != self.selectedSnack) {
            if (self.selectedSnack != NSNotFound) {
                NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.selectedSnack
                                                               inSection:1];
                UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
                oldCell.accessoryType = UITableViewCellAccessoryNone;
            }
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.selectedSnack = indexPath.row;
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        switch (selectedSnack) {
            case 0:
                self.tempType = @"学习";
                break;
            case 1:
                self.tempType = @"工作";
                break;
            case 2:
                self.tempType = @"生活";
                break;
            case 3:
                self.tempType = @"私人";
                break;
            case 4:
                self.tempType = @"其他";
                break;
        }
        self.taskType.text = self.tempType;
    }
}



- (IBAction)nameDone:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)timeDone:(id)sender {
    [sender resignFirstResponder];
}

@end
