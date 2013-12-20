//
//  LeftViewController.h
//  MobileBanking
//
//  Created by picmondlion on 18/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightViewController.h"

@interface LeftViewController : UITableViewController

@property (strong, nonatomic) NSArray *list;
@property (strong,nonatomic) RightViewController *detailViewController;
@end
