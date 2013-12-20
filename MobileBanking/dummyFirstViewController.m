//
//  dummyFirstViewController.m
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "dummyFirstViewController.h"
#import "TokenViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>
#import <Foundation/NSJSONSerialization.h>
#import "KeyChainWrapper.h"
#import "dummyCustomAlertView.h"

@interface dummyFirstViewController ()

@end

@implementation dummyFirstViewController

@synthesize txtLogin;
@synthesize txtPwd;
@synthesize errMsg;
@synthesize authDelegate;
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"LOGIN";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
      /*  CGAffineTransform scaleTrans =
        CGAffineTransformMakeScale(2, 2);
        CGAffineTransform rotateTrans = 
        CGAffineTransformMakeRotation(0);
        self.view.transform = CGAffineTransformConcat(scaleTrans, rotateTrans);*/
        
        //custom alert view
        dummyCustomAlertView *customAlertView = [[dummyCustomAlertView alloc] initWithTitle:@"Custom Alert View"
                                                                          message:@"Customize the look of your app's alert view programmatically."
                                                                         delegate:self
                                                                cancelButtonTitle:@"NO"
                                                                otherButtonTitles:@"YES",nil];
        [customAlertView show];

        
        
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.authDelegate = [AuthController sharedObject];

    
    [self.authDelegate setAuthDelegate:self];
    [self.authDelegate checkAuthetication:@"ABC"];
    [self.authDelegate stopTimer];
    self.errMsg.hidden=YES;
    
    //webview
    NSString *urlAddress = @"file:///Users/picmondlion/one.ad/AdUnit/index.html";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    
}

- (void)viewDidUnload
{
    self.txtLogin=nil;
    self.txtPwd=nil;
    self.errMsg=nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    // change background here
    NSLog(@"rotated......");
    
}
-(IBAction)txtPwdFieldChanged:(id)sender{
    
}




-(IBAction)doAuthenticate:(id)sender{
    NSLog(@"DO AUTH");    
    if([self.txtLogin.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Input" message:@"User Id Cannot be empty" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        [alert show];
    }
       else if([self.txtLogin.text isEqualToString:@""]){
           UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Input" message:@"Password Cannot be empty" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
           [alert show];
    }
    else if([self.txtLogin.text isEqualToString:@"picmond"] && [self.txtPwd.text isEqualToString:@"123456"]){
        //login sucess        
        //self.txtPwd=nil;
        //self.txtLogin=nil;
        [self FetchRemoteData];
        NSString *pwd = [self.txtPwd.text stringByAppendingString:self.txtPwd.text];
        NSString *hased = [self.authDelegate sha1:pwd];
        
        
        UIViewController *viewController1 = nil;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
         viewController1 = [[TokenViewController alloc] initWithNibName:@"TokenViewController" bundle:nil];
        }
        else{
         viewController1 = [[TokenViewController alloc] initWithNibName:@"TokenViewController_ipad" bundle:nil];   
        }
        [self.navigationController pushViewController:viewController1 animated:YES];
        
        //self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, nil];
    }
    else {
        self.errMsg.hidden=NO;
    }
    
}

-(void)FetchRemoteData{
   /* dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSURL *url = [NSURL URLWithString:@"http://localhost:8080/restdemo/resources/Employee/1"];
        NSString *json = [NSString stringWithContentsOfURL:url
                                                  encoding:NSASCIIStringEncoding
                                                     error:&error];
        NSLog(@"\nJSON: %@ \n Error: %@", json, error);
    });*/
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/restdemo/resources/Login/1"];
    NSString *json = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
       
    if(!error) {
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        NSString *token_access = [jsonDict objectForKey:@"empname"];
        NSLog(@"json name %@",token_access);
        //keychain
        BOOL iscreated = [KeychainWrapper createKeychainValue:token_access forIdentifier:@"MobileBanking"];
        NSData *keyChainData = [KeychainWrapper searchKeychainCopyMatchingIdentifier:@"MobileBanking"];
        NSLog(@"keyChainData %@" , keyChainData);
        NSString* newStr = [[NSString alloc] initWithData:keyChainData
                                                  encoding:NSUTF8StringEncoding];
        NSLog(@"newstr %@",newStr);
        
    }
    
   
    
    
}

#pragma textfeild delegate methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
     [textField resignFirstResponder];
    if(textField==self.txtLogin){       
        [self.txtPwd becomeFirstResponder];
    }

return YES;
}

-(BOOL)disablesAutomaticKeyboardDismissal{
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"in change characters");
    
    return YES;
}

#pragma Authdelegate methods

-(void)verifyAuth:(NSString *)result{
    NSLog(@"response from delegate %@",result);
}
-(void)alertSessionTimedOut{
    NSLog(@"in timeout alert" );
  //  UIAlertView *alertTO = [[UIAlertView alloc]initWithTitle:@"Session Timed Out" message:@"Your Session Timed Out" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:@"Logout", nil];
   // [alertTO show];
}



#pragma uialerview delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"THE 'NO' BUTTON WAS PRESSED");
    }
    if (buttonIndex == 1) {
        NSLog(@"THE 'YES' BUTTON WAS PRESSED");
    }
}
@end
