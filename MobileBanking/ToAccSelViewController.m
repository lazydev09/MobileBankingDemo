//
//  ToAccSelViewController.m
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ToAccSelViewController.h"
#import "FromAccSelViewController.h"
#import "AuthController.h"
#import "PaymentsViewController.h"
#import "LogoutViewController.h"

@interface ToAccSelViewController ()

@end

@implementation ToAccSelViewController

@synthesize selRowNo;
@synthesize list;
@synthesize delegate=_delegate;


- (id)initWithNibFromPayment:(NSString *)fromViewName{
    
    self = [super initWithNibName:@"ToAccSelViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.title=@"Select Biller";
        fromView=[fromViewName copy];
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"TO";
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:NO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    authController = [AuthController sharedObject];
    if([fromView isEqualToString: @"Payments"]){
        NSArray *lstBillers = (NSArray*)[authController ObjectForKey:@"Billers"];
        self.list=lstBillers;
    }
    else{
        NSArray *lstBillers = (NSArray*)[authController ObjectForKey:@"ToAccounts"];
        self.list=lstBillers;
    }

    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
   
    
    [authController resetTimer];
}

- (void)viewDidUnload
{
    self.list=nil;
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
    [authController logout];
}

#pragma table view methods

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Select Account to Transfer";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
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
    cell.textLabel.text=[list objectAtIndex:indexPath.row];
    //cell.accessoryType=UITableViewCellAccessoryCheckmark;
    return (UITableViewCell*)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"SELECTED");   
    NSString *selAcc = [list objectAtIndex:indexPath.row];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:selAcc,@"toacc", nil];
    
    if ([fromView isEqualToString:@"Payments"]) {
        [self.delegate didFinishSelectingToAcc:selAcc];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        FromAccSelViewController *detailsView = [[FromAccSelViewController alloc]initWithNibFromTransfers:dict];
        [self.navigationController pushViewController:detailsView animated:YES];
    }
    
    
}


@end
