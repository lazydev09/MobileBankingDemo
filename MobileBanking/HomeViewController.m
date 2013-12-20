//
//  HomeViewController.m
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

#import "QuartzCore/QuartzCore.h"

#import "dummyFirstViewController.h"

#import "LogoutViewController.h"

#import "AccountSummaryViewController.h"

#import "CardSummaryViewController.h"

#import "transferViewController.h"

#import "PaymentsViewController.h"

#import "AuthController.h"

#import "MailBoxViewController.h"

#import "PromotionsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize lblLastLogin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Mobile Banking";
        self.tabBarItem.image = [UIImage imageNamed:@"home_30"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lblLastLogin.layer.cornerRadius=8;
    
    authDelegate = [AuthController sharedObject];
    //authDelegate = [AuthController sharedObject];
    NSLog(@"authDelegate %@",authDelegate);
    [authDelegate setAuthDelegate:self];
    [authDelegate checkAuthetication:@"ABC"];
    
    NSDictionary *dummyDictData = [authDelegate getPlistDictionary:@"default"];
    NSDate *lastLogin = (NSDate*)[dummyDictData objectForKey:@"LastLogin"];
    
    NSString* welcomeMsg = @"Welcome Picmond! \n Last login on ";
    NSDate *date = [NSDate date];
   // NSDate* lastLoginDate = (NSDate*)[lastLogin objectAtIndex:0];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];//'at' HH:mm"];
    
    NSString *dateString = [dateFormat stringFromDate:lastLogin];  
    self.lblLastLogin.text=[welcomeMsg stringByAppendingString:dateString];
    
    //write
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OutsidePath" ofType:@"plist" ];
    NSMutableDictionary *mutableDictData = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    [mutableDictData setObject:date forKey:@"LastLogin"];
    [mutableDictData writeToFile:path atomically:YES];
    
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
    
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
#pragma Authdelegate methods

-(void)verifyAuth:(NSString *)result{
    NSLog(@"response from delegate %@",result);
}

-(void)alertSessionTimedOut{
    NSLog(@"in timeout alert" );
    
}

-(void)logout{
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authDelegate logout];
}


- (IBAction)gotoAccounts:(id)sender {
    //for accounts
    UIViewController *viewController3 = [[AccountSummaryViewController alloc]initWithNibName:@"AccountSummaryViewController" bundle:nil];
    UINavigationController *transferNavigator1 = [[UINavigationController alloc]initWithRootViewController:viewController3];
    
    NSMutableArray *arrayViewControllers = [self.tabBarController.viewControllers mutableCopy];
    //replace object 1
    [arrayViewControllers replaceObjectAtIndex:1 withObject:transferNavigator1];
    self.tabBarController.viewControllers=[[NSArray alloc]initWithArray:arrayViewControllers];
    self.tabBarController.selectedIndex=1;
}

- (IBAction)gotoTransfers:(id)sender {
    //for funds transfers
    UIViewController *viewController3 = [[transferViewController alloc]initWithNibName:@"transferViewController" bundle:nil];
    UINavigationController *transferNavigator1 = [[UINavigationController alloc]initWithRootViewController:viewController3];

    NSMutableArray *arrayViewControllers = [self.tabBarController.viewControllers mutableCopy];
    //replace object 2
   [arrayViewControllers replaceObjectAtIndex:2 withObject:transferNavigator1];
    self.tabBarController.viewControllers=[[NSArray alloc]initWithArray:arrayViewControllers];
    self.tabBarController.selectedIndex=2;
}

- (IBAction)gotoPayments:(id)sender {
    
    //for payments
    UIViewController *viewController3 = [[PaymentsViewController alloc]initWithNibName:@"PaymentsViewController" bundle:nil];
    UINavigationController *transferNavigator1 = [[UINavigationController alloc]initWithRootViewController:viewController3];
    
    NSMutableArray *arrayViewControllers = [self.tabBarController.viewControllers mutableCopy];
    //replace object 3
    [arrayViewControllers replaceObjectAtIndex:3 withObject:transferNavigator1];
    self.tabBarController.viewControllers=[[NSArray alloc]initWithArray:arrayViewControllers];
    self.tabBarController.selectedIndex=3;
}

- (IBAction)gotoCards:(id)sender {
    
    //for accounts
    UIViewController *viewController3 = [[CardSummaryViewController alloc]initWithNibName:@"CardSummaryViewController" bundle:nil];
    UINavigationController *transferNavigator1 = [[UINavigationController alloc]initWithRootViewController:viewController3];
    
    NSMutableArray *arrayViewControllers = [self.tabBarController.viewControllers mutableCopy];
    //replace object 1
    [arrayViewControllers replaceObjectAtIndex:1 withObject:transferNavigator1];
    self.tabBarController.viewControllers=[[NSArray alloc]initWithArray:arrayViewControllers];
    self.tabBarController.selectedIndex=1;

}

- (IBAction)gotoMessages:(id)sender {
    
    //for messages
    UIViewController *viewController3 = [[MailBoxViewController alloc]initWithNibName:@"MailBoxViewController" bundle:nil];
    UINavigationController *transferNavigator1 = [[UINavigationController alloc]initWithRootViewController:viewController3];
    
    NSMutableArray *arrayViewControllers = [self.tabBarController.viewControllers mutableCopy];
    //replace object 4
    [arrayViewControllers replaceObjectAtIndex:4 withObject:transferNavigator1];
    self.tabBarController.viewControllers=[[NSArray alloc]initWithArray:arrayViewControllers];
    self.tabBarController.selectedIndex=4;

}

- (IBAction)gotoPromotions:(id)sender {
    
    //for messages
    UIViewController *detailsView = [[PromotionsViewController alloc]initWithNibName:@"PromotionsViewController" bundle:nil];
    [self.navigationController pushViewController:detailsView animated:YES];
    
}
@end
