//
//  GUOAppSettingsViewController.h
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveDataToFile.h"
#import "OddClassTableViewController.h"
#import "EvenClassTableViewController.h"
#import "CustomViewController.h"

@interface AppSettingsViewController : UITableViewController
@property (strong, nonatomic) NSString *passWord;
@property (strong, nonatomic) NSString *mainViewBackground;
@property (strong, nonatomic) NSString *sounds;
@property (strong, nonatomic) NSString *music;
@property (weak, nonatomic) IBOutlet UILabel *passWordLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainViewBackgroundLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicLabel;
@end
