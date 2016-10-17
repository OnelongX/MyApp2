//
//  AppDelegate.m
//  MyApp
//
//  Created by 黄隆 on 16/9/27.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "AppDelegate.h"
#import "CTMediator+HomeAction.h"
#import "CTMediator+CustomerAction.h"
#import "CTMediator+MessageAction.h"
#import "CTMediator+SettingsAction.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *vc1 = [[CTMediator sharedInstance]mediator_homeViewControllerWithParams:@{}];
    vc1.tabBarItem.title=@"首页";
    UIViewController *vc2 = [[CTMediator sharedInstance]mediator_customerViewControllerWithParams:@{}];
    vc2.tabBarItem.title=@"客户";
    UIViewController *vc3 = [[CTMediator sharedInstance]mediator_messageViewControllerWithParams:@{}];
    vc3.tabBarItem.title=@"消息";
    UIViewController *vc4 = [[CTMediator sharedInstance]mediator_settingsViewControllerWithParams:@{}];
    vc4.tabBarItem.title=@"设置";
    
    UITabBarController *tabs = [[UITabBarController alloc]init];
    
    self.window.rootViewController = tabs;
    
    tabs.viewControllers=@[vc1,vc2,vc3,vc4];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
