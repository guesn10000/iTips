//
//  GUOSetTableViewController.m
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "WeekDayTableViewController.h"

@interface WeekDayTableViewController ()

@end

@implementation WeekDayTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender//为跳转准备数据
{
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.weekDay = index.row + 1;
}

@end
