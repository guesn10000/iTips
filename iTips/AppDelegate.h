//
//  GUOAppDelegate.h
//  iTips
//
//  Created by guo on 13-4-22.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SaveDataToFile.h"
#import "WeekCount.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    int weekDay;
    int timeSegment;
    int tableType;
    BOOL finished;
    NSMutableArray *appTaskList;
}

@property (strong, nonatomic) UIWindow *window;
@property int weekDay;
@property int timeSegment;
@property int tableType;
@property BOOL finished;
@property (assign, nonatomic) SystemSoundID soundID;

@property (retain, nonatomic) NSMutableArray *appTaskList;
@end
