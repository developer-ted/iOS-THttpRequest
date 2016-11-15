//
//  TokenManager.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "TokenManager.h"
#import "APIUserDefaults.h"
#import "APIUserDefaults.h"
#import "APIEncording.h"
#import "APIConfig.h"
#import "APIUtils.h"

#define ACCESS_TOKEN @"access_token"
#define REFRESH_TOKEN @"refresh_token"
#define SID @"sid"

@implementation TokenManager

/**
 * Get basic token
 */
+ (NSString *)getBasicToken {
    NSString *timeStamp = [NSString stringWithFormat: @"%ld", [self currentMillionsecond]];
    NSString *token = [NSString stringWithFormat:@"%@:%@:%@",CLIENT_ID,
                       [APIEncording getMD5encode:[NSString stringWithFormat:@"%@%@", CLIENT_SECRET, timeStamp]], timeStamp];
    return [APIEncording getBase64Encode:token];
}

+ (void)setToken:(id)response {
    NSString *accessToken = [[[response objectForKey:@"auth"] objectForKey:@"token"] objectForKey:@"tk_id"];
    NSString *refreshToken = [[[response objectForKey:@"auth"] objectForKey:@"token"] objectForKey:@"rf_id"];
    
    [APIUserDefaults setString:accessToken Key:ACCESS_TOKEN];
    [APIUserDefaults setString:refreshToken Key:REFRESH_TOKEN];
}

+ (void)resetToken {
    [APIUserDefaults setString:nil Key: ACCESS_TOKEN];
    [APIUserDefaults setString:nil Key: REFRESH_TOKEN];
}

+ (NSString *)getAccessToken {
    return [APIUserDefaults getString:ACCESS_TOKEN];
}

+ (NSString *)getRefreshToken {
    return [APIUserDefaults getString:REFRESH_TOKEN];
}

+ (NSString *)getSID {
    NSString *sid = [APIUserDefaults getString:SID];
    if ([APIUtils checkNull:sid]) {
        sid = [APIUtils getRandomCode:10];
        [APIUserDefaults setString:sid Key:SID];
    }
    return sid;
}

/**
 * Get current unix millionsecond time
 */
+ (long) currentMillionsecond {
    NSTimeInterval time = ([[NSDate date] timeIntervalSince1970]); // returned as a double
    long digits = (long)time; // this is the first 10 digits
    int decimalDigits = (int)(fmod(time, 1) * 1000); // this will get the 3 missing digits
    return (digits * 1000) + decimalDigits;
}


@end
