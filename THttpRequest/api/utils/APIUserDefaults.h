//
//  APIUserDefaults.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIUserDefaults : NSObject

+ (void) setString: (NSString *) value Key: (NSString *) key;
+ (NSString *) getString: (NSString *) key;

@end
