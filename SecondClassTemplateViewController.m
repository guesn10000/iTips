//
//  GUOInfo2ViewController.m
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "SecondClassTemplateViewController.h"

@interface SecondClassTemplateViewController ()

@end

@implementation SecondClassTemplateViewController
@synthesize template;
@synthesize subject;
@synthesize room;
@synthesize beginWeek;
@synthesize endWeek;
@synthesize teacher;
@synthesize remark;
@synthesize subject2;
@synthesize room2;
@synthesize beginWeek2;
@synthesize endWeek2;
@synthesize teacher2;
@synthesize remark2;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)toggleControls:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if ([sender selectedSegmentIndex] == 1) {
        subject.hidden = YES;
        subject2.hidden = NO;
        room.hidden = YES;
        room2.hidden = NO;
        beginWeek.hidden = YES;
        beginWeek2.hidden = NO;
        endWeek.hidden = YES;
        endWeek2.hidden = NO;
        teacher.hidden = YES;
        teacher2.hidden = NO;
        remark.hidden = YES;
        remark2.hidden = NO;
        if (appDelegate.tableType == 2) {
            _doubleButton.hidden = NO;
        }
        else {
            _singleButton.hidden = NO;
        }
    }
    else {
        subject2.hidden = YES;
        subject.hidden = NO;
        room2.hidden = YES;
        room.hidden = NO;
        beginWeek2.hidden = YES;
        beginWeek.hidden = NO;
        endWeek2.hidden = YES;
        endWeek.hidden = NO;
        teacher2.hidden = YES;
        teacher.hidden = NO;
        remark2.hidden = YES;
        remark.hidden = NO;
        _singleButton.hidden = YES;
        _doubleButton.hidden = YES;
    }
}

- (IBAction) backgroundTap:(id)sender {
    [subject resignFirstResponder];
    [room resignFirstResponder];
    [beginWeek resignFirstResponder];
    [endWeek resignFirstResponder];
    [teacher resignFirstResponder];
    [remark resignFirstResponder];
    [subject2 resignFirstResponder];
    [room2 resignFirstResponder];
    [beginWeek2 resignFirstResponder];
    [endWeek2 resignFirstResponder];
    [teacher2 resignFirstResponder];
    [remark2 resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender//为跳转准备数据
{
    if ([[segue identifier] isEqualToString:@"setSingle"]) {
        OddClassTableViewController *des = [segue destinationViewController];//目标视图
        des.myTemplate = template;
        
        des.showSubject = subject.text;
        des.showRoom = room.text;
        des.showBeginWeek = beginWeek.text;
        des.showEndWeek = endWeek.text;
        des.showTeacher = teacher.text;
        des.showRemark = remark.text;
        
        des.showSubject2 = subject2.text;
        des.showRoom2 = room2.text;
        des.showBeginWeek2 = beginWeek2.text;
        des.showEndWeek2 = endWeek2.text;
        des.showTeacher2 = teacher2.text;
        des.showRemark2 = remark2.text;
    }
    else if ([[segue identifier] isEqualToString:@"setDouble"]) {
        EvenClassTableViewController *des = [segue destinationViewController];//目标视图
        des.myTemplate = template;
        
        des.showSubject = subject.text;
        des.showRoom = room.text;
        des.showBeginWeek = beginWeek.text;
        des.showEndWeek = endWeek.text;
        des.showTeacher = teacher.text;
        des.showRemark = remark.text;
        
        des.showSubject2 = subject2.text;
        des.showRoom2 = room2.text;
        des.showBeginWeek2 = beginWeek2.text;
        des.showEndWeek2 = endWeek2.text;
        des.showTeacher2 = teacher2.text;
        des.showRemark2 = remark2.text;
    }
}
@end
