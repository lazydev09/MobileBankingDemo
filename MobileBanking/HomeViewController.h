//
//  HomeViewController.h
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface HomeViewController : UIViewController<AuthControllerDelegate>{
    AuthController *authDelegate;
}


@property (nonatomic,retain) IBOutlet UILabel *lblLastLogin;

- (IBAction)gotoAccounts:(id)sender;

- (IBAction)gotoTransfers:(id)sender;

- (IBAction)gotoPayments:(id)sender;

- (IBAction)gotoCards:(id)sender;

- (IBAction)gotoMessages:(id)sender;

- (IBAction)gotoPromotions:(id)sender;

@end
