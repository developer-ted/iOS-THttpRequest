//
//  APIErrorType.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIErrorType : NSObject

// Error
#define COMMON_INVALID_TOKEN @"common.invalid_token"
#define COMMON_EXPIRED_TOKEN @"common.expired_token"
#define COMMON_NOT_EXISTS_TOKEN @"common.not_exists_token"

#define AUTH_EXPIRED_TOKEN @"auth.expired_token"

#define NOT_SIGN_UP @"not_sign_up"

#define USER_INVALID_SWIFT_CODE @"user.invalid_swift_code"

@end
