//
//  GUOMusicViewController.m
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "MusicSelectedViewController.h"

@interface MusicSelectedViewController ()

@end

@implementation MusicSelectedViewController
@synthesize soundID;

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
        
        
        NSString *path;
        NSString *tempMusic;
        if (_selectedSnack == 0) {
            tempMusic = @"碎裂";
            path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
            NSURL *url = [NSURL fileURLWithPath:path];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
            AudioServicesPlaySystemSound(soundID);
        }
        else if (_selectedSnack == 1) {
            tempMusic = @"刷新";
            path = [[NSBundle mainBundle] pathForResource:@"xlwb" ofType:@"wav"];
            NSURL *url = [NSURL fileURLWithPath:path];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
            AudioServicesPlaySystemSound(soundID);
        }
    
        SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:tempMusic, nil];
        [saveDataToFile saveGameData2:array saveFileName:@"Music"];
    }
}

@end
