//
//  GUOMorningTableViewController.m
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "MorningTableViewController.h"

@interface MorningTableViewController ()

@end

@implementation MorningTableViewController

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
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.timeSegment = 1;
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    if (index.row == 2) {
        SecondClassTemplateViewController *des = [segue destinationViewController];//目标视图3
        switch (index.row) {
            case 0:
                des.template = @"2+0";
                break;
            case 1:
                des.template = @"3+0";
                break;
            case 2:
                des.template = @"2+2";
                break;
            case 3:
                des.template = @"4+0";
                break;
            default:
                break;
        }
    }
    else {
        FirstClassTemplateViewController *des = [segue destinationViewController];//目标视图
        switch (index.row) {
            case 0:
                des.template = @"2+0";
                break;
            case 1:
                des.template = @"3+0";
                break;
            case 2:
                des.template = @"2+2";
                break;
            case 3:
                des.template = @"4+0";
                break;
            default:
                break;
        }
    }
    
}

@end
