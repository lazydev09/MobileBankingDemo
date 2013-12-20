//
//  BillerAccSelViewController.h
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@interface BillerAccSelViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{

    NSString* fromView;

    NSMutableDictionary *paymentDic;
    AuthController *authController;
    
    
}

@property (strong, nonatomic) NSArray *list;


-(IBAction)logout:(id)sender;

@end
