//
//  MailBoxDetailsViewController.m
//  MobileBanking
//
//  Created by picmondlion on 16/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MailBoxDetailsViewController.h"
#import "MessageViewController.h"
#import "AuthController.h"
#import "LogoutViewController.h"

@interface MailBoxDetailsViewController ()

@end

@implementation MailBoxDetailsViewController
@synthesize list,listDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Message Box";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    authController = [AuthController sharedObject];
    [authController resetTimer];
    
    // Do any additional setup after loading the view from its nib.
    self.list = [[NSArray alloc]initWithObjects:@"23 Aug; Unable to do transaction",@"11 Apr;Welcome", nil];
    
    
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
    NSString *str1 = [list objectAtIndex:indexPath.row];
    NSArray *tempArray = [str1 componentsSeparatedByString:@";"];
    
    cell.textLabel.text = [tempArray objectAtIndex:0];
    cell.detailTextLabel.text=[tempArray objectAtIndex:1];
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return (UITableViewCell*)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"SELECTED");
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
       
    MessageViewController *detailsView = [[MessageViewController alloc]initWithNibName:@"MessageViewController" bundle:Nil];
    
    [self.navigationController pushViewController:detailsView animated:YES];
    
    
}

-(void)logout:(id)sender{
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authController logout];
}



@end
