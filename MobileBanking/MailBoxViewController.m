//
//  MailBoxViewController.m
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MailBoxViewController.h"
#import "MailBoxDetailsViewController.h"
#import "AuthController.h"
#import "LogoutViewController.h"
#import "ComposeMailViewController.h"

@interface MailBoxViewController ()

@end

@implementation MailBoxViewController

@synthesize list,listDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Messages";
        self.tabBarItem.image = [UIImage imageNamed:@"message_30"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.list = [[NSArray alloc]initWithObjects:@"In Box",@"Sent Mail", nil];
   
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.leftBarButtonItem = logoutBtn;
    
    UIImage *imageCompose =[UIImage imageNamed:@"email_compose.png"];
    CGRect frame = CGRectMake(0, 0, imageCompose.size.width, imageCompose.size.height);
    UIButton *imageBtn = [[UIButton alloc] initWithFrame:frame];
    [imageBtn setBackgroundImage:imageCompose forState:UIControlStateNormal];
    [imageBtn setShowsTouchWhenHighlighted:YES];
    [imageBtn addTarget:self action:@selector(composeMail) forControlEvents:UIControlStateNormal];
    
                                 
    UIBarButtonItem *btnCompose = [[UIBarButtonItem alloc] initWithCustomView:imageBtn];
    
    //[btnCompose setBackgroundImage:imageCompose forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = btnCompose;
    
    UIBarButtonItem *homeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(home:)];
    self.navigationItem.leftBarButtonItem=homeBtn;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.listDetail=nil;
    self.list=nil;

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
   
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return (UITableViewCell*)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"SELECTED");    
    MailBoxDetailsViewController *detailsView = [[MailBoxDetailsViewController alloc]initWithNibName:@"MailBoxDetailsViewController" bundle:Nil];
    
       [self.navigationController pushViewController:detailsView animated:YES];
    
    
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Mail Box";
}

-(void)logout:(id)sender{
    AuthController *authController = [AuthController sharedObject];
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authController logout];
}
                                 

-(void)home:(id)sender{
    self.tabBarController.selectedIndex=0;
}

-(void)composeMail{
    
    NSLog(@"compose email");
    ComposeMailViewController *detailsView = [[ComposeMailViewController alloc]initWithNibName:@"ComposeMailViewController" bundle:nil];
    
    [self.navigationController pushViewController:detailsView animated:YES];

}





@end
