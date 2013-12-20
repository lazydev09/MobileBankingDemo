//
//  TransferAmtViewController.m
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TransferAmtViewController.h"
#import "TransferDateViewController.h"
#import "AuthController.h"
#import "LogoutViewController.h"

@interface TransferAmtViewController ()

@end

@implementation TransferAmtViewController
@synthesize txtAmt,txtDesc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"AMOUNT";
    }
    return self;
}

- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"TransferAmtViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"AMOUNT";
        transfersDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
        fromView=@"Transfers";
        NSLog(@"in transfer constructor : amt");
    }
    return self;
}


- (id)initWithNibFromPayments:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"TransferAmtViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"AMOUNT";
        transfersDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
        fromView=@"Payments";
        NSLog(@"in payment constructor : amt");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
    authController = [AuthController sharedObject];
    [authController resetTimer];
}

- (void)viewDidUnload
{
    self.title=nil;
    self.txtAmt=nil;
    self.txtDesc=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction) continueTransfer:(id)sender{
    [transfersDict setObject:txtAmt.text forKey:@"amount"];
    [transfersDict setObject:txtDesc.text forKey:@"desc"];
    
   if ([fromView isEqualToString:@"Payments"]) {
       TransferDateViewController *detailsView = [[TransferDateViewController alloc]initWithNibFromPayments:transfersDict];
       [self.navigationController pushViewController:detailsView animated:YES];
   }
   else{
    TransferDateViewController *detailsView = [[TransferDateViewController alloc]initWithNibFromTransfers:transfersDict];
       [self.navigationController pushViewController:detailsView animated:YES];
   }
    
    

}

-(IBAction)logout:(id)sender{
    NSLog(@"IN LOGOUT");
    //AuthController *authDelegate = [AuthController sharedObject];
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authController logout];

}


@end
