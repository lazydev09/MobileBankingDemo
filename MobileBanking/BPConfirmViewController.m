//
//  BPConfirmViewController.m
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import "BPConfirmViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "AuthController.h"
#import "LogoutViewController.h"

@interface BPConfirmViewController ()

@end

@implementation BPConfirmViewController
@synthesize trxnRefNo;
@synthesize trxnResult;
@synthesize btn1;
@synthesize btnConfirm;
@synthesize lblFromAcc,lblBillerAcc,lblAmt,lblDesc,lblTransferType,lblTransferDate;
@synthesize btnHeading;


- (id)initWithNibFromPayments:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"BPConfirmViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"CONFIRM";
        transfersDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
        
        NSLog(@"123 valuei n tconfirm %@",[dict objectForKey:@"toacc"]);
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
    self.trxnResult.text=@"Click CONFIRM to Finish Transaction";
    
    self.btn1.hidden=YES;
    
    UIImage* imageConfirm = [UIImage imageNamed:@"bc_confirm.png"];
    [btnHeading setBackgroundImage:imageConfirm forState:UIControlStateNormal];
    
    self.view.layer.cornerRadius=8;
    
    lblFromAcc.text=[transfersDict objectForKey:@"fromacc"];
    lblBillerAcc.text=[transfersDict objectForKey:@"toacc"];
    lblAmt.text=[transfersDict objectForKey:@"amount"];
    lblDesc.text=[transfersDict objectForKey:@"desc"];
    lblTransferType.text=[transfersDict objectForKey:@"transferType"];
    lblTransferDate.text=[transfersDict objectForKey:@"transferDate"];
    
    authController = [AuthController sharedObject];
    [authController resetTimer];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.lblAmt=nil;
    self.lblDesc=nil;
    self.lblFromAcc=nil;
    self.lblBillerAcc=nil;
    self.lblTransferDate=nil;
    self.lblTransferType=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)logout:(id)sender{
    NSLog(@"IN LOGOUT");
    //AuthController *authController = [AuthController sharedObject];
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authController logout];
    
}

-(IBAction)finishTrxn:(id)sender{
    
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
    self.title=@"Success";
    UIImage* imageResult = [UIImage imageNamed:@"bc_result.png"];
    [btnHeading setBackgroundImage:imageResult forState:UIControlStateNormal];
    btn1.hidden=NO;
    btnConfirm.hidden=YES;
    self.trxnResult.text=@"Transaction Successfull";
    self.navigationItem.hidesBackButton=YES;
    
    
    [alertProcessTrxn dismissWithClickedButtonIndex:0 animated:YES];
}


@end
