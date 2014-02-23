//
//  GUOPassWordViewController.m
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "SetPassWordViewController.h"

@interface SetPassWordViewController ()

@end

@implementation SetPassWordViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _selectedSnack = NSNotFound;
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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row != self.selectedSnack) {
            if (self.selectedSnack != NSNotFound) {
                NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.selectedSnack
                                                               inSection:0];
                UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
                oldCell.accessoryType = UITableViewCellAccessoryNone;
            }
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.selectedSnack = indexPath.row;
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        NSString *tempPassWord = [[NSString alloc] init];
        switch (_selectedSnack) {
            case 0:
                tempPassWord = @"打钩";
                break;
            case 1:
                tempPassWord = @"翻页";
                break;
            case 2:
                tempPassWord = @"摇动";
                break;
            case 3:
                tempPassWord = @"划圆圈";
                break;
            case 4:
                tempPassWord = @"捏合";
                break;
        }
        
        SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:tempPassWord, nil];
        [saveDataToFile saveGameData2:array saveFileName:@"PassWord"];
    }
}


@end
