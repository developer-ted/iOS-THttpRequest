//
//  APIEncording.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIEncording : NSObject

+(NSString *)getBase64Encode:(NSString *)content;
+(NSString *)getBase64Decode:(NSString *)content;
+(NSString *)getBase62Encoding:(NSUInteger)content;
+(NSString *)getMD5encode:(NSString *)content;

@end
