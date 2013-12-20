//
//  dummyAppDelegate.h
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dummyAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

-(IBAction)afterLogin:(id)sender;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@end
