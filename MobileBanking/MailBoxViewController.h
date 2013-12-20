//
//  MailBoxViewController.h
//  MobileBanking
//
//  Created by mishanet on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MailBoxViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *list;

@property (strong, nonatomic) NSArray *listDetail;

-(IBAction)logout:(id)sender;

-(void)composeMail;

-(void)home:(id)sender;

@end
