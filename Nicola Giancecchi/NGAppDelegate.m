//
//  NGAppDelegate.m
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 08/04/14.
//  Copyright (c) 2014 Nicola Giancecchi. All rights reserved.
//

#import "NGAppDelegate.h"


@implementation NGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    // Override point for customization after application launch.
    
    NGHomeViewController *test = [[NGHomeViewController alloc]     initWithNibName:@"NGHomeViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]  initWithRootViewController:test];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    UIColor *color = [UIColor colorWithWhite:0.2 alpha:1.0];
    
    nav.navigationBar.barTintColor = color;
    nav.navigationBar.tintColor = [UIColor whiteColor];
        [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                                           
                                                           NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Bold" size:16.0],
                                                           }];
    
    
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

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end