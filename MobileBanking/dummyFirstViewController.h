//
//  dummyFirstViewController.h
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AuthController.h"

@interface dummyFirstViewController : UIViewController<AuthControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate>{
    
}

@property (nonatomic,retain) IBOutlet UITextField *txtLogin;

@property (nonatomic,retain) IBOutlet UITextField *txtPwd;

@property (nonatomic, retain) IBOutlet UILabel *errMsg;

@property (nonatomic, retain) AuthController *authDelegate;





-(IBAction)doAuthenticate:(id)sender;
-(IBAction)txtPwdFieldChanged:(id)sender;

@property (nonatomic, retain) IBOutlet UIWebView *webView;


@end
