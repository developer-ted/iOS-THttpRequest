//
//  APIHeader.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "AFNetworking.h"

@interface APIHeader : NSObject

+ (AFHTTPRequestOperationManager *)getBasicHeader;
+ (AFHTTPRequestOperationManager *)getHeader;
+ (AFHTTPRequestOperationManager *)getFileUploadHeader;

@end
