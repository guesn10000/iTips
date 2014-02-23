//
//  GUOClassTableViewController.h
//  ClassTable_Demo
//
//  Created by guo on 13-4-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "WeekCount.h"

@interface OddClassTableViewController : UIViewController
@property (strong, nonatomic) NSString *myTemplate;

@property (strong, nonatomic) NSString *showSubject;
@property (strong, nonatomic) NSString *showRoom;
@property (strong, nonatomic) NSString *showBeginWeek;
@property (strong, nonatomic) NSString *showEndWeek;
@property (strong, nonatomic) NSString *showTeacher;
@property (strong, nonatomic) NSString *showRemark;
@property (strong, nonatomic) NSString *showTemplate;

@property (strong, nonatomic) NSString *showSubject2;
@property (strong, nonatomic) NSString *showRoom2;
@property (strong, nonatomic) NSString *showBeginWeek2;
@property (strong, nonatomic) NSString *showEndWeek2;
@property (strong, nonatomic) NSString *showTeacher2;
@property (strong, nonatomic) NSString *showRemark2;
@property (strong, nonatomic) NSString *showTemplate2;

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

@property (weak, nonatomic) IBOutlet UITextView *week;
@property int weekCount;
@end
