//
//  GUOClassTableViewController.m
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "OddClassTableViewController.h"

@interface OddClassTableViewController ()

@end

@implementation OddClassTableViewController
@synthesize myTemplate;
@synthesize showBeginWeek;
@synthesize showEndWeek;
@synthesize showRemark;
@synthesize showTeacher;
@synthesize showRoom;
@synthesize showSubject;
@synthesize showTemplate;
@synthesize showBeginWeek2;
@synthesize showEndWeek2;
@synthesize showRemark2;
@synthesize showTeacher2;
@synthesize showRoom2;
@synthesize showSubject2;
@synthesize showTemplate2;
@synthesize weekCount;
@synthesize week;


- (void)setClockTime:(int)t andClockNumber:(int)n {
    int beginWeek = [showBeginWeek intValue];
    int beginWeek2 = [showBeginWeek2 intValue];
    
    NSDate *classClock = [[NSDate alloc] init];
    NSDate *classClock2 = [[NSDate alloc] init];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *morningStandard = [[NSDateComponents alloc] init];
    [morningStandard setYear:2013];
    [morningStandard setMonth:2];
    [morningStandard setDay:25];
    [morningStandard setHour:8];
    [morningStandard setMinute:0];
    [morningStandard setSecond:0];
    NSDateComponents *afternoonStandard = [[NSDateComponents alloc] init];
    [afternoonStandard setYear:2013];
    [afternoonStandard setMonth:2];
    [afternoonStandard setDay:25];
    [afternoonStandard setHour:14];
    [afternoonStandard setMinute:0];
    [afternoonStandard setSecond:0];
    NSDateComponents *nightStandard = [[NSDateComponents alloc] init];
    [nightStandard setYear:2013];
    [nightStandard setMonth:2];
    [nightStandard setDay:25];
    [nightStandard setHour:18];
    [nightStandard setMinute:30];
    [nightStandard setSecond:0];
    
    NSDate *date1 = [calender dateFromComponents:morningStandard];
    NSDate *date2 = [calender dateFromComponents:afternoonStandard];
    NSDate *date3 = [calender dateFromComponents:nightStandard];
    
    if (n == 3) {
        switch (t) {
            case 11:
                classClock = [[NSDate alloc] initWithTimeInterval:((beginWeek - 1) * 7 * 24 * 60 * 60)  sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 12:
                classClock = [[NSDate alloc] initWithTimeInterval:((beginWeek - 1) * 7 * 24 * 60 * 60)  sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 13:
                classClock = [[NSDate alloc] initWithTimeInterval:((beginWeek - 1) * 7 * 24 * 60 * 60)  sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            case 21:
                classClock = [[NSDate alloc] initWithTimeInterval:24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 22:
                classClock = [[NSDate alloc] initWithTimeInterval:24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 23:
                classClock = [[NSDate alloc] initWithTimeInterval:24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 31:
                classClock = [[NSDate alloc] initWithTimeInterval:2 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 32:
                classClock = [[NSDate alloc] initWithTimeInterval:2 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 33:
                classClock = [[NSDate alloc] initWithTimeInterval:2 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 41:
                classClock = [[NSDate alloc] initWithTimeInterval:3 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 42:
                classClock = [[NSDate alloc] initWithTimeInterval:3 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 43:
                classClock = [[NSDate alloc] initWithTimeInterval:3 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 51:
                classClock = [[NSDate alloc] initWithTimeInterval:4 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 52:
                classClock = [[NSDate alloc] initWithTimeInterval:4 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 53:
                classClock = [[NSDate alloc] initWithTimeInterval:4 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 61:
                classClock = [[NSDate alloc] initWithTimeInterval:5 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 62:
                classClock = [[NSDate alloc] initWithTimeInterval:5 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 63:
                classClock = [[NSDate alloc] initWithTimeInterval:5 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 71:
                classClock = [[NSDate alloc] initWithTimeInterval:6 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 72:
                classClock = [[NSDate alloc] initWithTimeInterval:6 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            case 73:
                classClock = [[NSDate alloc] initWithTimeInterval:6 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                classClock2 = [[NSDate alloc] initWithTimeInterval:2 * 60 * 60 + ((beginWeek2 - 1) * 7 * 24 * 60 * 60) sinceDate:classClock];
                break;
            default:
                break;
        }
    }
    else {
        switch (t) {
            case 11:
                classClock = [[NSDate alloc] initWithTimeInterval:((beginWeek - 1) * 7 * 24 * 60 * 60)  sinceDate:date1];
                break;
            case 12:
                classClock = [[NSDate alloc] initWithTimeInterval:((beginWeek - 1) * 7 * 24 * 60 * 60)  sinceDate:date2];
                break;
            case 13:
                classClock = [[NSDate alloc] initWithTimeInterval:((beginWeek - 1) * 7 * 24 * 60 * 60)  sinceDate:date3];
                break;
            case 21:
                classClock = [[NSDate alloc] initWithTimeInterval:24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 22:
                classClock = [[NSDate alloc] initWithTimeInterval:24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 23:
                classClock = [[NSDate alloc] initWithTimeInterval:24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            case 31:
                classClock = [[NSDate alloc] initWithTimeInterval:2 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 32:
                classClock = [[NSDate alloc] initWithTimeInterval:2 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 33:
                classClock = [[NSDate alloc] initWithTimeInterval:2 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            case 41:
                classClock = [[NSDate alloc] initWithTimeInterval:3 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 42:
                classClock = [[NSDate alloc] initWithTimeInterval:3 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 43:
                classClock = [[NSDate alloc] initWithTimeInterval:3 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            case 51:
                classClock = [[NSDate alloc] initWithTimeInterval:4 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 52:
                classClock = [[NSDate alloc] initWithTimeInterval:4 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 53:
                classClock = [[NSDate alloc] initWithTimeInterval:4 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            case 61:
                classClock = [[NSDate alloc] initWithTimeInterval:5 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 62:
                classClock = [[NSDate alloc] initWithTimeInterval:5 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 63:
                classClock = [[NSDate alloc] initWithTimeInterval:5 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            case 71:
                classClock = [[NSDate alloc] initWithTimeInterval:6 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date1];
                break;
            case 72:
                classClock = [[NSDate alloc] initWithTimeInterval:6 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date2];
                break;
            case 73:
                classClock = [[NSDate alloc] initWithTimeInterval:6 * 24 * 60 * 60 + ((beginWeek - 1) * 7 * 24 * 60 * 60) sinceDate:date3];
                break;
            default:
                break;
        }
    }
    
    NSString *weekType = @"single";
    
    UILocalNotification *noti1 = [[UILocalNotification alloc] init];
    if (noti1) {
        noti1.fireDate = classClock;
        noti1.timeZone = [NSTimeZone defaultTimeZone];
        noti1.repeatInterval = NSWeekCalendarUnit;
        noti1.soundName = UILocalNotificationDefaultSoundName;
        noti1.alertBody = [NSString stringWithFormat:@"准备去上课吧:%@ %@ %@", showSubject, showRoom, showTemplate];
        NSDictionary *notiDic = [NSDictionary dictionaryWithObjectsAndKeys:showEndWeek, @"endWeek", weekType, @"weekType", [NSString stringWithFormat:@"%i", t], @"time", nil];
        noti1.userInfo = notiDic;
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:noti1];
     }
     
     UILocalNotification *noti2 = [[UILocalNotification alloc] init];
    if (noti2 && n == 3) {
        noti2.fireDate = classClock2;
        noti2.timeZone = [NSTimeZone defaultTimeZone];
        noti2.repeatInterval = NSWeekCalendarUnit;
        noti2.soundName = UILocalNotificationDefaultSoundName;
        noti2.alertBody = [NSString stringWithFormat:@"准备去上课吧:%@ %@ %@", showSubject2, showRoom2, showTemplate2];
        NSDictionary *notiDic = [NSDictionary dictionaryWithObjectsAndKeys:showEndWeek2, @"endWeek", weekType, @"weekType", [NSString stringWithFormat:@"%i", t], @"time", nil];
        noti2.userInfo = notiDic;
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:noti2];
     }
}


- (int) setTemp:(int) seg {
    
    int temp;
    if ([myTemplate isEqualToString:@"2+0"]) {
        temp = 1;
    }
    else if ([myTemplate isEqualToString:@"3+0"]) {
        temp = 2;
    }
    else if ([myTemplate isEqualToString:@"2+2"]) {
        temp = 3;
    }
    else if ([myTemplate isEqualToString:@"4+0"]) {
        temp = 4;
    }
    else {
        temp = -1;
    }
    
    
    if (seg == 1) {
        switch (temp) {
            case 1:
                showTemplate = @"1.2节";
                break;
            case 2:
                showTemplate = @"1-3节";
                break;
            case 3:
                showTemplate = @"1.2节";
                showTemplate2 = @"3.4节";
                break;
            case 4:
                showTemplate = @"1-4节";
                break;
            default:
                break;
        }
    }
    else if (seg == 2) {
        switch (temp) {
            case 1:
                showTemplate = @"5.6节";
                break;
            case 2:
                showTemplate = @"5-7节";
                break;
            case 3:
                showTemplate = @"5.6节";
                showTemplate2 = @"7.8节";
                break;
            case 4:
                showTemplate = @"5-8节";
                break;
            default:
                break;
        }
    }
    else if (seg == 3) {
        switch (temp) {
            case 1:
                showTemplate = @"9.10节";
                break;
            case 2:
                showTemplate = @"9-11节";
                break;
            case 3:
                showTemplate = @"9.10节";
                showTemplate2 = @"11.12节";
                break;
            case 4:
                showTemplate = @"9-12节";
                break;
            default:
                break;
        }
    }
    return temp;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    
    NSString *body = @"请将手机横置，以便查看完整页面";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iTips提提你" message:body delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alert show];
    
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    WeekCount *getWeek = [[WeekCount alloc] init];
    NSDate *now = [NSDate date];
    week.text = [NSString stringWithFormat:@"%i", [getWeek weekCount:now]];
    
    int w = appDelegate.weekDay;
    int t = appDelegate.timeSegment;
    int choose = [self setTemp:t];
    int time;
    
    NSString *string1 = ([showSubject isEqualToString:@""]) ? @"" : [NSString stringWithFormat:@"%@\n%@\n%@\n%@周-%@周\n%@\n%@", showSubject, showRoom, showTemplate, showBeginWeek, showEndWeek, showTeacher, showRemark];
    NSString *string2 = ([showSubject2 isEqualToString:@""]) ? @"" : [NSString stringWithFormat:@"%@\n%@\n%@\n%@周-%@周\n%@\n%@", showSubject2, showRoom2, showTemplate2, showBeginWeek2, showEndWeek2, showTeacher2, showRemark2];
    
    if (w == 1) {
        if (t== 1)
        {
            self.mon1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_mon1 = [[NSMutableArray alloc] initWithObjects:self.mon1.text, nil];
            [saveDataToFile saveGameData2:ct_mon1 saveFileName:@"mon1"];
            [self setClockTime:11 andClockNumber:choose];
            time = 11;
        }
        else if (t == 2)
        {
            self.mon2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_mon2 = [[NSMutableArray alloc] initWithObjects:self.mon2.text, nil];
            [saveDataToFile saveGameData2:ct_mon2 saveFileName:@"mon2"];
            [self setClockTime:12 andClockNumber:choose];
            time = 12;
        }
        else //if (t == 3)
        {
            self.mon3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_mon3 = [[NSMutableArray alloc] initWithObjects:self.mon3.text, nil];
            [saveDataToFile saveGameData2:ct_mon3 saveFileName:@"mon3"];
            [self setClockTime:13 andClockNumber:choose];
            time = 13;
        }
    }
    
    else if (w == 2) {
        if (t == 1)
        {
            self.tue1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_tue1 = [[NSMutableArray alloc] initWithObjects:self.tue1.text, nil];
            [saveDataToFile saveGameData2:ct_tue1 saveFileName:@"tue1"];
            [self setClockTime:21 andClockNumber:choose];
            time = 21;
        }
        else if (t == 2)
        {
            self.tue2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_tue2 = [[NSMutableArray alloc] initWithObjects:self.tue2.text, nil];
            [saveDataToFile saveGameData2:ct_tue2 saveFileName:@"tue2"];
            [self setClockTime:22 andClockNumber:choose];
            time = 22;
        }
        else //if (t == 3)
        {
            self.tue3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_tue3 = [[NSMutableArray alloc] initWithObjects:self.tue3.text, nil];
            [saveDataToFile saveGameData2:ct_tue3 saveFileName:@"tue3"];
            [self setClockTime:23 andClockNumber:choose];
            time = 23;
        }
    }
    
    else if (w == 3) {
        if (t == 1)
        {
            self.wed1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_wed1 = [[NSMutableArray alloc] initWithObjects:self.wed1.text, nil];
            [saveDataToFile saveGameData2:ct_wed1 saveFileName:@"wed1"];
            [self setClockTime:31 andClockNumber:choose];
            time = 31;
        }
        else if (t== 2)
        {
            self.wed2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_wed2 = [[NSMutableArray alloc] initWithObjects:self.wed2.text, nil];
            [saveDataToFile saveGameData2:ct_wed2 saveFileName:@"wed2"];
            [self setClockTime:32 andClockNumber:choose];
            time = 32;
        }
        else //if (t == 3)
        {
            self.wed3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_wed3 = [[NSMutableArray alloc] initWithObjects:self.wed3.text, nil];
            [saveDataToFile saveGameData2:ct_wed3 saveFileName:@"wed3"];
            [self setClockTime:33 andClockNumber:choose];
            time = 33;
        }
    }
    
    else if (w == 4) {
        if (t == 1)
        {
            self.thu1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_thu1 = [[NSMutableArray alloc] initWithObjects:self.thu1.text, nil];
            [saveDataToFile saveGameData2:ct_thu1 saveFileName:@"thu1"];
            [self setClockTime:41 andClockNumber:choose];
            time = 41;
        }
        else if (t == 2)
        {
            self.thu2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_thu2 = [[NSMutableArray alloc] initWithObjects:self.thu2.text, nil];
            [saveDataToFile saveGameData2:ct_thu2 saveFileName:@"thu2"];
            [self setClockTime:42 andClockNumber:choose];
            time = 42;
        }
        else //if (t == 3)
        {
            self.thu3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_thu3 = [[NSMutableArray alloc] initWithObjects:self.thu3.text, nil];
            [saveDataToFile saveGameData2:ct_thu3 saveFileName:@"thu3"];
            [self setClockTime:43 andClockNumber:choose];
            time = 43;
        }
    }
    
    else if (w == 5) {
        if (t == 1)
        {
            self.fri1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_fri1 = [[NSMutableArray alloc] initWithObjects:self.fri1.text, nil];
            [saveDataToFile saveGameData2:ct_fri1 saveFileName:@"fri1"];
            [self setClockTime:51 andClockNumber:choose];
            time = 51;
        }
        else if (t == 2)
        {
            self.fri2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_fri2 = [[NSMutableArray alloc] initWithObjects:self.fri2.text, nil];
            [saveDataToFile saveGameData2:ct_fri2 saveFileName:@"fri2"];
            [self setClockTime:52 andClockNumber:choose];
            time = 52;
        }
        else //if (t ==3)
        {
            self.fri3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_fri3 = [[NSMutableArray alloc] initWithObjects:self.fri3.text, nil];
            [saveDataToFile saveGameData2:ct_fri3 saveFileName:@"fri3"];
            [self setClockTime:53 andClockNumber:choose];
            time = 53;
        }
    }
    
    else if (w == 6) {
        if (t == 1)
        {
            self.sat1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_sat1 = [[NSMutableArray alloc] initWithObjects:self.sat1.text, nil];
            [saveDataToFile saveGameData2:ct_sat1 saveFileName:@"sat1"];
            [self setClockTime:61 andClockNumber:choose];
            time = 61;
        }
        else if (t == 2)
        {
            self.sat2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_sat2 = [[NSMutableArray alloc] initWithObjects:self.sat2.text, nil];
            [saveDataToFile saveGameData2:ct_sat2 saveFileName:@"sat2"];
            [self setClockTime:62 andClockNumber:choose];
            time = 62;
        }
        else //if (t == 3)
        {
            self.sat3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_sat3 = [[NSMutableArray alloc] initWithObjects:self.sat3.text, nil];
            [saveDataToFile saveGameData2:ct_sat3 saveFileName:@"sat3"];
            [self setClockTime:63 andClockNumber:choose];
            time = 63;
        }
    }
    
    else if (w == 7) {
        if (t == 1)
        {
            self.sun1.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_sun1 = [[NSMutableArray alloc] initWithObjects:self.sun1.text, nil];
            [saveDataToFile saveGameData2:ct_sun1 saveFileName:@"sun1"];
            [self setClockTime:71 andClockNumber:choose];
            time = 71;
        }
        else if (t == 2)
        {
            self.sun2.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_sun2 = [[NSMutableArray alloc] initWithObjects:self.sun2.text, nil];
            [saveDataToFile saveGameData2:ct_sun2 saveFileName:@"sun2"];
            [self setClockTime:72 andClockNumber:choose];
            time = 72;
        }
        else //if (t == 3)
        {
            self.sun3.text = ((choose == 3) ? [NSString stringWithFormat:@"%@\n\n%@", string1, string2] : string1);
            NSMutableArray *ct_sun3 = [[NSMutableArray alloc] initWithObjects:self.sun3.text, nil];
            [saveDataToFile saveGameData2:ct_sun3 saveFileName:@"sun3"];
            [self setClockTime:73 andClockNumber:choose];
            time = 73;
        }
    }
    
    else {
        time = -1;
    }
    
    
    NSMutableArray *ct_mon_1 = [loadDataFromFile loadGameData2:@"mon1"];
    NSMutableArray *ct_mon_2 = [loadDataFromFile loadGameData2:@"mon2"];
    NSMutableArray *ct_mon_3 = [loadDataFromFile loadGameData2:@"mon3"];
    
    NSMutableArray *ct_tue_1 = [loadDataFromFile loadGameData2:@"tue1"];
    NSMutableArray *ct_tue_2 = [loadDataFromFile loadGameData2:@"tue2"];
    NSMutableArray *ct_tue_3 = [loadDataFromFile loadGameData2:@"tue3"];
    
    NSMutableArray *ct_wed_1 = [loadDataFromFile loadGameData2:@"wed1"];
    NSMutableArray *ct_wed_2 = [loadDataFromFile loadGameData2:@"wed2"];
    NSMutableArray *ct_wed_3 = [loadDataFromFile loadGameData2:@"wed3"];
    
    NSMutableArray *ct_thu_1 = [loadDataFromFile loadGameData2:@"thu1"];
    NSMutableArray *ct_thu_2 = [loadDataFromFile loadGameData2:@"thu2"];
    NSMutableArray *ct_thu_3 = [loadDataFromFile loadGameData2:@"thu3"];
    
    NSMutableArray *ct_fri_1 = [loadDataFromFile loadGameData2:@"fri1"];
    NSMutableArray *ct_fri_2 = [loadDataFromFile loadGameData2:@"fri2"];
    NSMutableArray *ct_fri_3 = [loadDataFromFile loadGameData2:@"fri3"];
    
    NSMutableArray *ct_sat_1 = [loadDataFromFile loadGameData2:@"sat1"];
    NSMutableArray *ct_sat_2 = [loadDataFromFile loadGameData2:@"sat2"];
    NSMutableArray *ct_sat_3 = [loadDataFromFile loadGameData2:@"sat3"];
    
    NSMutableArray *ct_sun_1 = [loadDataFromFile loadGameData2:@"sun1"];
    NSMutableArray *ct_sun_2 = [loadDataFromFile loadGameData2:@"sun2"];
    NSMutableArray *ct_sun_3 = [loadDataFromFile loadGameData2:@"sun3"];
    
    
    self.mon1.text = (ct_mon_1[0] == nil) ? @"" : ct_mon_1[0];
    self.mon2.text = (ct_mon_2[0] == nil) ? @"" : ct_mon_2[0];
    self.mon3.text = (ct_mon_3[0] == nil) ? @"" : ct_mon_3[0];
    
    self.tue1.text = (ct_tue_1[0] == nil) ? @"" : ct_tue_1[0];
    self.tue2.text = (ct_tue_2[0] == nil) ? @"" : ct_tue_2[0];
    self.tue3.text = (ct_tue_3[0] == nil) ? @"" : ct_tue_3[0];
    
    self.wed1.text = (ct_wed_1[0] == nil) ? @"" : ct_wed_1[0];
    self.wed2.text = (ct_wed_2[0] == nil) ? @"" : ct_wed_2[0];
    self.wed3.text = (ct_wed_3[0] == nil) ? @"" : ct_wed_3[0];
    
    self.thu1.text = (ct_thu_1[0] == nil) ? @"" : ct_thu_1[0];
    self.thu2.text = (ct_thu_2[0] == nil) ? @"" : ct_thu_2[0];
    self.thu3.text = (ct_thu_3[0] == nil) ? @"" : ct_thu_3[0];
    
    self.fri1.text = (ct_fri_1[0] == nil) ? @"" : ct_fri_1[0];
    self.fri2.text = (ct_fri_2[0] == nil) ? @"" : ct_fri_2[0];
    self.fri3.text = (ct_fri_3[0] == nil) ? @"" : ct_fri_3[0];
    
    self.sat1.text = (ct_sat_1[0] == nil) ? @"" : ct_sat_1[0];
    self.sat2.text = (ct_sat_2[0] == nil) ? @"" : ct_sat_2[0];
    self.sat3.text = (ct_sat_3[0] == nil) ? @"" : ct_sat_3[0];
    
    self.sun1.text = (ct_sun_1[0] == nil) ? @"" : ct_sun_1[0];
    self.sun2.text = (ct_sun_2[0] == nil) ? @"" : ct_sun_2[0];
    self.sun3.text = (ct_sun_3[0] == nil) ? @"" : ct_sun_3[0];
    
    NSString *timeStr = [NSString stringWithFormat:@"%i", time];
    if ([showSubject isEqualToString:@""] && ([showSubject2 isEqualToString:@""] || showSubject2 == nil)) {
        NSArray *myArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
        for (UILocalNotification *noti in myArray) {
            if ([[noti.userInfo valueForKey:@"time"] isEqualToString:timeStr]) {
                [[UIApplication sharedApplication] cancelLocalNotification:noti];
            }
        }
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;//隐藏为YES，显示为NO
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.tableType = 1;
}

@end
