//
//  AccountSummaryViewController.h
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dummyCell.h"
#import "AuthController.h"

@interface AccountSummaryViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>{
   
}

@property (strong, nonatomic) NSArray *list;

-(IBAction)logout:(id)sender;

-(IBAction)home:(id)sender;

@property (nonatomic,retain)  AuthController *authController;

@end
