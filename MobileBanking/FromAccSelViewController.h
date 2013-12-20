//
//  FromAccSelViewController.h
//  MobileBanking
//
//  Created by mishanet on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"


@protocol ViewControllerPaymentDelegate <NSObject>
- (void)didFinishSelectingFromAcc:(NSString *)item;
@end

@interface FromAccSelViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>{
    NSString* fromView;
    id<ViewControllerPaymentDelegate> delegate;
    NSMutableDictionary *transfersDic;
    
 
}

@property int selRowNo;

@property (strong, nonatomic) NSArray *list;

@property (nonatomic,assign) id<ViewControllerPaymentDelegate> delegate;

@property (nonatomic,retain) AuthController *authController;

-(IBAction)logout:(id)sender;
-(id)initWithNibFromPayment:(NSString *)param;
- (id)initWithNibFromTransfers:(NSMutableDictionary *)dict;
- (id)initWithNibFromPaymentBreadcrumStyle:(NSMutableDictionary *)dict;


@end
