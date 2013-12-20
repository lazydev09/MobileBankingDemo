//
//  CardSummaryViewController.m
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import "CardSummaryViewController.h"
#import "LogoutViewController.h"
#import "CardDetailsViewController.h"

@interface CardSummaryViewController ()

@end

@implementation CardSummaryViewController
@synthesize list;
@synthesize authController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title= @"Cards";
        self.tabBarItem.image = [UIImage imageNamed:@"account_30"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.authController = [AuthController sharedObject];
    [self.authController resetTimer];
    
    //self.list = [[NSArray alloc]initWithObjects: @"1111-5632-2312-7654",@"2222-3453-3199-5688", @"3333-5354-9861-3345", nil];
    NSArray *lstFromAccs = (NSArray*)[authController ObjectForKey:@"Cards"];
    self.list=lstFromAccs;
    
    self.navigationController.toolbarItems=[[NSArray alloc]initWithObjects:@"one",@"two",@"three", nil];
    self.navigationController.toolbarHidden=NO;
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = backBtn;
    
    UIBarButtonItem *homeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(home:)];
    self.navigationItem.leftBarButtonItem=homeBtn;
    
    
    NSLog(@"***in CARDS SUMMARY **** LOAD **");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.list=nil;
    self.authController=nil;
    
    NSLog(@"***in CARDS SUMMARY **** UNLOAD **");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    // cell.textLabel.textColor = [UIColor blackColor];
    // cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
    
    cell.detailTextLabel.text=[@"" stringByAppendingString:[(NSArray*)[list objectAtIndex:1] objectAtIndex:indexPath.row]];
    if([cell.textLabel.text hasPrefix:@"5"]){
    cell.imageView.image=[UIImage imageNamed:@"master"];
    }
    else if([cell.textLabel.text hasPrefix:@"4"]){
        cell.imageView.image=[UIImage imageNamed:@"visa"];
    }
    else if ([cell.textLabel.text hasPrefix:@"3"]){
        cell.imageView.image=[UIImage imageNamed:@"amex"];
    }
    //cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return (UITableViewCell*)cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CardDetailsViewController *detailsView = [[CardDetailsViewController alloc] initWithNibName:@"CardDetailsViewController" bundle:nil];
   [self.navigationController pushViewController:detailsView animated:YES];
    
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Click Card No to View Details";
}

-(IBAction)logout:(id)sender{
    NSLog(@"LOGGED OUT");
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [self.authController logout];
}
-(IBAction)home:(id)sender{
    self.tabBarController.selectedIndex=0;
}


@end
