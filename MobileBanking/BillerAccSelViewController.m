//
//  BillerAccSelViewController.m
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import "BillerAccSelViewController.h"
#import "LogoutViewController.h"
#import "FromAccSelViewController.h"

@interface BillerAccSelViewController ()

@end

@implementation BillerAccSelViewController
@synthesize list;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Biller";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    authController = [AuthController sharedObject];
    
    NSArray *lstBillers = (NSArray*)[authController ObjectForKey:@"Billers"];
    self.list=lstBillers;
    
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
    return @"Select Biller to Pay";
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
    
   
        FromAccSelViewController *detailsView = [[FromAccSelViewController alloc]initWithNibFromPaymentBreadcrumStyle:dict];
        [self.navigationController pushViewController:detailsView animated:YES];

       
}


@end
