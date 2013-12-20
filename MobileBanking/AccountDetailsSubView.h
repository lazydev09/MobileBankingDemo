//
//  AccountDetailsSubView.h
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dummyCell.h"

@interface AccountDetailsSubView : UIViewController
<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) NSArray *sortedKeys;

@property int rowNo;

@property (nonatomic, retain) NSDictionary *tableContents;

-(IBAction)logout:(id)sender;

-(IBAction)historyOption:(id)sender;

@end
