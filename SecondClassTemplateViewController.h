//
//  GUOInfo2ViewController.h
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstClassTemplateViewController.h"
#import "SecondClassTemplateViewController.h"
#import "AppDelegate.h"

@interface SecondClassTemplateViewController : UIViewController
@property (strong, nonatomic) NSString *template;
@property (weak, nonatomic) IBOutlet UITextField *subject;
@property (weak, nonatomic) IBOutlet UITextField *room;
@property (weak, nonatomic) IBOutlet UITextField *beginWeek;
@property (weak, nonatomic) IBOutlet UITextField *endWeek;
@property (weak, nonatomic) IBOutlet UITextField *teacher;
@property (weak, nonatomic) IBOutlet UITextView *remark;
- (IBAction)toggleControls:(id)sender;
- (IBAction)backgroundTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *subject2;
@property (weak, nonatomic) IBOutlet UITextField *room2;
@property (weak, nonatomic) IBOutlet UITextField *beginWeek2;
@property (weak, nonatomic) IBOutlet UITextField *endWeek2;
@property (weak, nonatomic) IBOutlet UITextField *teacher2;
@property (weak, nonatomic) IBOutlet UITextView *remark2;
@property (weak, nonatomic) IBOutlet UIButton *singleButton;
@property (weak, nonatomic) IBOutlet UIButton *doubleButton;
@end
