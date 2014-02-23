//
//  GUOCustomViewController.m
//  iTips
//
//  Created by guo on 13-5-3.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *body = @"请将手机横置，以便查看完整页面";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iTips提提你" message:body delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alert show];
    
    WeekCount *getWeek = [[WeekCount alloc] init];
    NSDate *now = [NSDate date];
    _title_week.text = [NSString stringWithFormat:@"%i周", [getWeek weekCount:now]];
    
    SaveDataToFile *loadDataFromFile = [[SaveDataToFile alloc] init];
    NSMutableArray *loadFile = [loadDataFromFile loadGameData2:@"Custom"];
    if (loadFile == nil) {
        loadFile = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    }
    _mon1.text = loadFile[0];
    _mon2.text = loadFile[1];
    _mon3.text = loadFile[2];
    _tue1.text = loadFile[3];
    _tue2.text = loadFile[4];
    _tue3.text = loadFile[5];
    _wed1.text = loadFile[6];
    _wed2.text = loadFile[7];
    _wed3.text = loadFile[8];
    _thu1.text = loadFile[9];
    _thu2.text = loadFile[10];
    _thu3.text = loadFile[11];
    _fri1.text = loadFile[12];
    _fri2.text = loadFile[13];
    _fri3.text = loadFile[14];
    _sat1.text = loadFile[15];
    _sat2.text = loadFile[16];
    _sat3.text = loadFile[17];
    _sun1.text = loadFile[18];
    _sun2.text = loadFile[19];
    _sun3.text = loadFile[20];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)background:(id)sender {
    [_mon1 resignFirstResponder];
    [_mon2 resignFirstResponder];
    [_mon3 resignFirstResponder];
    [_tue1 resignFirstResponder];
    [_tue2 resignFirstResponder];
    [_tue3 resignFirstResponder];
    [_wed1 resignFirstResponder];
    [_wed2 resignFirstResponder];
    [_wed3 resignFirstResponder];
    [_thu1 resignFirstResponder];
    [_thu2 resignFirstResponder];
    [_thu3 resignFirstResponder];
    [_fri1 resignFirstResponder];
    [_fri2 resignFirstResponder];
    [_fri3 resignFirstResponder];
    [_sat1 resignFirstResponder];
    [_sat2 resignFirstResponder];
    [_sat3 resignFirstResponder];
    [_sun1 resignFirstResponder];
    [_sun2 resignFirstResponder];
    [_sun3 resignFirstResponder];
}

- (IBAction)backAndSave:(id)sender {
    SaveDataToFile *saveDataToFile = [[SaveDataToFile alloc] init];
    NSMutableArray *loadFile = [[NSMutableArray alloc] initWithCapacity:21];
    
    loadFile[0] = _mon1.text;
    loadFile[1] = _mon2.text;
    loadFile[2] = _mon3.text;
    loadFile[3] = _tue1.text;
    loadFile[4] = _tue2.text;
    loadFile[5] = _tue3.text;
    loadFile[6] = _wed1.text;
    loadFile[7] = _wed2.text;
    loadFile[8] = _wed3.text;
    loadFile[9] = _thu1.text;
    loadFile[10] = _thu2.text;
    loadFile[11] = _thu3.text;
    loadFile[12] = _fri1.text;
    loadFile[13] = _fri2.text;
    loadFile[14] = _fri3.text;
    loadFile[15] = _sat1.text;
    loadFile[16] = _sat2.text;
    loadFile[17] = _sat3.text;
    loadFile[18] = _sun1.text;
    loadFile[19] = _sun2.text;
    loadFile[20] = _sun3.text;
    
    
    [saveDataToFile saveGameData2:loadFile saveFileName:@"Custom"];
}
@end
