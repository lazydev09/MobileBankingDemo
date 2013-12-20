//
//  AuthController.h
//  MobileBanking
//
//  Created by mishanet on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthControllerDelegate<NSObject>

- (void)verifyAuth:(NSString*) result;
- (void)alertSessionTimedOut;
- (void)logout;


@end

@interface AuthController : NSObject<UIAlertViewDelegate>
{
    id <AuthControllerDelegate> authDelegate;
    NSTimer *sessionTimer;
}

extern NSString* const NOTIF_logout;

@property (nonatomic,assign) id <AuthControllerDelegate> authDelegate;
@property (nonatomic,retain) NSTimer *sessionTimer;

- (void)checkAuthetication:(NSString*) UID;

+ (id)sharedObject;

-(NSDictionary*)getPlistDictionary:(NSString*) plistName;

- (void) stopTimer;
-(void) resetTimer;

- (void)logout;

-(id)ObjectForKey:(NSString*)key;

-(NSString*) sha1:(NSString*)input;

- (NSString *) md5:(NSString *) input;




@end
