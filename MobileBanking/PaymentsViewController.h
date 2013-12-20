//
//  PaymentsViewController.h
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface PaymentsViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>{
    AuthController *authController;
}

@property (strong, nonatomic) NSArray *list;


-(IBAction)logout;

-(void)home:(id)sender;

@end
