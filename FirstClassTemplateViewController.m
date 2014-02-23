//
//  GUOInfo1ViewController.m
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "FirstClassTemplateViewController.h"

@interface FirstClassTemplateViewController ()

@end

@implementation FirstClassTemplateViewController
@synthesize template;
@synthesize subject;
@synthesize room;
@synthesize beginWeek;
@synthesize endWeek;
@synthesize teacher;
@synthesize remark;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.tableType == 2) {
        _singleButton.hidden = YES;
        _doubleButton.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)backgroundTap:(id)sender {
    [subject resignFirstResponder];
    [room resignFirstResponder];
    [beginWeek resignFirstResponder];
    [endWeek resignFirstResponder];
    [teacher resignFirstResponder];
    [remark resignFirstResponder];
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
    }
}
@end
