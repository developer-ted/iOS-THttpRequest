//
//  APIRequstManager.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestClient.h"
#import "APIConfig.h"
#import "APIUtils.h"
#import "APIAddress.h"
#import "APIField.h"

@interface APIRequestManager : NSObject {
    NSMutableDictionary *mDicRequest;
    BOOL isRequestRefreshToken;
}

- (void) addRequestCall: (NSString *) uniqueID RequestMethod: (NSString *) requestMethod Url: (NSString *) url Params: (NSDictionary *) params Success: (id) success Failure: (id) faiure;
- (void) removeRequestCall: (NSString *) uniqueCode;
- (void) cancelAllRequest;
- (void) successRequest: (NSString *) uniqueID Target: (id) target Success: (SEL) success ResponseObject: (id) responseObject;
- (void) failureRequest: (NSString *) uniqueID Target: (id) target Failure: (SEL) failure ResponseObject: (NSString *) error;

@property APIRequestClient *mAPIRequestClient;

@end
