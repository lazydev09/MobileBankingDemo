//
//  TransferDateViewController.h
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface TransferDateViewController : UIViewController{
    NSMutableDictionary *transfersDict;
    AuthController *authController;
    NSString* fromView;
}

@property (nonatomic,weak) IBOutlet UISwitch *futureSel;
@property (nonatomic,weak) IBOutlet UILabel *transferDate;

-(IBAction)logout:(id)sender;

-(IBAction) continueTransfer:(id)sender;

- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict;
- (id)initWithNibFromPayments:(NSMutableDictionary *)dict;

@end
