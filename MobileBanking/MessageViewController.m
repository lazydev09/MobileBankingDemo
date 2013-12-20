//
//  MessageViewController.m
//  MobileBanking
//
//  Created by mishanet on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController
@synthesize subject,message;

- (id)initWithMsgData:(NSMutableDictionary *)dict
{
    self = [super initWithNibName:@"MessageViewController" bundle:nil];
    if (self) {
        msgDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    authController = [AuthController sharedObject];
    [authController resetTimer];
    
    self.subject = [msgDict objectForKey:@"subject"];
    self.message = [msgDict objectForKey:@"msg"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.subject=nil;
    self.message=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
