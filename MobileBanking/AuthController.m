//
//  AuthController.m
//  MobileBanking
//
//  Created by mishanet on 10/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AuthController.h"
#import <CommonCrypto/CommonDigest.h>

@implementation AuthController

@synthesize authDelegate=_authDelegate;
@synthesize sessionTimer;

#pragma singleton pattern
+(id)sharedObject{
    static AuthController *authController=nil;    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        authController=[[AuthController alloc]init];
            });
    return authController;
}

-(id)init{
    return self;
}

- (void)checkAuthetication:(NSString*) UID{
    NSLog(@"Returning authentication response from delegate");
    [self startTimer];
    [[self authDelegate]verifyAuth:@"SUCCESS"];
}

- (void)logout{
    NSLog(@"Logout called");
    [self stopTimer];
   // [[self authDelegate] alertSessionTimedOut];
    self.authDelegate=nil;
    
        
}

- (void) resetTimer{
    //reset the timer to 1
    [self stopTimer];
    [self startTimer];
}

- (void) startTimer{
    self.sessionTimer=[NSTimer scheduledTimerWithTimeInterval:300 target:self selector:@selector(aferStartTimer) userInfo:nil repeats:NO];
    
}

- (void) stopTimer{
    [[self sessionTimer] invalidate];
    self.sessionTimer=nil;
}
    
-(void) aferStartTimer{
        NSLog(@"Timer called");
    [self stopTimer];
    UIAlertView *alertTO = [[UIAlertView alloc]initWithTitle:@"Session Timed Out" message:@"Your Session Timed Out" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:@"Logout", nil];
    [alertTO show];
    
        
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([btnTitle isEqualToString:@"Continue"]){
        //restart timer
        NSLog(@"in continue");
        [self resetTimer];
    }
    else if([btnTitle isEqualToString:@"Logout"]){
        [self logout];        
    }
    
}

-(NSDictionary*)getPlistDictionary:(NSString *)plistName{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OutsidePath" ofType:@"plist" ];
    NSDictionary *dummyDictData = [[NSDictionary alloc]initWithContentsOfFile:path];
    return dummyDictData;
}

-(id)ObjectForKey:(NSString*)key{
    return [[self getPlistDictionary:@"Default"]objectForKey:key];
}

-(NSString*) sha1:(NSString*)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

+ (NSString *)GetUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string ;
}
@end
