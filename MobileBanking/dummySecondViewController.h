//
//  dummySecondViewController.h
//  MobileBanking
//
//  Created by mishanet on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dummySecondViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDataSource,UITableViewDelegate>
{
 NSMutableArray *array;
}


@property (strong, nonatomic) NSArray *list;


@property (weak, nonatomic) IBOutlet UITextField *txtField;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar1;

- (IBAction)fromAccTouched:(id)sender;
- (IBAction)calltest:(id)sender;
- (IBAction)logout:(id)sender;


@end
