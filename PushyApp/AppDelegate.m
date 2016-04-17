//
//  AppDelegate.m
//  PushyApp
//
//  Created by 嵇昊雨 on 4/17/16.
//  Copyright © 2016 嵇昊雨. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //clear badge
    application.applicationIconBadgeNumber = 0;
    

    //request notification object to associate with a predefined key. If not launched by notification, it would be nil
    UILocalNotification *localNotif = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    
    if(localNotif){
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received on launch" message:localNotif.alertBody preferredStyle:UIAlertControllerStyleAlert ];
        
        UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:aa];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application .keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
        });
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
    
    //clear badge
    application.applicationIconBadgeNumber = 0;
    
    
    //received a notification, display an alert controller
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Receive while running" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert ];
    
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [ac addAction:aa];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application .keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    });
}
@end
