//
//  TAPIManager.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "TAPIManager.h"
#import "AFNetworking.h"
#import "APIUtils.h"
#import "APIConfig.h"
#import "APIHeader.h"

@implementation TAPIManager
@synthesize mApiRequestManager;

+ (TAPIManager *) getInstance {
    static TAPIManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init {
    self = [super init];
    mApiRequestManager = [[APIRequestManager alloc] init];
    
    return self;
}

/**
 * Not token method request
 */
- (void) requestNotTokenGetMethod: (NSString *) url
                           Params: (NSDictionary *) params
                           Target: (id) target
                          Success: (SEL) success
                          Failure: (SEL) failure {
    __weak typeof(self) weakSelf = self;
    NSString *uniqueID = [APIUtils getUniqueID];
    [mApiRequestManager addRequestCall:uniqueID
                         RequestMethod:REQUEST_TYPE_NOT_TOKEN_GET
                                   Url:url
                                Params:params
                               Success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                   [weakSelf.mApiRequestManager successRequest:uniqueID Target:target Success:success ResponseObject:responseObject];
                               }
                               Failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                   NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                   [weakSelf.mApiRequestManager failureRequest:uniqueID Target:target Failure:failure ResponseObject:errorResponse];
                               }];
}

/**
 * Not token method request
 */
- (void) requestNotTokenPostMethod: (NSString *) url
                            Params: (NSDictionary *) params
                            Target: (id) target
                           Success: (SEL) success
                           Failure: (SEL) failure {
    __weak typeof(self) weakSelf = self;
    NSString *uniqueID = [APIUtils getUniqueID];
    [mApiRequestManager addRequestCall:uniqueID
                         RequestMethod:REQUEST_TYPE_NOT_TOKEN_POST
                                   Url:url
                                Params:params
                               Success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                   [weakSelf.mApiRequestManager successRequest:uniqueID Target:target Success:success ResponseObject:responseObject];
                               }
                               Failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                   NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                   [weakSelf.mApiRequestManager failureRequest:uniqueID Target:target Failure:failure ResponseObject:errorResponse];
                               }];
}

/**
 * Get method request
 */
- (void) requestGetMethod: (NSString *) url
                   Params: (NSDictionary *) params
                   Target: (id) target
                  Success: (SEL) success
                  Failure: (SEL) failure {
    __weak typeof(self) weakSelf = self;
    NSString *uniqueID = [APIUtils getUniqueID];
    [mApiRequestManager addRequestCall:uniqueID
                         RequestMethod:REQUEST_TYPE_GET
                                   Url:url
                                Params:params
                               Success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                   [weakSelf.mApiRequestManager successRequest:uniqueID Target:target Success:success ResponseObject:responseObject];
                               }
                               Failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                   NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                   [weakSelf.mApiRequestManager failureRequest:uniqueID Target:target Failure:failure ResponseObject:errorResponse];
                               }];
}

/**
 * Post method request
 */
- (void) requestPostMethod: (NSString *) url
                    Params: (NSDictionary *) params
                    Target: (id) target
                   Success: (SEL) success
                   Failure: (SEL) failure {
    __weak typeof(self) weakSelf = self;
    NSString *uniqueID = [APIUtils getUniqueID];
    [mApiRequestManager addRequestCall:uniqueID
                         RequestMethod:REQUEST_TYPE_POST
                                   Url:url
                                Params:params
                               Success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                   [weakSelf.mApiRequestManager successRequest:uniqueID Target:target Success:success ResponseObject:responseObject];
                               }
                               Failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                   NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                   [weakSelf.mApiRequestManager failureRequest:uniqueID Target:target Failure:failure ResponseObject:errorResponse];
                               }];
}

/**
 * Put method request
 */
- (void) requestPutMethod: (NSString *) url
                   Params: (NSDictionary *) params
                   Target: (id) target
                  Success: (SEL) success
                  Failure: (SEL) failure {
    __weak typeof(self) weakSelf = self;
    NSString *uniqueID = [APIUtils getUniqueID];
    [mApiRequestManager addRequestCall:uniqueID
                         RequestMethod:REQUEST_TYPE_PUT
                                   Url:url
                                Params:params
                               Success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                   [weakSelf.mApiRequestManager successRequest:uniqueID Target:target Success:success ResponseObject:responseObject];
                               }
                               Failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                   NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                   [weakSelf.mApiRequestManager failureRequest:uniqueID Target:target Failure:failure ResponseObject:errorResponse];
                               }];
}

/**
 * Delete method request
 */
- (void) requestDeleteMethod: (NSString *) url
                      Params: (NSDictionary *) params
                      Target: (id) target
                     Success: (SEL) success
                     Failure: (SEL) failure {
    __weak typeof(self) weakSelf = self;
    NSString *uniqueID = [APIUtils getUniqueID];
    [mApiRequestManager addRequestCall:uniqueID
                         RequestMethod:REQUEST_TYPE_DELETE
                                   Url:url
                                Params:params
                               Success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                   [weakSelf.mApiRequestManager successRequest:uniqueID Target:target Success:success ResponseObject:responseObject];
                               }
                               Failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                   NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                   [weakSelf.mApiRequestManager failureRequest:uniqueID Target:target Failure:failure ResponseObject:errorResponse];
                               }];
}

/**
 * File method request
 */
- (void) requestFileMethod: (NSString *) url
                 ImageData: (NSData *) imageData
                    Params: (NSDictionary *)params
                    Target: (id) target
                   Success: (SEL) success
                   Failure: (SEL) failure {
    [[APIHeader getFileUploadHeader] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData
                                    name:@"image"
                                fileName:@"image.jpeg"
                                mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [target performSelector:success withObject:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        [target performSelector:failure withObject:errorResponse];
    }];
}



@end
