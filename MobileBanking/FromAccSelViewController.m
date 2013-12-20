//
//  FromAccSelViewController.m
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FromAccSelViewController.h"
#import "TransferAmtViewController.h"
#import "AuthController.h"
#import "LogoutViewController.h"

@interface FromAccSelViewController ()

@end

@implementation FromAccSelViewController

@synthesize selRowNo;

@synthesize list;

@synthesize delegate=_delegate;

@synthesize authController;

- (id)initWithNibFromPayment:(NSString *)fromViewName{
    
    self = [super initWithNibName:@"FromAccSelViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"From";
        fromView=[fromViewName copy];
        fromView=@"Payments";
    }
    return self;
}

- (id)initWithNibFromPaymentBreadcrumStyle:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"FromAccSelViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"From";
        transfersDic = [[NSMutableDictionary alloc]initWithDictionary:dict];
        fromView=@"PaymentBreadcrumStyle";
        NSLog(@"breadcrum constructor : from acc");
    }
    return self;
}

- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict{
    
    self = [super initWithNibName:@"FromAccSelViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"From";
        transfersDic = [[NSMutableDictionary alloc]initWithDictionary:dict];
        
        NSLog(@"123 %@",[dict objectForKey:@"toacc"]);
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.title=@"FROM";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     self.authController = [AuthController sharedObject];
    
        NSArray *lstFromAccs = (NSArray*)[authController ObjectForKey:@"FromAccounts"];
    self.list=lstFromAccs;
    
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
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

-(IBAction)logout:(id)sender{
    NSLog(@"IN LOGOUT");
    //AuthController *authController = [AuthController sharedObject];
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [self.authController logout];
}

#pragma table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *temp = (NSArray*)[list objectAtIndex:0];
    return temp.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==Nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
   
    NSArray *temp = (NSArray*)[list objectAtIndex:0];
    cell.textLabel.text = [temp objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text=[(NSArray*)[list objectAtIndex:1] objectAtIndex:indexPath.row];
     //cell.accessoryType=UITableViewCellAccessoryCheckmark;
    return (UITableViewCell*)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"SELECTED %@",self.title);    
    NSArray *temp = (NSArray*)[list objectAtIndex:0];
    NSString *selAcc = [temp objectAtIndex:indexPath.row];
    NSLog(@"in from acc selection......... %@",fromView);
    
    if([fromView isEqualToString:@"Payments"]){
        
        [self.delegate didFinishSelectingFromAcc:selAcc];
        [self.navigationController popViewControllerAnimated:YES];
        [transfersDic setObject:@"Payment" forKey:@"activity"];        
    }
    else if([fromView isEqualToString:@"PaymentBreadcrumStyle"]){
        [transfersDic setObject:selAcc forKey:@"fromacc"];
        [transfersDic setObject:@"BPBCStyle" forKey:@"activity"];
        TransferAmtViewController *detailsView = [[TransferAmtViewController alloc]initWithNibFromPayments:transfersDic];
            [self.navigationController pushViewController:detailsView animated:YES];
        NSLog(@"in breadcrum");
    }
    else{
        NSLog(@"in else 111");
        [transfersDic setObject:selAcc forKey:@"fromacc"];
        [transfersDic setObject:@"Transfers" forKey:@"activity"];
        TransferAmtViewController *detailsView = [[TransferAmtViewController alloc]initWithNibFromTransfers:transfersDic];    
        
    [self.navigationController pushViewController:detailsView animated:YES];
    }
}


@end
