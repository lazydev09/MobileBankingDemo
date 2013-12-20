//
//  TransferDateViewController.m
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TransferDateViewController.h"
#import "TransferConfirmViewController.h"
#import "AuthController.h"
#import "LogoutViewController.h"
#import "BPConfirmViewController.h"

@interface TransferDateViewController ()

@end

@implementation TransferDateViewController

@synthesize transferDate;
@synthesize futureSel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"WHEN";
    }
    return self;
}

- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"TransferDateViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"WHEN";
        transfersDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
        fromView=@"Transfers";
        NSLog(@"in transfers constructor ");
    }
    return self;
}

- (id)initWithNibFromPayments:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"TransferDateViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"WHEN";
        transfersDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
        fromView=@"Payments";
        NSLog(@"in payment constructor ");
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
    self.futureSel=nil;
    self.transferDate=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) continueTransfer:(id)sender{
    [transfersDict setObject:self.transferDate.text forKey:@"transferDate"];
   NSString *temp = ([self.transferDate.text isEqualToString:@"Today"])?@"Immediate":@"Future Dated";
     [transfersDict setObject:temp forKey:@"transferType"];
    NSLog(@"from view selected ======== %@",fromView);
    if ([fromView isEqualToString:@"Payments"]) {
        BPConfirmViewController *detailsView = [[BPConfirmViewController alloc] initWithNibFromPayments:transfersDict];
        [self.navigationController pushViewController:detailsView animated:YES];
    }
    else{
    TransferConfirmViewController *detailsView = [[TransferConfirmViewController alloc]initWithNibFromTransfers:transfersDict];
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

#pragma date 

- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
    NSDateFormatter *myDateFormat = [[ NSDateFormatter alloc] init]	 ;
    [myDateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
    NSString *selDate = [myDateFormat stringFromDate:sender.date];
    self.transferDate.text=selDate;

}

- (void)removeViews:(id)object {
    [[self.view viewWithTag:9] removeFromSuperview];
    [[self.view viewWithTag:10] removeFromSuperview];
    [[self.view viewWithTag:11] removeFromSuperview];
}

- (void)dismissDatePicker:(id)sender {
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    [UIView beginAnimations:@"MoveOut" context:nil];
    [self.view viewWithTag:9].alpha = 0;
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
}

- (IBAction)callDP:(id)sender {
    if ([self.view viewWithTag:9]) {
        return;
    }
    NSLog(self.futureSel.on?@"ON SELCETED":@"OFF");
    if(!self.futureSel.on){
        NSLog(@"in IFFF");
        self.transferDate.text=@"TODAY";
        return;
    }
    
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds] ;
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor blackColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)] ;
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)] ;
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] ;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)] ;
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
}


@end
