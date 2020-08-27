//
//  AppDelegate.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/20.
//  Copyright © 2020 itheima. All rights reserved.
//
#import "AppDelegate.h"
#import "MYViewController.h"
#import "HZViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建窗口并且指定大小
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

   
    
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
       
       UIViewController *controller1 = [[UIViewController alloc] init];
       controller1.view.backgroundColor = [UIColor redColor];
       controller1.tabBarItem.title = @"首页";
       
       UIViewController *controller2 = [[UIViewController alloc] init];
       controller2.view.backgroundColor = [UIColor yellowColor];
       controller2.tabBarItem.title = @"南岗";
       
//       UIViewController *controller3 = [[UIViewController alloc] init];
//       controller3.view.backgroundColor = [UIColor blueColor];
//       controller3.tabBarItem.title = @"消息";
       
        HZViewController *controller3 = [NSClassFromString(@"HZViewController") new];
        UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:controller3];
        nav3.tabBarItem.title=@"消息";
    
    //   MYViewController *controller4 = [[MYViewController alloc] init];
      MYViewController *controller4 = [NSClassFromString(@"MYViewController") new];
      UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:controller4];
    nav4.tabBarItem.title=@"我的";
       // 将四个页面的 UIViewController 加入到 UITabBarController 之中
       [tabbarController setViewControllers: @[controller1, controller2, nav3, nav4]];
       
       self.window.rootViewController = tabbarController;
       [self.window makeKeyAndVisible];
    
    
    
  
    
    return YES;
}

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
