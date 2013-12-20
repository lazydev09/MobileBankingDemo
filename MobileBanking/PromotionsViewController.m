//
//  PromotionsViewController.m
//  MobileBanking
//
//  Created by picmondlion on 15/9/12.
//
//

#import "PromotionsViewController.h"
#import "LogoutViewController.h"

@interface PromotionsViewController ()

@end

@implementation PromotionsViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Promotions";
        self.tabBarItem.image = [UIImage imageNamed:@"promotions"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = logoutBtn;
  

    // Do any additional setup after loading the view from its nib.
    NSString *urlAddress = @"AdUnit/index.html";
    //NSURL *url = [NSURL URLWithString:urlAddress];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"AdUnit"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.webView=nil;
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
   }

-(void)home:(id)sender{
    self.tabBarController.selectedIndex=0;
}

@end
