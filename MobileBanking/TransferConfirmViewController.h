//
//  TransferConfirmViewController.h
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface TransferConfirmViewController : UIViewController{
     NSMutableDictionary *transfersDict;
    AuthController *authController;
    UIAlertView *alertProcessTrxn;
}

@property (weak,nonatomic) IBOutlet UILabel *trxnResult;
@property (weak,nonatomic) IBOutlet UILabel *trxnRefNo;
@property (weak,nonatomic) IBOutlet UIButton *btn1;
@property (weak,nonatomic) IBOutlet UIButton *btnHeading;
@property (weak,nonatomic) IBOutlet UIButton *btnConfirm;

@property (nonatomic,retain) IBOutlet UILabel *lblFromAcc,*lblToAcc,*lblAmt,*lblDesc,*lblTransferType,*lblTransferDate;



-(IBAction)logout:(id)sender;

-(IBAction)finishTrxn:(id)sender;

- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict;

@end
