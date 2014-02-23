//
//  GUOCustomViewController.h
//  iTips
//
//  Created by guo on 13-5-3.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveDataToFile.h"
#import "WeekCount.h"

@interface CustomViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *title_week;
@property (weak, nonatomic) IBOutlet UITextView *mon1;
@property (weak, nonatomic) IBOutlet UITextView *mon2;
@property (weak, nonatomic) IBOutlet UITextView *mon3;
@property (weak, nonatomic) IBOutlet UITextView *tue1;
@property (weak, nonatomic) IBOutlet UITextView *tue2;
@property (weak, nonatomic) IBOutlet UITextView *tue3;
@property (weak, nonatomic) IBOutlet UITextView *wed1;
@property (weak, nonatomic) IBOutlet UITextView *wed2;
@property (weak, nonatomic) IBOutlet UITextView *wed3;
@property (weak, nonatomic) IBOutlet UITextView *thu1;
@property (weak, nonatomic) IBOutlet UITextView *thu2;
@property (weak, nonatomic) IBOutlet UITextView *thu3;
@property (weak, nonatomic) IBOutlet UITextView *fri1;
@property (weak, nonatomic) IBOutlet UITextView *fri2;
@property (weak, nonatomic) IBOutlet UITextView *fri3;
@property (weak, nonatomic) IBOutlet UITextView *sat1;
@property (weak, nonatomic) IBOutlet UITextView *sat2;
@property (weak, nonatomic) IBOutlet UITextView *sat3;
@property (weak, nonatomic) IBOutlet UITextView *sun1;
@property (weak, nonatomic) IBOutlet UITextView *sun2;
@property (weak, nonatomic) IBOutlet UITextView *sun3;
- (IBAction)background:(id)sender;
- (IBAction)backAndSave:(id)sender;

@end
