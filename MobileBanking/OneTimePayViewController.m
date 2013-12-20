//
//  OneTimePayViewController.m
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OneTimePayViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "FromAccSelViewController.h"
#import "ToAccSelViewController.h"
#import "OneTimePayConfirmViewController.h"

@interface OneTimePayViewController ()

@end

@implementation OneTimePayViewController

@synthesize lbl1,fromAccLbl;
@synthesize lbl2, billerLbl;
@synthesize lbl3;
@synthesize lbl4;
@synthesize lbl5;
@synthesize scrollView;
@synthesize txtField1,txtField2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Payments";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    self.scrollView.contentSize=CGSizeMake(320, 1024);   
    
    authController = [AuthController sharedObject];
    [authController resetTimer];
    
       [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    lbl1.layer.cornerRadius=8;
    lbl2.layer.cornerRadius=8;
    lbl3.layer.cornerRadius=8;
    lbl4.layer.cornerRadius=8;
    lbl5.layer.cornerRadius=8;
    
    UIBarButtonItem *submitBtn = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleBordered target:self action:@selector(submitPay:)];
    self.navigationItem.rightBarButtonItem = submitBtn;
    
    
}

- (void)viewDidUnload
{ 
    self.lbl1=nil;
    self.fromAccLbl=nil;
    self.billerLbl=nil;

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma textfeild delegate methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];   
    
    return YES;
}

-(BOOL)disablesAutomaticKeyboardDismissal{
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"in txt editing");
    /*CGRect rc = [textField bounds];
    NSLog(@"rc height %@",rc.size.height);
    rc.origin.x=0;
    rc.origin.y-=200;
    rc.size.height=800;
    [self.scrollView scrollRectToVisible:rc animated:YES];*/
    [self animateTextField:textField up:YES];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self animateTextField:textField up:NO];
    return YES;

}

-(void)animateTextField:(UITextField*) textField up:(BOOL)up{
    const int movementDist = 80;
    const float movementDuration = 0.3f;
    int movement = (up?-movementDist:movementDist);
    [UIView beginAnimations:@"anum" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    self.view.frame=CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

#pragma scroll view delegate methods
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"in did scroll");
   
}


#pragma tapgesture
-(IBAction)handleGesture:(UIGestureRecognizer*)sender{
    NSLog(@"in handle gesture");
    [txtField1 resignFirstResponder];
    
    [txtField2 resignFirstResponder];

 
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer 
       shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"tocuh view %@",touch.view);
    if (touch.view == self.fromAccLbl) {
        NSLog(@"From Account clicked");
        [self fromAccSel:self.fromAccLbl];
        return NO;
    }
     if (touch.view == self.billerLbl) {
        NSLog(@"Biller Account clicked");
        [self billerAccSel:self.billerLbl];
        return NO;
    }
    else{
        NSLog(@"in else,,,");
    }
    return YES;
}

-(IBAction)fromAccSel:(id)sender{
    NSLog(@"Touch up inside");
    FromAccSelViewController *fromAccViewController = [[FromAccSelViewController alloc]initWithNibFromPayment:@"Payments"];
    fromAccViewController.delegate=self;
    [self.navigationController pushViewController:fromAccViewController animated:YES];    
}

-(IBAction)billerAccSel:(id)sender{
    NSLog(@"Touch up inside biller");
    ToAccSelViewController *toAccViewController = [[ToAccSelViewController alloc]initWithNibFromPayment:@"Payments"];
    [self.navigationController pushViewController:toAccViewController animated:YES];    
}

-(void)submitPay:(id)sender{
    NSMutableDictionary *payDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:self.fromAccLbl.text, @"fromacc", self.billerLbl.text,@"toacc", self.txtField1.text, @"amount", self.txtField2.text, @"desc",  nil];
    OneTimePayConfirmViewController *payConfirmView = [[OneTimePayConfirmViewController alloc]initWithNibFromPayment:payDic];
    [self.navigationController pushViewController:payConfirmView animated:YES];
}

-(void)logout:(id)sender{
    
}

#pragma ViewControllerPaymentDelegate
-(void)didFinishSelectingFromAcc:(NSString *)item{
    NSLog(@"in from acc sele delegate %@",item);
    self.fromAccLbl.text=item;
}

#pragma PaymentToAccDelegate
-(void)didFinishSelectingToAcc:(NSString *)item{
    NSLog(@"in to acc sele delegate %@",item);
    self.billerLbl.text=item;
}
@end
