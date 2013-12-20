//
//  dummyAppDelegate.m
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dummyAppDelegate.h"

#import "dummyFirstViewController.h"

#import "dummySecondViewController.h"

#import "AccountSummaryViewController.h"

#import "transferViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@implementation dummyAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize splitViewController = _splitViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1;    
    UINavigationController *navController1;
   NSLog(@"Device: %d", [[UIDevice currentDevice] userInterfaceIdiom]);
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[dummyFirstViewController alloc] initWithNibName:@"dummyFirstViewController_iPhone" bundle:nil];
        navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
        self.tabBarController = [[UITabBarController alloc] init];
        self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1,  nil];
        self.window.rootViewController = self.tabBarController;
        [self.window makeKeyAndVisible];
        self.tabBarController.delegate=self;
        _tabBarController.tabBar.tintColor=[UIColor darkTextColor];

                    
    } else {
        NSLog(@"in ipad");
        viewController1 = [[dummyFirstViewController alloc] initWithNibName:@"dummyFirstViewController_iPad" bundle:nil];
        navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
        
        UISplitViewController *splitView1 = [[UISplitViewController alloc]initWithNibName:@"WelcomeViewController_ipad" bundle:nil];
        
        LeftViewController *leftView = [[LeftViewController alloc]initWithNibName:@"LeftViewController" bundle:nil];
    
        RightViewController *rightView = [[RightViewController alloc]initWithNibName:@"RightViewController" bundle:nil];
        UINavigationController *leftNav = [[UINavigationController alloc]initWithRootViewController:leftView];
        UINavigationController *rightNav = [[UINavigationController alloc]initWithRootViewController:rightView];
    
        leftView.detailViewController=rightView;
        
        
            
        self.splitViewController = [[UISplitViewController alloc] init];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:leftNav, rightNav, nil];
        leftView.detailViewController=rightView;
        self.splitViewController.delegate = rightView;
        self.window.rootViewController = self.splitViewController;

        [self.window addSubview:self.splitViewController.view];
        [self.window makeKeyAndVisible];
   
    }
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    NSLog(@"********applicationWillResignActive********");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"********applicationDidEnterBackground********");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"********applicationWillEnterForeground********");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSLog(@"********applicationDidBecomeActive********");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"********applicationWillTerminate********");
}


// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"in selected view controller %@",viewController);
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        NSLog(@"in selected view controller %@",viewController);
        
        [(UINavigationController *)viewController popToRootViewControllerAnimated:YES];
        if ([viewController isKindOfClass:[dummyFirstViewController class]]) {
            NSLog(@"****^^^^Login");
        }
    }
    
}

-(IBAction)afterLogin:(id)sender{
    NSLog(@"LOGGED IN");
}


// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    NSLog(@"TAB BAR ITEMS CHANGED");

}



@end
