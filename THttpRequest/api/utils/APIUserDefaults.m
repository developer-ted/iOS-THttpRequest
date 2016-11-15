//
//  APIUserDefaults.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "APIUserDefaults.h"
#import "APIUtils.h"

@implementation APIUserDefaults

+ (void) setString: (NSString *) value Key: (NSString *) key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:key];
    [defaults synchronize];
}

+ (NSString *) getString: (NSString *) key {
    NSString *defaultsString = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if ([APIUtils checkNull:defaultsString]) {
        defaultsString = @"";
    }
    
    return defaultsString;
}

@end
