//
//  OneTimePayConfirmViewController.m
//  MobileBanking
//
//  Created by picmondlion on 14/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OneTimePayConfirmViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "AuthController.h"
#import "LogoutViewController.h"
#import "HomeViewController.h"


@interface OneTimePayConfirmViewController ()

@end

@implementation OneTimePayConfirmViewController

@synthesize lbl1,lbl2,lbl3,lbl4,lbl5,fromAccLbl,billerLbl,amtLbl,descLbl;
@synthesize lblC1,lblC2,lblC3,lblC4;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Confirm Payment";
    }
    return self;
}

- (id)initWithNibFromPayment:(NSMutableDictionary *)tempDic{
    
    self = [super initWithNibName:@"OneTimePayConfirmViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"Confirm Payment";
        payDic=[tempDic copy];
        UIBarButtonItem *confirmBtn = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmPay:)];
        self.navigationItem.rightBarButtonItem = confirmBtn;

    }
    return self;
}

- (id)initResultView:(NSMutableDictionary *)tempDic{
    
    self = [super initWithNibName:@"OneTimePayResultView" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"Result";
        payDic=[tempDic copy];
        UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
        UIBarButtonItem *homeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(home:)];
        self.navigationItem.rightBarButtonItem = homeBtn;
        self.navigationItem.leftBarButtonItem = logoutBtn;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    lbl1.layer.cornerRadius=8;
    lbl2.layer.cornerRadius=8;
    lbl3.layer.cornerRadius=8;
    lbl4.layer.cornerRadius=8;
    lbl5.layer.cornerRadius=8;
    //confirm
    lblC1.layer.cornerRadius=8;
    
    lblC1.hidden=YES;
    lblC2.hidden=YES;
    lblC3.hidden=YES;
    lblC4.hidden=YES;
    
    CGSize minLabelSize = CGSizeMake(1,1);
    CGRect rec1 = CGRectMake(80, 80, 1, 1);
    lblC1.frame=rec1;
    
   
    self.fromAccLbl.text=[payDic objectForKey:@"fromacc"];
    self.billerLbl.text=[payDic objectForKey:@"toacc"];
    self.amtLbl.text=[payDic objectForKey:@"amount"];
    self.descLbl.text=[payDic objectForKey:@"desc"];
    
    
    
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

-(IBAction)confirmPay:(id)sender{
    /*lblC1.hidden=NO;
    lblC2.hidden=NO;
    lblC3.hidden=NO;
    lblC4.hidden=NO;
    lbl1.text=@"Step 3 of 3";
    self.title=@"Payment";*/
    alertProcessTrxn = [[UIAlertView alloc] initWithTitle:@"Processing Payment\nPlease Wait..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil] ;
    [alertProcessTrxn show];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Adjust the indicator so it is up a few pixels from the bottom of the alert
    indicator.center = CGPointMake(alertProcessTrxn.bounds.size.width / 2, alertProcessTrxn.bounds.size.height - 50);
    [indicator startAnimating];
    [alertProcessTrxn addSubview:indicator];
    
    NSTimer *dummyTrxnTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(afterDummyTrxnWait:) userInfo:nil repeats:NO];

   
}


-(IBAction)afterDummyTrxnWait:(id)sender{
    
    UIViewController *detailsView = [[OneTimePayConfirmViewController alloc]initResultView:payDic];    [self.navigationController pushViewController:detailsView animated:YES];
    
    
    
    [alertProcessTrxn dismissWithClickedButtonIndex:0 animated:YES];
}

-(IBAction)logout:(id)sender{
    authDelegate = [AuthController sharedObject];
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authDelegate logout];

}
-(IBAction)home:(id)sender{
    self.tabBarController.selectedIndex=0;
}
@end
