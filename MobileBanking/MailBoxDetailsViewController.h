//
//  MailBoxDetailsViewController.h
//  MobileBanking
//
//  Created by picmondlion on 16/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"
@interface MailBoxDetailsViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>{
    AuthController *authController;
}

@property (strong, nonatomic) NSArray *list;

@property (strong, nonatomic) NSArray *listDetail;

-(IBAction)logout:(id)sender;

@end
