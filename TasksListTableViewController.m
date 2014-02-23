//
//  ZZTasksListTableViewController.m
//  TasksManager_Demo3
//
//  Created by guo on 13-4-17.
//  Copyright (c) 2013年 spi. All rights reserved.
//

#import "TasksListTableViewController.h"

@interface TasksListTableViewController ()

@end

@implementation TasksListTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
}

- (void)timerFireMethod:(NSTimer *)theTimer {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
    return tempTaskList.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//用来显示格式
    [dateFormatter setDateFormat:@"yy MM dd hh mm ss"];//设定格式
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个以本地日历作为标准的NSCalender对象
    NSDate *today = [NSDate date];
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;//用来得到具体的时差
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    self.keepDate = [tempTaskList[row] objectForKey:@"taskDate"];
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:self.keepDate options:0];
    cell.textLabel.text = [tempTaskList[row] objectForKey:@"taskName"];
    self.keepType = [tempTaskList[row] objectForKey:@"taskType"];
    if ([self.keepType isEqualToString:@"学习"]) {
        cell.imageView.image = [UIImage imageNamed:@"1study.png"];
    }
    else if ([self.keepType isEqualToString:@"工作"]) {
        cell.imageView.image = [UIImage imageNamed:@"2work.png"];
    }
    else if ([self.keepType isEqualToString:@"生活"]) {
        cell.imageView.image = [UIImage imageNamed:@"3live.png"];
    }
    else if ([self.keepType isEqualToString:@"私人"]) {
        cell.imageView.image = [UIImage imageNamed:@"4private.png"];
    }
    else if ([self.keepType isEqualToString:@"其他"]) {
        cell.imageView.image = [UIImage imageNamed:@"5custom.png"];
    }
    
    if ([d minute] < 0) {
        cell.detailTextLabel.text = @"已过期";
    }
    else {
        if ([d second] <= 0) {
            cell.detailTextLabel.text = @"已过期";
            return cell;
        }
        cell.detailTextLabel.text = [NSString stringWithFormat:@"剩余%d年%d个月%d日%d时%d分", [d year], [d month], [d day], [d hour], [d minute]];
        NSDate *clockTime = self.keepDate;
        UILocalNotification *noti = [[UILocalNotification alloc] init];
        if (noti) {
            noti.fireDate = clockTime;
            noti.timeZone = [NSTimeZone defaultTimeZone];
            noti.repeatInterval = 0;
            noti.soundName = UILocalNotificationDefaultSoundName;
            noti.alertBody = [tempTaskList[row] objectForKey:@"taskName"];
            NSDictionary *notiDic = [NSDictionary dictionaryWithObjectsAndKeys:@"-1", @"endWeek", @"both", @"weekType", cell.textLabel.text, @"name", nil];
            noti.userInfo = notiDic;
            UIApplication *app = [UIApplication sharedApplication];
            [app scheduleLocalNotification:noti];
        }
    }                                             
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *myArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
        for (UILocalNotification *noti in myArray) {
            if ([[noti.userInfo valueForKey:@"name"] isEqualToString:[tempTaskList[indexPath.row]objectForKey:@"taskName"]]) {
                [[UIApplication sharedApplication] cancelLocalNotification:noti];
            }
        }
        [tempTaskList removeObjectAtIndex:indexPath.row];
        [loadDataFromFile saveGameData2:tempTaskList saveFileName:@"appTaskList"];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        //
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
    NSMutableDictionary *object = [tempTaskList objectAtIndex:fromIndexPath.row];
    [tempTaskList removeObjectAtIndex:fromIndexPath.row];
    [tempTaskList insertObject:object atIndex:toIndexPath.row];
    [loadDataFromFile saveGameData2:tempTaskList saveFileName:@"appTaskList"];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

#pragma mark - Table view delegate


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableArray *tempTaskList = [loadDataFromFile loadGameData2:@"appTaskList"];
    if ([[segue identifier] isEqualToString:@"editTask"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *tempNameOfFile = [tempTaskList[indexPath.row] valueForKey:@"taskName"];
        NSString *tempTimeOfFile = [tempTaskList[indexPath.row] valueForKey:@"taskTime"];
        NSString *tempTagOfFile = [NSString stringWithFormat:@"%i", indexPath.row];
        NSDate *tempEditDateOfFile = self.keepDate;
        NSString *tempTypeOfFile = self.keepType;
        
        NSMutableDictionary *dicOfFile = [[NSMutableDictionary alloc] initWithObjectsAndKeys:tempTimeOfFile, @"tempTimeOfFile", tempNameOfFile, @"tempNameOfFile", tempTagOfFile, @"tempTagOfFile", tempEditDateOfFile, @"tempEditDateOfFile", tempTypeOfFile, @"tempTypeOfFile", nil];
        [saveDataToFile saveGameData:dicOfFile saveFileName:@"SetTimeBackSegueForTasksManager"];
    }
    else if ([[segue identifier] isEqualToString:@"addTask"]) {
        NSString *tempTagOfFile = @"-1";
        NSString *tempNameOfFile = @" ";
        NSString *tempTimeOfFile = @" ";
        NSDate *tempEditDateOfFile = nil;
        NSString *tempTypeOfFile = @" ";
        
        
        NSMutableDictionary *dicOfFile = [[NSMutableDictionary alloc] initWithObjectsAndKeys:tempTimeOfFile, @"tempTimeOfFile", tempNameOfFile, @"tempNameOfFile", tempTagOfFile, @"tempTagOfFile", tempEditDateOfFile, @"tempEditDateOfFile", tempTypeOfFile, @"tempTypeOfFile", nil];
        [saveDataToFile saveGameData:dicOfFile saveFileName:@"SetTimeBackSegueForTasksManager"];
    }
}

@end
