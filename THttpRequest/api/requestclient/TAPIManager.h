//
//  TAPIManager.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestManager.h"

@interface TAPIManager : NSObject

+ (TAPIManager *) getInstance;
- (void) requestNotTokenGetMethod: (NSString *) url
                           Params: (NSDictionary *) params
                           Target: (id) target
                          Success: (SEL) success
                          Failure: (SEL) failure;

- (void) requestNotTokenPostMethod: (NSString *) url
                            Params: (NSDictionary *) params
                            Target: (id) target
                           Success: (SEL) success
                           Failure: (SEL) failure;

- (void) requestGetMethod: (NSString *) url
                   Params: (NSDictionary *) params
                   Target: (id) target
                  Success: (SEL) success
                  Failure: (SEL) failure;

- (void) requestPostMethod: (NSString *) url
                    Params: (NSDictionary *) params
                    Target: (id) target
                   Success: (SEL) success
                   Failure: (SEL) failure;

- (void) requestPutMethod: (NSString *) url
                   Params: (NSDictionary *) params
                   Target: (id) target
                  Success: (SEL) success
                  Failure: (SEL) failure;

- (void) requestDeleteMethod: (NSString *) url
                      Params: (NSDictionary *) params
                      Target: (id) target
                     Success: (SEL) success
                     Failure: (SEL) failure;

- (void) requestFileMethod: (NSString *) url
                 ImageData: (NSData *) imageData
                    Params: (NSDictionary *)params
                    Target: (id) target
                   Success: (SEL) success
                   Failure: (SEL) failure;

@property APIRequestManager *mApiRequestManager;

@end
