//
//  MessageViewController.h
//  MobileBanking
//
//  Created by mishanet on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthController.h"
@interface MessageViewController : UIViewController{
    AuthController *authController;
    NSMutableDictionary *msgDict;
}

@property (nonatomic,weak) IBOutlet UILabel *subject;

@property (nonatomic,weak) IBOutlet UILabel *message;

- (id)initWithMsgData:(NSMutableDictionary *)dict;

@end
