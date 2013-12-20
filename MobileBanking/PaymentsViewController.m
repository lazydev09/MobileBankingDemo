//
//  PaymentsViewController.m
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaymentsViewController.h"
#import "OneTimePayViewController.h"
#import "LogoutViewController.h"
#import "AuthController.h"
#import "BillerAccSelViewController.h"

@interface PaymentsViewController ()

@end

@implementation PaymentsViewController
@synthesize list;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Payment Menu";
        self.tabBarItem.image = [UIImage imageNamed:@"payment_30"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    authController = [AuthController sharedObject];
    [authController resetTimer];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OutsidePath" ofType:@"plist" ];
    NSDictionary *dummyDictData = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.list = [dummyDictData objectForKey:@"PaymentsMenu"];

    /*NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSLog(@"root path %@",rootPath);
    NSString *path = [rootPath stringByAppendingPathComponent:@"DummyData.plist"];
    NSLog(@"path is %@",path);
    
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DummyData" ofType:@"plist" ];
        NSDictionary *dummyDictData = [[NSDictionary alloc]initWithContentsOfFile:path];
        self.list = [dummyDictData objectForKey:@"PaymentsMenu"];
    NSLog(@"size %i",self.list.count);
    NSArray *allMyKeys = [dummyDictData allKeys];
    NSLog(@"%@",allMyKeys);
    }*/
    
    
    
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
    
    UIBarButtonItem *homeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(home:)];
    self.navigationItem.leftBarButtonItem=homeBtn;
    /* 
    //cgrect
    CGRect screenCast = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenCast.size.width;
    CGFloat screenHeight = screenCast.size.height;
    
    CGRect rectTable1 = CGRectMake(10, 300, 400, 500);
    
    //table1 = [[UITableView alloc]initWithFrame:rectTable1 style:UITableViewStylePlain];
    table1 = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    table1.tag=1;
    table1.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    table1.delegate=self;
    table1.dataSource=self;
    [table1 reloadData];
    [self.view addSubview:table1];
    
    */
    
    
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
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[list objectAtIndex:indexPath.row];
    
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return (UITableViewCell*)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"SELECTED");    
   // UIViewController *oneTimePayController = [[OneTimePayViewController alloc]initWithNibName:@"OneTimePayViewController" bundle:nil];
   // ToAccSelViewController *detailsView = [[ToAccSelViewController alloc]initWithNibFromPayment:@"ToAccSelViewController"];
    BillerAccSelViewController *detailsView = [[BillerAccSelViewController alloc] initWithNibName:@"BillerAccSelViewController" bundle:nil];
    [self.navigationController pushViewController:detailsView animated:YES];
   }

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Bill Payment";
}

-(IBAction)logout{
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    [authController logout];
}
-(void)home:(id)sender{
    self.tabBarController.selectedIndex=0;
}
@end
