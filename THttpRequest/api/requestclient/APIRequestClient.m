//
//  APIRequestClient.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "APIRequestClient.h"
#import "APIHeader.h"
#import "APIConfig.h"

@implementation APIRequestClient

- (void) requestData: (NSDictionary *) data {
    // Not token get method
    if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_NOT_TOKEN_GET]) {
        [self requestNotTokenGetMethod:data];
    }
    // Not token post method
    else if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_NOT_TOKEN_POST]) {
        [self requestNotTokenPostMethod:data];
    }
    // Get method
    else if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_GET]) {
        [self requestGetMethod:data];
    }
    // Post method
    else if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_POST]) {
        [self requestPostMethod:data];
    }
    // Put method
    else if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_PUT]) {
        [self requestPutMethod:data];
    }
    // Delete method
    else if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_DELETE]) {
        [self requestDeleteMethod:data];
    }
    // File method
    else if ([[data objectForKey:REQUEST_TYPE] isEqual:REQUEST_TYPE_FILE]) {
        [self requestFileMethod:data];
    }
}

/**
 * Not token method request
 */
- (void) requestNotTokenGetMethod: (NSDictionary *) data {
    NSLog(@"NotToken Get method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] GET:[data objectForKey:REQUEST_URL]
                                            parameters:[data objectForKey:REQUEST_PARAMS]
                                               success:[data objectForKey:REQUEST_SUCCESS]
                                               failure:[data objectForKey:REQUEST_FAILURE]];
}

/**
 * Not token method request
 */
- (void) requestNotTokenPostMethod: (NSDictionary *) data {
    NSLog(@"NotToken Post method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] POST:[data objectForKey:REQUEST_URL]
                                             parameters:[data objectForKey:REQUEST_PARAMS]
                                                success:[data objectForKey:REQUEST_SUCCESS]
                                                failure:[data objectForKey:REQUEST_FAILURE]];
}

/**
 * GET method request
 */
- (void) requestGetMethod: (NSDictionary *) data {
    NSLog(@"GET method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] GET:[data objectForKey:REQUEST_URL]
                                            parameters:[data objectForKey:REQUEST_PARAMS]
                                               success:[data objectForKey:REQUEST_SUCCESS]
                                               failure:[data objectForKey:REQUEST_FAILURE]];
}

/**
 * POST method request
 */
- (void) requestPostMethod: (NSDictionary *) data {
    NSLog(@"POST method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] POST:[data objectForKey:REQUEST_URL]
                                             parameters:[data objectForKey:REQUEST_PARAMS]
                                                success:[data objectForKey:REQUEST_SUCCESS]
                                                failure:[data objectForKey:REQUEST_FAILURE]];
}

/**
 * PUT method request
 */
- (void) requestPutMethod: (NSDictionary *) data {
    NSLog(@"PUT method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] PUT:[data objectForKey:REQUEST_URL]
                                            parameters:[data objectForKey:REQUEST_PARAMS]
                                               success:[data objectForKey:REQUEST_SUCCESS]
                                               failure:[data objectForKey:REQUEST_FAILURE]];
}

/**
 * DELETE method request
 */
- (void) requestDeleteMethod: (NSDictionary *) data {
    NSLog(@"DELETE method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] DELETE:[data objectForKey:REQUEST_URL]
                                               parameters:[data objectForKey:REQUEST_PARAMS]
                                                  success:[data objectForKey:REQUEST_SUCCESS]
                                                  failure:[data objectForKey:REQUEST_FAILURE]];
}

/**
 * File upload method request
 */
- (void) requestFileMethod: (NSDictionary *) data {
    NSLog(@"File upload method request");
    [[data objectForKey:REQUEST_OPERATION_MANAGER] PUT:[data objectForKey:REQUEST_URL]
                                            parameters:[data objectForKey:REQUEST_PARAMS]
                                               success:[data objectForKey:REQUEST_SUCCESS]
                                               failure:[data objectForKey:REQUEST_FAILURE]];
}


@end
