//
//  OneTimePayConfirmViewController.h
//  MobileBanking
//
//  Created by picmondlion on 14/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"


@interface OneTimePayConfirmViewController : UIViewController
{
    NSMutableDictionary *payDic ;
    AuthController *authDelegate;
    UIAlertView *alertProcessTrxn;
}


@property (nonatomic,retain) IBOutlet UILabel *lbl1,*fromAccLbl;

@property (nonatomic,retain) IBOutlet UILabel *lbl2, *billerLbl;

@property (nonatomic,retain) IBOutlet UILabel *lbl3, *amtLbl;

@property (nonatomic,retain) IBOutlet UILabel *lbl4, *descLbl;

@property (nonatomic,retain) IBOutlet UILabel *lbl5;

//confirm
@property (nonatomic,retain) IBOutlet UILabel *lblC1;
@property (nonatomic,retain) IBOutlet UILabel *lblC2;
@property (nonatomic,retain) IBOutlet UILabel *lblC3;
@property (nonatomic,retain) IBOutlet UILabel *lblC4;

- (id)initWithNibFromPayment:(NSMutableDictionary *)tempDic;

-(IBAction)confirmPay:(id)sender;

-(IBAction)logout:(id)sender;

@end
