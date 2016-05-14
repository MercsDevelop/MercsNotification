//
//  AppDelegate.m
//  widget
//
//  Created by Mercsjho on 16/4/27.
//  Copyright © 2016年 Mercsjho. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIMutableUserNotificationAction *action1 = [UIMutableUserNotificationAction new];
    action1.identifier = @"ACTION_1";
    action1.title = @"Title1";
    action1.activationMode = UIUserNotificationActivationModeForeground;
    //验证需求
    action1.authenticationRequired = YES;
    action1.destructive = NO;
    
    UIMutableUserNotificationAction *action2 = [UIMutableUserNotificationAction new];
    action2.identifier = @"ACTION_1";
    action2.title = @"Title1";
    action2.activationMode = UIUserNotificationActivationModeBackground;
    action2.authenticationRequired = YES;
    action2.destructive = NO;
    
    UIMutableUserNotificationAction *action3 = [UIMutableUserNotificationAction new];
    action3.identifier = @"ACTION_1";
    action3.title = @"Title1";
    action3.activationMode = UIUserNotificationActivationModeBackground;
    action3.authenticationRequired = YES;
    action3.destructive = NO;
    
    UIMutableUserNotificationAction *action4 = [UIMutableUserNotificationAction new];
    action4.identifier = @"ACTION_1";
    action4.title = @"Title1";
    action4.activationMode = UIUserNotificationActivationModeBackground;
    action4.authenticationRequired = YES;
    action4.destructive = NO;
    
    //UIUserNotificationActionContextDefault可指定4个action
    //UIUserNotificationActionContextMinimal可指定2个action
    UIMutableUserNotificationCategory *category = [UIMutableUserNotificationCategory new];
    category.identifier = @"CATEGORY";
    [category setActions:@[action1,action2,action3,action4] forContext:UIUserNotificationActionContextDefault];
    NSSet *categorys = [NSSet setWithObjects:category, nil];
    
    //App接收哪些信息
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:categorys];
    [application registerUserNotificationSettings:setting];
    return YES;
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    if ([notification.category isEqualToString:@"CATEGORY"]) {
        if ([identifier isEqualToString:@"ACTION_1"]) {
            NSLog(@"单机了category1, Action1");
        }
        if ([identifier isEqualToString:@"ACTION_2"]) {
            [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
            NSLog(@"单机了category1, Action2");
        }
        if ([identifier isEqualToString:@"ACTION_3"]) {
            NSLog(@"单机了category1, Action3");
        }
        if ([identifier isEqualToString:@"ACTION_4"]) {
            NSLog(@"单机了category1, Action4");
        }
    }
    completionHandler();
}

/*- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    //向APNS注册
    [application registerForRemoteNotifications];
}*/

/*- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //返回向APNS注册的token数据
    NSLog(@"Token is %@", deviceToken);
}*/

/*- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //注册APNS失败时调用
    NSLog(@"notification error: %@", [error localizedDescription]);
}*/

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
