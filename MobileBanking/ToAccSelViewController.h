//
//  ToAccSelViewController.h
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"

@protocol PaymentToAccDelegate <NSObject>
- (void)didFinishSelectingToAcc:(NSString *)item;
@end

@interface ToAccSelViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIActivityIndicatorView *spin;
        NSString* fromView;
    id<PaymentToAccDelegate> delegate;
    NSMutableDictionary *transfersDic;
    AuthController *authController;
    

}

@property int selRowNo;

@property (strong, nonatomic) NSArray *list;

@property (nonatomic,assign) id<PaymentToAccDelegate> delegate;


-(IBAction)logout:(id)sender;

-(id)initWithNibFromPayment:(NSString *)param;

@end
