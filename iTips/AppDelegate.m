//
//  GUOAppDelegate.m
//  iTips
//
//  Created by guo on 13-4-22.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize weekDay;
@synthesize timeSegment;
@synthesize tableType;
@synthesize finished;
@synthesize soundID;
@synthesize appTaskList;


- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    WeekCount *getWeek = [[WeekCount alloc] init];
    NSDate *now = [NSDate date];
    NSString *week = [NSString stringWithFormat:@"%i", [getWeek weekCount:now]];
    
    NSString *show;
    if ([week intValue] % 2 == 0) {
        show = @"double";
    }
    else {
        show = @"single";
    }

    NSDictionary *dic = notification.userInfo;
    NSString *temp = [dic valueForKey:@"endWeek"];
    
    if ([temp isEqualToString:week]) {
        [application cancelLocalNotification:notification];
    }
    else {
        if (([[dic valueForKey:@"weekType"] isEqualToString:show]) || ([[dic valueForKey:@"weekType"] isEqualToString:@"both"])) {
            SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
            NSString *music;
            music = [loadDataFromFile loadGameData2:@"Music"][0];
            NSString *path;
            if ([music isEqualToString:@"碎裂"]) {
                path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
            }
            else {//if ([music isEqualToString:@"刷新"]) {
                path = [[NSBundle mainBundle] pathForResource:@"xlwb" ofType:@"wav"];
            }
            
            NSURL *url = [NSURL fileURLWithPath:path];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
            AudioServicesPlaySystemSound(soundID);
            NSString *body = notification.alertBody;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iTips提提你" message:body delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alert show];
            
            NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[dic valueForKey:@"endWeek"], @"endWeek", [dic valueForKey:@"weekType"], @"weekType", nil];
            notification.userInfo = dic2;
            
            if ([[dic valueForKey:@"weekType"] isEqualToString:@"both"]) {
                [application cancelLocalNotification:notification];
            }
        }
        else {
            UILocalNotification *noti = [[UILocalNotification alloc] init];
            if (noti) {
                noti.fireDate = [NSDate dateWithTimeInterval:(7 * 24 * 60 * 60) sinceDate:notification.fireDate];
                noti.timeZone = [NSTimeZone defaultTimeZone];
                noti.repeatInterval = NSWeekCalendarUnit;
                noti.soundName = UILocalNotificationDefaultSoundName;
                noti.alertBody = notification.alertBody;
                NSDictionary *notiDic = [NSDictionary dictionaryWithObjectsAndKeys:[notification.userInfo valueForKey:@"endWeek"], @"endWeek", [notification.userInfo valueForKey:@"weekType"], @"weekType", nil];
                noti.userInfo = notiDic;
                UIApplication *app = [UIApplication sharedApplication];
                [app scheduleLocalNotification:noti];
            }
            [application cancelLocalNotification:notification];
        }
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[application cancelAllLocalNotifications];
    
    // Override point for customization after application launch.
    if (!appTaskList) {
        appTaskList = [NSMutableArray array];
        NSMutableDictionary *tempAppTaskList = [[NSMutableDictionary alloc] initWithObjectsAndKeys:appTaskList, @"TasksManagerOfAppDelegate", nil];
        SaveDataToFile *save = [[SaveDataToFile alloc] init];
        [save saveGameData:tempAppTaskList saveFileName:@"TasksManagerOfAppDelegate"];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    NSMutableDictionary *tempAppTaskList = [[NSMutableDictionary alloc] initWithObjectsAndKeys:appTaskList, @"AppTaskListOfFile", nil];
    [saveDataToFile saveGameData:tempAppTaskList saveFileName:@"TasksManagerOfAppDelegate"];

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    NSMutableDictionary *tempAppTaskList = [[NSMutableDictionary alloc] initWithObjectsAndKeys:appTaskList, @"AppTaskListOfFile", nil];
    [saveDataToFile saveGameData:tempAppTaskList saveFileName:@"TasksManagerOfAppDelegate"];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    NSMutableDictionary *tempAppTaskList = [[NSMutableDictionary alloc] initWithObjectsAndKeys:appTaskList, @"AppTaskListOfFile", nil];
    [saveDataToFile saveGameData:tempAppTaskList saveFileName:@"TasksManagerOfAppDelegate"];
}

@end
