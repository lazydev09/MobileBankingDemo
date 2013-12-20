//
//  LogoutViewController.m
//  MobileBanking
//
//  Created by picmondlion on 13/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogoutViewController.h"
#import "dummyFirstViewController.h"

@interface LogoutViewController ()

@end

@implementation LogoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Logout";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIViewController *viewController1 = [[dummyFirstViewController alloc] initWithNibName:@"dummyFirstViewController_iPhone" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
   
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1,  nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
