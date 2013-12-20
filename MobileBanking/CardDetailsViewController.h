//
//  CardDetailsViewController.h
//  MobileBanking
//
//  Created by picmondlion on 12/9/12.
//
//

#import <UIKit/UIKit.h>

@interface CardDetailsViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) NSArray *sortedKeys;

@property int rowNo;

@property (nonatomic, retain) NSDictionary *tableContents;

-(IBAction)logout:(id)sender;

-(IBAction)historyOption:(id)sender;

@end
