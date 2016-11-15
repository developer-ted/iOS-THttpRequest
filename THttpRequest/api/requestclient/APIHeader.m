//
//  APIHeader.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "APIHeader.h"
#import "TokenManager.h"
#import "APIConfig.h"
#import "APIUtils.h"


@implementation APIHeader

/**
 * Basic header
 */
+ (AFHTTPRequestOperationManager *)getBasicHeader{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@%@", BASIC, [TokenManager getBasicToken]] forHTTPHeaderField:HEADER_AUTHORIZATION];
    [manager.requestSerializer setValue:[NSString stringWithFormat: @"%ld", (long)[APIUtils getAppVersionCode]] forHTTPHeaderField:HEADER_APP_VERSION];
    [manager.requestSerializer setValue:[APIUtils getTZOffset] forHTTPHeaderField:HEADER_TZ_OFFEST];
    [manager.requestSerializer setValue:[APIUtils getCountryCode] forHTTPHeaderField:HEADER_COUNTRY];
    [manager.requestSerializer setValue:HEADER_CONTENT_TYPE_APPLICATION_JSON forHTTPHeaderField:HEADER_CONTENT_TYPE];
    [manager.requestSerializer setValue:CACHE_NO_CACHE forHTTPHeaderField:HEADER_CACHE_CONTROL];
    
    return manager;
}

/**
 * Common Header
 */
+ (AFHTTPRequestOperationManager *) getHeader{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *token;
    NSString *accessToken = [TokenManager getAccessToken];
    if ([APIUtils checkNull:accessToken]) {
        token = [NSString stringWithFormat:@"%@%@", BASIC, [TokenManager getBasicToken]];
    } else {
        token = [NSString stringWithFormat:@"%@%@", BEARER, accessToken];
    }
    
    
    NSLog(@"Token : %@", token);
    [manager.requestSerializer setValue:token forHTTPHeaderField:HEADER_AUTHORIZATION];
    [manager.requestSerializer setValue:[NSString stringWithFormat: @"%ld", (long)[APIUtils getAppVersionCode]] forHTTPHeaderField:HEADER_APP_VERSION];
    [manager.requestSerializer setValue:[APIUtils getTZOffset] forHTTPHeaderField:HEADER_TZ_OFFEST];
    [manager.requestSerializer setValue:[APIUtils getCountryCode] forHTTPHeaderField:HEADER_COUNTRY];
    [manager.requestSerializer setValue:HEADER_CONTENT_TYPE_APPLICATION_JSON forHTTPHeaderField:HEADER_CONTENT_TYPE];
    [manager.requestSerializer setValue:CACHE_NO_CACHE forHTTPHeaderField:HEADER_CACHE_CONTROL];
    
    return manager;
}

/**
 * File upload header
 */
+ (AFHTTPRequestOperationManager *)getFileUploadHeader{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *accessToken = [TokenManager getAccessToken];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@%@", BEARER, accessToken] forHTTPHeaderField:HEADER_AUTHORIZATION];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat: @"%ld", (long)[APIUtils getAppVersionCode]] forHTTPHeaderField:HEADER_APP_VERSION];
    [manager.requestSerializer setValue:[APIUtils getTZOffset] forHTTPHeaderField:HEADER_TZ_OFFEST];
    [manager.requestSerializer setValue:[APIUtils getCountryCode] forHTTPHeaderField:HEADER_COUNTRY];
    [manager.requestSerializer setValue:HEADER_CONTENT_TYPE_FILE forHTTPHeaderField:HEADER_CONTENT_TYPE];
    [manager.requestSerializer setValue:CACHE_NO_CACHE forHTTPHeaderField:HEADER_CACHE_CONTROL];
    
    return manager;
}


@end
