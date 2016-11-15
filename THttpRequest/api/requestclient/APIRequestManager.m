//
//  APIRequstManager.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "APIRequestManager.h"
#import "AFNetworking.h"
#import "APIErrorType.h"
#import "TokenManager.h"
#import "TAPIManager.h"
#import "APIHeader.h"

@implementation APIRequestManager
@synthesize mAPIRequestClient;

- (id)init {
    self = [super init];
    isRequestRefreshToken = NO;
    mDicRequest = [NSMutableDictionary dictionary];
    mAPIRequestClient = [[APIRequestClient alloc] init];
    return self;
}

/**
 * Add request call
 */
- (void) addRequestCall: (NSString *) uniqueID
          RequestMethod: (NSString *) requestMethod
                    Url: (NSString *) url
                 Params: (NSDictionary *) params
                Success: (id) success
                Failure: (id) faiure {
    AFHTTPRequestOperationManager *manager;
    if ([requestMethod isEqual:REQUEST_TYPE_NOT_TOKEN_GET] || [requestMethod isEqual:REQUEST_TYPE_NOT_TOKEN_POST]) {
        manager = [APIHeader getBasicHeader];
    } else if ([requestMethod isEqual:REQUEST_TYPE_FILE]) {
        manager = [APIHeader getFileUploadHeader];
    } else {
        manager = [APIHeader getHeader];
    }
    
    NSDictionary *data = @{REQEUST_UNIQUE_ID: uniqueID,
                           REQUEST_OPERATION_MANAGER: manager,
                           REQUEST_TYPE:requestMethod,
                           REQUEST_URL:url,
                           REQUEST_PARAMS:params,
                           REQUEST_SUCCESS:success,
                           REQUEST_FAILURE:faiure};
    
    [mDicRequest setObject:data forKey:uniqueID];
    NSLog(@"add Count : %lu", (unsigned long)mDicRequest.count);
    
    [mAPIRequestClient requestData:data];
}

/**
 * Remove request call
 */
- (void) removeRequestCall: (NSString *) uniqueCode {
    [mDicRequest removeObjectForKey:uniqueCode];
    NSLog(@"removeRequestCall Count : %lu", (unsigned long)mDicRequest.count);
}

/**
 * Cancel all request call
 */
- (void) cancelAllRequest {
    isRequestRefreshToken = false;
    if (mDicRequest.count > 0) {
        for (NSString *key in mDicRequest) {
            NSDictionary *dic = [mDicRequest valueForKey:key];
            AFHTTPRequestOperationManager *manager = [dic objectForKey:REQUEST_OPERATION_MANAGER];
            [manager.operationQueue cancelAllOperations];
        }
    }
}

/**
 * Retry request call
 */
- (void) retryRequest {
    isRequestRefreshToken = false;
    if (mDicRequest.count > 0) {
        NSMutableDictionary *newMuTabDic = [NSMutableDictionary dictionary];
        for (NSString *key in mDicRequest) {
            AFHTTPRequestOperationManager *manager;
            NSDictionary *originDic = [mDicRequest valueForKey:key];
            NSString *requestMethod = [originDic valueForKey:REQUEST_TYPE];
            NSString *uniqueID = [originDic valueForKey:REQEUST_UNIQUE_ID];
            
            if ([requestMethod isEqual:REQUEST_TYPE_NOT_TOKEN_GET] || [requestMethod isEqual:REQUEST_TYPE_NOT_TOKEN_POST]) {
                manager = [APIHeader getBasicHeader];
            } else if ([requestMethod isEqual:REQUEST_TYPE_FILE]) {
                manager = [APIHeader getFileUploadHeader];
            } else {
                manager = [APIHeader getHeader];
            }
            
            NSDictionary *newDic = @{REQEUST_UNIQUE_ID: uniqueID,
                                     REQUEST_OPERATION_MANAGER: manager,
                                     REQUEST_TYPE:requestMethod,
                                     REQUEST_URL:[originDic valueForKey:REQUEST_URL],
                                     REQUEST_PARAMS:[originDic valueForKey:REQUEST_PARAMS],
                                     REQUEST_SUCCESS:[originDic valueForKey:REQUEST_SUCCESS],
                                     REQUEST_FAILURE:[originDic valueForKey:REQUEST_FAILURE]};
            [newMuTabDic setObject:newDic forKey:uniqueID];
        }
        [mDicRequest removeAllObjects];
        
        for (NSString *key in newMuTabDic) {
            NSDictionary *changeDic = [newMuTabDic valueForKey:key];
            [mDicRequest setObject:changeDic forKey:[changeDic valueForKey:REQEUST_UNIQUE_ID]];
            [mAPIRequestClient requestData:changeDic];
        }
    }
}

/**
 * Success request
 */
- (void) successRequest: (NSString *) uniqueID
                 Target: (id) target
                Success: (SEL) success
         ResponseObject: (id) responseObject {
    if (!isRequestRefreshToken) {
        [self removeRequestCall:uniqueID];
        [target performSelector:success withObject:responseObject];
    }
}

/**
 * Failure request
 */
- (void) failureRequest: (NSString *) uniqueID
                 Target: (id) target
                Failure: (SEL) failure
         ResponseObject: (NSString *) error {
    // API Request 취소 시 Object null
    if ([APIUtils checkNull:error]) {
        [self removeRequestCall:uniqueID];
    }
    // API Request 실패 시
    else {
        NSData *data = [error dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString *type = [json objectForKey:@"code"];
        
        // 토큰 만료 오류 시
        if ([type isEqual:COMMON_INVALID_TOKEN]
            || [type isEqual:AUTH_EXPIRED_TOKEN]
            || [type isEqual:COMMON_EXPIRED_TOKEN]) {
            isRequestRefreshToken = true;
            
            [self cancelAllRequest];
            NSDictionary *dic = @{@"refresh_token":[TokenManager getRefreshToken], @"sid":[TokenManager getSID]};
            [[TAPIManager getInstance] requestNotTokenPostMethod:[APIUtils getAPIRequestUrl:AUTH_REFRESH]
                                                         Params:dic
                                                         Target:self
                                                        Success:@selector(requestSuccess:)
                                                        Failure:@selector(requestFailure:)];
        }
        // 유효하지 않은 Access_token 일 경우 한번 더 API Call 시도하고 다시한번 Error가 떨어질 경우 Logout 시킴
        else if ([type isEqual:COMMON_NOT_EXISTS_TOKEN]) {
            isRequestRefreshToken = true;
            [TokenManager resetToken];
            [self removeRequestCall:uniqueID];
        }
        // 이 외 오류인 경우
        else {
            [self removeRequestCall:uniqueID];
            [target performSelector:failure withObject:error];
        }
    }
}

- (void) requestSuccess: (id) response {
//    [User setData:[response objectForKey:@"auth"]];
    [TokenManager setToken:response];
    
    [self retryRequest];
}

- (void) requestFailure: (id) response {
    NSLog(@"refrshTokenfailure : %@", response);
}


@end
