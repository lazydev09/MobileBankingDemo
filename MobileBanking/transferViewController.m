//
//  transferViewController.m
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "transferViewController.h"
#import "ToAccSelViewController.h"
#import "AuthController.h"
#import "LogoutViewController.h"

@interface transferViewController ()

@end

@implementation transferViewController

@synthesize list;
@synthesize listDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Transfers Menu";
        self.tabBarItem.image = [UIImage imageNamed:@"transfer_30"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.list = [[NSArray alloc]initWithObjects:@"Own Account",@"Third Party Accounts",@"Other Banks", nil];
    self.listDetail = [[NSArray alloc]initWithObjects:@"To All your personal accounts",@"To All accounts in baiduri bank",@"To Other Banks", nil];
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
    
    UIBarButtonItem *homeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(home:)];
    self.navigationItem.leftBarButtonItem=homeBtn;
    
    authController = [AuthController sharedObject];
    [authController resetTimer];
    
    NSLog(@"***in TRANSFER **** LOAD **");

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.list=nil;
    
    NSLog(@"***in TRANSFER  ****  UNLOAD **");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)logout:(id)sender{
    NSLog(@"IN LOGOUT");
   // AuthController *authController = [AuthController sharedObject];
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authController logout];
}

-(void)home:(id)sender{
    self.tabBarController.selectedIndex=0;
}

#pragma table view methods

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
    cell.detailTextLabel.text=[listDetail objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return (UITableViewCell*)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"SELECTED");    
    ToAccSelViewController *detailsView = [[ToAccSelViewController alloc]initWithNibName:@"ToAccSelViewController" bundle:Nil];
    
    detailsView.selRowNo=indexPath.row;
    
    [self.navigationController pushViewController:detailsView animated:YES];

}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Transfers";
}



@end
