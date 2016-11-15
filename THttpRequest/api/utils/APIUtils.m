//
//  APIUtils.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "APIUtils.h"
#import "APIConfig.h"
#import "HttpRequestToast.h"

@implementation APIUtils

/**
 * Get app version name
 */
+ (NSString *) getAppVersionName {
    return [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"APP_VERSION_NAME"]];
}

/**
 * Get app build version
 */
+ (NSInteger) getAppVersionCode {
    return [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"APP_VERSION_CODE"] intValue];
}

/**
 * Get device system os version
 */
+ (NSString *) getDeviceSystemVersion {
    return[NSString stringWithFormat: @"%.1f", [[[UIDevice currentDevice] systemVersion] floatValue]];
}

/**
 * Get country code
 */
+ (NSString *) getCountryCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

/**
 * Get language code
 */
+ (NSString *) getLanguageCode {
    return [[NSLocale componentsFromLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]] objectForKey:@"kCFLocaleLanguageCodeKey"];
}

/**
 * Get time zone offset
 */
+ (NSString *) getTZOffset {
    return [NSString stringWithFormat:@"%d", (int)[[NSTimeZone localTimeZone] secondsFromGMT] / 3600 * (-60)];
}

/**
 * Get api request url
 */
+ (NSString *) getAPIRequestUrl:(NSString *)apiType {
    return [NSString stringWithFormat:@"%@%@", BASE_API_URL, apiType];
}

/**
 * Get random code
 */
+ (NSString *) getUniqueID {
    return [self getRandomCode:20];
}

/**
 * Get random code
 */
+ (NSString *)getRandomCode:(NSInteger) size {
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
    NSMutableString *code = [NSMutableString stringWithCapacity:20];
    for (NSUInteger i = 0U; i < size; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [code appendFormat:@"%C", c];
    }
    return code;
}

/**
 * Check null
 * @return true: null, false: not null
 */
+ (BOOL) checkNull:(NSString *)key {
    if(key == nil || [key isEqualToString:@"<null>"] || [key isEqualToString:@"null"] || key == (id)[NSNull null] || [key isEqualToString:@""]) {
        return true;
    }
    
    return false;
}

/**
 * isValue true false
 */
+ (BOOL) isValue:(NSString *)value {
    if ([value isEqual:@"1"]) {
        return YES;
    } else {
        return NO;
    }
}

/**
 * Common api request failure
 */
+ (void) commonFailureAPIRequest:(UIView *) view
                        Response:(id) response {
    NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [view makeToast:[json objectForKey:@"message"]];
}


/**
 * Convert id to json string
 */
+ (NSString *)convertIDtoJsonString:(id) data {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

/**
 * Convert json string to id
 */
+ (id)convertJsonStringtoID:(NSString *) jsonString {
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return json;
}


@end
