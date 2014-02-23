//
//  GUOMusicViewController.h
//  iTips
//
//  Created by guo on 13-4-29.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveDataToFile.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MusicSelectedViewController : UITableViewController
@property (assign, nonatomic) NSUInteger selectedSnack;
@property (assign, nonatomic) SystemSoundID soundID;
@end
