//
//  OneTimePayViewController.h
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FromAccSelViewController.h"
#import "ToAccSelViewController.h"
#import "AuthController.h"

@interface OneTimePayViewController : UIViewController
<UIScrollViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate,ViewControllerPaymentDelegate,PaymentToAccDelegate>{
    AuthController *authController;
}

@property (nonatomic,retain) IBOutlet UILabel *lbl1,*fromAccLbl;

@property (nonatomic,retain) IBOutlet UILabel *lbl2, *billerLbl;

@property (nonatomic,retain) IBOutlet UILabel *lbl3;

@property (nonatomic,retain) IBOutlet UILabel *lbl4;

@property (nonatomic,retain) IBOutlet UILabel *lbl5;

@property (nonatomic,retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic,retain) IBOutlet UITextField *txtField1;

@property (nonatomic,retain) IBOutlet UITextField *txtField2;

-(IBAction)submitPay:(id)sender;

-(IBAction)logout:(id)sender;

-(IBAction)handleGesture:(UIGestureRecognizer*)sender;

-(IBAction)fromAccSel:(id)sender;

@end
