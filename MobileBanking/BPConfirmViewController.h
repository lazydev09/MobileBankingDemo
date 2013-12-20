//
//  BPConfirmViewController.h
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface BPConfirmViewController : UIViewController{
    NSMutableDictionary *transfersDict;
    AuthController *authController;
    UIAlertView *alertProcessTrxn;
}

@property (weak,nonatomic) IBOutlet UILabel *trxnResult;
@property (weak,nonatomic) IBOutlet UILabel *trxnRefNo;
@property (weak,nonatomic) IBOutlet UIButton *btn1;
@property (weak,nonatomic) IBOutlet UIButton *btnHeading;
@property (weak,nonatomic) IBOutlet UIButton *btnConfirm;

@property (nonatomic,retain) IBOutlet UILabel *lblFromAcc,*lblBillerAcc,*lblAmt,*lblDesc,*lblTransferType,*lblTransferDate;



-(IBAction)logout:(id)sender;

-(IBAction)finishTrxn:(id)sender;

- (id)initWithNibFromPayments:(NSMutableDictionary *)dict;


@end
