//
//  GUOMainViewBackgroundController.m
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "SetBackgroundViewController.h"

@interface SetBackgroundViewController ()

@end

@implementation SetBackgroundViewController

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
        
        NSString *tempMainViewBackground = [[NSString alloc] init];
        switch (_selectedSnack) {
            case 0:
                tempMainViewBackground = @"宇宙与地球";
                break;
            case 1:
                tempMainViewBackground = @"天空的小鸟";
                break;
            case 2:
                tempMainViewBackground = @"海底的泡泡龙";
                break;
        }
        
        SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:tempMainViewBackground, nil];
        [saveDataToFile saveGameData2:array saveFileName:@"MainViewBackground"];
    }
}
@end
