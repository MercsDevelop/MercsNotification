//
//  ViewController.m
//  widget
//
//  Created by Mercsjho on 16/4/27.
//  Copyright © 2016年 Mercsjho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILocalNotification *note = [UILocalNotification new];
    note.alertBody = @"Mercs";
    note.applicationIconBadgeNumber = 10;
    note.category = @"CATEGORY";
    note.soundName = UILocalNotificationDefaultSoundName;
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
