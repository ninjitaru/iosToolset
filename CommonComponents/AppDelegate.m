//
//  AppDelegate.m
//  CommonComponents
//
//  Created by Jason Chang on 9/17/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Private.h"
#import "Store.h"
#import "ExampleViewController.h"
#import "NSObject+PropertyName.h"

@implementation AppDelegate

- (Store *) store {
    // doing so making use any call to store result in the same instance
//    return [Store sharedInstance];
    // or we can do !_store , _store = [Store new] thing
    // holding a strong reference to store instead of static global reference to store through sharedInstance
    if(!_store) {
        _store = [Store new];
    }
    return _store;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
 	self.window.rootViewController = [ExampleViewController new];
    NSLog(@"%@",keypathStringForClass(UIApplication, applicationState));
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
