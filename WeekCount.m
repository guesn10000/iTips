//
//  GUOWeekCount.m
//  iTips
//
//  Created by guo on 13-4-30.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "WeekCount.h"

@implementation WeekCount

-(int)weekCount:(NSDate *)today {
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *d = [cal components:unitFlags fromDate:today];
    int day = [d day];
    int week;
    switch ([d month]) {
        case 2:
            if (day >= 24 && day <= 28) {
                week = 1;
            }
            else {
                week = -1;
            }
            break;
        case 3:
            if (day >= 1 && day <= 2) {
                week = 1;
            }
            else if (day >= 3 && day <= 9) {
                week = 2;
            }
            else if (day >= 10 && day <= 16) {
                week = 3;
            }
            else if (day >= 17 && day <= 23) {
                week = 4;
            }
            else if (day >= 24 && day <= 30) {
                week = 5;
            }
            else if (day == 31) {
                week = 6;
            }
            else {
                week = -1;
            }
            break;
        case 4:
            if (day >= 1 && day <= 6) {
                week = 6;
            }
            else if (day >= 7 && day <= 13) {
                week = 7;
            }
            else if (day >= 14 && day <= 20) {
                week = 8;
            }
            else if (day >= 21 && day <= 27) {
                week = 9;
            }
            else if (day >= 28 && day <= 30) {
                week = 10;
            }
            else {
                week = -1;
            }
            break;
        case 5:
            if (day >= 1 && day <= 4) {
                week = 10;
            }
            else if (day >= 5 && day <= 11) {
                week = 11;
            }
            else if (day >= 12 && day <= 18) {
                week = 12;
            }
            else if (day >= 19 && day <= 25) {
                week = 13;
            }
            else if (day >= 26 && day <= 31) {
                week = 14;
            }
            else {
                week = -1;
            }
            break;
        case 6:
            if (day == 1) {
                week = 14;
            }
            else if (day >= 2 && day <= 8) {
                week = 15;
            }
            else if (day >= 9 && day <= 15) {
                week = 16;
            }
            else if (day >= 16 && day <= 22) {
                week = 17;
            }
            else if (day >= 23 && day <= 29) {
                week = 18;
            }
            else if (day == 30) {
                week = 19;
            }
            else {
                week = -1;
            }
            break;
        case 7:
            if (day >= 1 && day <= 6) {
                week = 19;
            }
            else if (day >= 7 && day <= 13) {
                week = 20;
            }
            else {
                week = -1;
            }
            break;
        default:
            week = -1;
            break;
    }
    return week;
}

@end
