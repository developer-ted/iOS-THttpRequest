//
//  APIUtils.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APIUtils : NSObject

+ (NSString *)getAppVersionName;
+ (NSInteger)getAppVersionCode;
+ (NSString *)getDeviceSystemVersion;
+ (NSString *)getCountryCode;
+ (NSString *)getLanguageCode;
+ (NSString *)getTZOffset;
+ (NSString *)getUniqueID;
+ (NSString *)getRandomCode:(NSInteger) size;

+ (NSString *) getAPIRequestUrl:(NSString *)apiType;

+ (BOOL) checkNull: (NSString *) key;
+ (BOOL) isValue:(NSString *) value;

+ (void) commonFailureAPIRequest:(UIView *) view
                        Response:(id) response;

+ (NSString *)convertIDtoJsonString:(id) data;
+ (id)convertJsonStringtoID:(NSString *) jsonString;

@end
