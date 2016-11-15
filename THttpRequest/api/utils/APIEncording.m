//
//  APIEncording.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "APIEncording.h"
#import <CommonCrypto/CommonDigest.h>

@implementation APIEncording

/**
 * Base64 encoding
 */
+(NSString *)getBase64Encode:(NSString *)content {
    NSData *nsdata = [content dataUsingEncoding:NSUTF8StringEncoding];
    return [nsdata base64EncodedStringWithOptions:0];
}

/**
 * Base64 decoding
 */
+(NSString *)getBase64Decode:(NSString *)content {
    NSData *dataDecoding = [[NSData alloc] initWithBase64EncodedString:content options:0];
    return [[NSString alloc] initWithData:dataDecoding encoding:NSUTF8StringEncoding];
}

/**
 * Base62 encoding
 */
+(NSString *)getBase62Encoding:(NSUInteger)content {
    static const char *alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSUInteger base = 62;
    
    char result[20]; // sufficient room to encode 2^64 in Base-62
    char *p = result + sizeof(result);
    
    *--p = 0; // NULL termination
    while (content > 0) {
        *--p = alphabet[content % base];
        content /= base;
    }
    return [NSString stringWithUTF8String:p];
}

/**
 * MD5 encoding
 */
+(NSString *)getMD5encode:(NSString *)content {
    const char *cStr = [content UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


@end
