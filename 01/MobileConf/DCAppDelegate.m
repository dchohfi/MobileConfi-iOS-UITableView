//
//  DCAppDelegate.m
//  MobileConf
//
//  Created by Diego Chohfi on 4/4/13.
//  Copyright (c) 2013 Diego Chohfi. All rights reserved.
//

#import "DCAppDelegate.h"
#import "DCViewController.h"
@implementation DCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    DCViewController *viewController = [[DCViewController alloc] init];
    viewController.title = @"MobileConf WIN";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
