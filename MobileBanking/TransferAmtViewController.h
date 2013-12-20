//
//  TransferAmtViewController.h
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface TransferAmtViewController : UIViewController
{
     NSMutableDictionary *transfersDict;
    AuthController *authController;
    NSString* fromView;
}

-(IBAction)logout:(id)sender;


-(IBAction) continueTransfer:(id)sender;

- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict;
- (id)initWithNibFromPayments:(NSMutableDictionary *)dict;

@property (weak,nonatomic) IBOutlet UITextField *txtAmt;
@property (weak,nonatomic) IBOutlet UITextField *txtDesc;

@end
