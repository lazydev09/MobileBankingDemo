//
//  WelcomeViewController_ipad.h
//  MobileBanking
//
//  Created by picmondlion on 18/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "RightViewController.h"

@interface WelcomeViewController_ipad : UIViewController
@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet LeftViewController *leftViewController;
@property (nonatomic, retain) IBOutlet RightViewController *rightViewController;

@end
