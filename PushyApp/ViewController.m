//
//  ViewController.m
//  PushyApp
//
//  Created by 嵇昊雨 on 4/17/16.
//  Copyright © 2016 嵇昊雨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) requestPermissionToNotify;

- (void) createANotification:(int)seconds_in_future;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) requestPermissionToNotify{
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
}

- (void) createANotification:(int)seconds_in_future{
    //create local notificaiton object
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    
    //set the fire time of this notification
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:seconds_in_future];
    
    //if you want the notification fire date to stick to one specific time zone
    localNotif.timeZone = nil;
    
    //set notification title
    localNotif.alertTitle = @"Alert Title ";
    
    //set notification body
    localNotif.alertBody = @"Alert Body";
    
    //provide an action to close notification
    localNotif.alertAction = @"confirm";
    
    //set the sound
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    //set badge number
    localNotif.applicationIconBadgeNumber = 1018;
    
    //schedule the notification into application
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
    
}

@end
