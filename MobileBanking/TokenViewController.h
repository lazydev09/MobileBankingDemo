//
//  TokenViewController.h
//  MobileBanking
//
//  Created by mishanet on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "RightViewController.h"

@interface TokenViewController : UIViewController{
    UISplitViewController *_splitViewController;
    LeftViewController *_leftViewController;
    RightViewController *_rightViewController;

}

@property (nonatomic,retain) IBOutlet UITextField *otp;
@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet LeftViewController *leftViewController;
@property (nonatomic, retain) IBOutlet RightViewController *rightViewController;

-(IBAction)doLogin:(id)sender;
@end
