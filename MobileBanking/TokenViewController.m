//
//  TokenViewController.m
//  MobileBanking
//
//  Created by mishanet on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TokenViewController.h"

#import "AccountSummaryViewController.h"

#import "transferViewController.h"

#import "PaymentsViewController.h"

#import "AuthController.h"

#import "HomeViewController.h"

#import "MailBoxViewController.h"

#import "WelcomeViewController_ipad.h"


@interface TokenViewController ()

@end

@implementation TokenViewController
@synthesize otp;
@synthesize splitViewController = _splitViewController;
@synthesize leftViewController = _leftViewController;
@synthesize rightViewController = _rightViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Token Authentication";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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

-(IBAction)doLogin:(id)sender{
    NSLog(@"LOGIN change tab");
    
    
    UIViewController  *viewController3, *homeViewController, *msgViewController, *payViewController;    
    AccountSummaryViewController *accSumViewController1;
    UINavigationController *accSumNavController1, *transferNavigator1,  *msgNavController, *homeNavController, *payNavController;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //viewController2 = [[dummySecondViewController alloc] initWithNibName:@"dummySecondViewController_iPhone" bundle:nil];
        //for account summary
        accSumViewController1 = [[AccountSummaryViewController alloc] initWithNibName:@"AccountSummaryViewController" bundle:Nil];
        accSumNavController1 = [[UINavigationController alloc] initWithRootViewController:accSumViewController1];
        //for funds transfers
        viewController3 = [[transferViewController alloc]initWithNibName:@"transferViewController" bundle:nil];
        transferNavigator1 = [[UINavigationController alloc]initWithRootViewController:viewController3];
       //for payments
        payViewController = [[PaymentsViewController alloc]initWithNibName:@"PaymentsViewController" bundle:nil];
        payNavController = [[UINavigationController alloc]initWithRootViewController:payViewController];
        //home page
        homeViewController = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        homeNavController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
        //messages
        msgViewController = [[MailBoxViewController alloc]initWithNibName:@"MailBoxViewController" bundle:nil];
        msgNavController = [[UINavigationController alloc]initWithRootViewController:msgViewController];
         self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNavController,accSumNavController1, transferNavigator1, payNavController, msgNavController, nil];
        
    } else {
       
                
    }
    
   
    
    
    
}


@end
