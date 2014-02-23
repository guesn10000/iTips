//
//  GUOAppSettingsViewController.m
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "AppSettingsViewController.h"

@interface AppSettingsViewController ()

@end

@implementation AppSettingsViewController

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
    
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    _passWord = [loadDataFromFile loadGameData2:@"PassWord"][0];
    _mainViewBackground = [loadDataFromFile loadGameData2:@"MainViewBackground"][0];
    _music = [loadDataFromFile loadGameData2:@"Music"][0];
    
    _passWordLabel.text = _passWord;
    _mainViewBackgroundLabel.text = _mainViewBackground;
    _musicLabel.text = _music;
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

#pragma - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        UIActionSheet *warn = [[UIActionSheet alloc] initWithTitle:@"确定还原所有设置？" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
        warn.actionSheetStyle = UIActionSheetStyleAutomatic;
        [warn showInView:self.view];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != [actionSheet cancelButtonIndex])
    {
        UIApplication *app = [UIApplication sharedApplication];
        [app cancelAllLocalNotifications];
        
        SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
        NSMutableArray *barray = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"宇宙与地球"], nil];
        [saveDataToFile saveGameData2:barray saveFileName:@"MainViewBackground"];
        NSMutableArray *tarray = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"捏合"], nil];
        [saveDataToFile saveGameData2:tarray saveFileName:@"PassWord"];
        NSMutableArray *marray = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"刷新"], nil];
        [saveDataToFile saveGameData2:marray saveFileName:@"Music"];
        
        
        NSString *nul = @"";
        NSMutableArray *nularr = [[NSMutableArray alloc] initWithObjects:nul, nil];
        
        [saveDataToFile saveGameData2:nularr saveFileName:@"mon1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"mon2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"mon3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"tue1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"tue2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"tue3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"wed1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"wed2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"wed3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"thu1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"thu2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"thu3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"fri1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"fri2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"fri3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"sat1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"sat2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"sat3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"sun1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"sun2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"sun3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2mon1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2mon2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2mon3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2tue1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2tue2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2tue3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2wed1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2wed2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2wed3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2thu1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2thu2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2thu3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2fri1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2fri2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2fri3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2sat1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2sat2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2sat3"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2sun1"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2sun2"];
        [saveDataToFile saveGameData2:nularr saveFileName:@"2sun3"];
        
        NSMutableArray *loadFile = [[NSMutableArray alloc] initWithCapacity:21];
        loadFile[0] = @"";
        loadFile[1] = @"";
        loadFile[2] = @"";
        loadFile[3] = @"";
        loadFile[4] = @"";
        loadFile[5] = @"";
        loadFile[6] = @"";
        loadFile[7] = @"";
        loadFile[8] = @"";
        loadFile[9] = @"";
        loadFile[10] = @"";
        loadFile[11] = @"";
        loadFile[12] = @"";
        loadFile[13] = @"";
        loadFile[14] = @"";
        loadFile[15] = @"";
        loadFile[16] = @"";
        loadFile[17] = @"";
        loadFile[18] = @"";
        loadFile[19] = @"";
        loadFile[20] = @"";
        [saveDataToFile saveGameData2:loadFile saveFileName:@"Custom"];
        
        SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
        _passWord = [loadDataFromFile loadGameData2:@"PassWord"][0];
        _mainViewBackground = [loadDataFromFile loadGameData2:@"MainViewBackground"][0];
        _music = [loadDataFromFile loadGameData2:@"Music"][0];
        
        _passWordLabel.text = _passWord;
        _mainViewBackgroundLabel.text = _mainViewBackground;
        _musicLabel.text = _music;
        
        //TaskList Clear
        NSMutableArray *clrlist = [[NSMutableArray alloc] init];
        [loadDataFromFile saveGameData2:clrlist saveFileName:@"appTaskList"];
    }
}

@end
