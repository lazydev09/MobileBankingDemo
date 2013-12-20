//
//  CardSummaryViewController.h
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface CardSummaryViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>{
    
}

@property (strong, nonatomic) NSArray *list;

-(IBAction)logout:(id)sender;

-(IBAction)home:(id)sender;

@property (nonatomic,retain)  AuthController *authController;

@end
