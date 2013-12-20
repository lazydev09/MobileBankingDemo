//
//  AccountDetailsSubView.m
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccountDetailsSubView.h"
#import "AuthController.h"
#import "LogoutViewController.h"

@interface AccountDetailsSubView ()

@end

@implementation AccountDetailsSubView

@synthesize sortedKeys;
@synthesize rowNo;
@synthesize tableContents;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Account Details";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"***IN VIEW DID LOAD");
    // Do any additional setup after loading the view from its nib.
    self.sortedKeys = [[NSArray alloc]initWithObjects: @"2012-01-01 Payment at Amazon 12 USD",@"2012-01-03 Payment at amazon", @"2012-01-04 15 USD", nil];
    
    NSArray *tmpArray1 = [[NSArray alloc] initWithObjects:@"23 BND; Payment at Amazon",@"10 USD;Intrest Credit",@"876 BND;Transfer to 07-02-100-345623",nil];
    NSArray *tmpArray2 = [[NSArray alloc] initWithObjects:@"13 BND; payment at Atm",@"125.78 BND;Transfer From 02-02-100-245189",@"876 USD;transfer to 10-01-700-12745",nil];
    NSArray *tmpArray3 = [[NSArray alloc] initWithObjects:@"203 BND; Payment at Atm",@"10 BND;Transfer From 02-01-345167",@"876 BND;Transfer to 4006-4512-5612-9876",nil];
    NSArray *tmpArray4 = [[NSArray alloc] initWithObjects:@"23 BND; Bmobile Payment",@"700.00 BND;Transfer From 5458-6400-1000-6003",@"876 BND;transfer to 02-02-100-345123",nil];
    
    NSDictionary *tempDic = [[NSDictionary alloc]initWithObjectsAndKeys:tmpArray1,@"2012-01-01",tmpArray2,@"2012-01-01",tmpArray3,@"2012-01-02",tmpArray4,@"2012-01-03", nil];
    self.tableContents=tempDic;
    self.sortedKeys=[[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)]; 
    
    
    
   // UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    UIBarButtonItem *optionsBtn = [[UIBarButtonItem alloc] initWithTitle:@"Options" style:UIBarButtonItemStyleBordered target:self action:@selector(historyOption:)];
    self.navigationItem.rightBarButtonItem = optionsBtn;
    //self.navigationItem.leftBarButtonItem=backBtn;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableContents=nil;
    self.sortedKeys=nil;
    
    NSLog(@"***IN VIEW DID UN ** LOAD");
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *listData = [self.tableContents objectForKey:[self.sortedKeys objectAtIndex:section]];
    return listData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sortedKeys.count;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sortedKeys objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==Nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text=[list objectAtIndex:indexPath.row];
     */
    static NSString *cellIdentifier = @"dummyCell";
     
     dummyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     
     if(cell==Nil){
     NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
     for (id currentObj in topLevelObjects) {
     if([currentObj isKindOfClass:[dummyCell class]]){
     cell=(dummyCell*)currentObj;
     break;
     }
     }
     
     // cell = [[dummyCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
     
     
     }
    NSArray *listData = [self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
    NSString *temp = [listData objectAtIndex:indexPath.row];
    NSArray *dummyArray = [ temp componentsSeparatedByString:@";"];
    cell.lbl1.text=[dummyArray objectAtIndex:0];
    if(indexPath.row % 2==0){
        cell.lbl1.textColor = [UIColor redColor];
    }
    else{
        cell.lbl1.textColor = [UIColor blueColor];
    }
    

    cell.lbl2.text=[dummyArray objectAtIndex:1];
    // cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

-(IBAction)logout:(id)sender{
    NSLog(@"LOGGED OUT");
    UIViewController *viewController1=[[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, nil];
    
}



-(IBAction)historyOption:(id)sender{
    NSLog(@"options called");
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Transaction History" message:@"View Past Transaction By" delegate:self cancelButtonTitle:@"Go Back" otherButtonTitles:nil, nil];
    [message addButtonWithTitle:@"Last 1 Month"];
    [message addButtonWithTitle:@"Last 3 Months"];
    [message show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
if([btnTitle isEqualToString:@"Go Back"]){
    NSLog(@"in goback");
}
else if([btnTitle isEqualToString:@"Last 1 Month"]){
    NSLog(@"in 1 month");
    
}
else if([btnTitle isEqualToString:@"Last 3 Months"]){
    NSLog(@"in 3 months");
    [self reloadInputViews];
    }
else{
    
}
}

@end
