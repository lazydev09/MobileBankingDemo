//
//  transferViewController.h
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface transferViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>{
    AuthController *authController;
}

@property (strong, nonatomic) NSArray *list;

@property (strong, nonatomic) NSArray *listDetail;

-(IBAction)logout:(id)sender;

-(IBAction)home:(id)sender;



@end
