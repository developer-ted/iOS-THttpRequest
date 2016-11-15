//
//  APIConfig.h
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

@interface APIConfig : NSObject

// 개발자 작업 상태. (0: 실서버 , 1: 개발서버)
#define API_DEV_MODE        0

#if API_DEV_MODE
#define BASE_API_URL        @""
#define PUSH_TYPE           @"3"
#else
#define BASE_API_URL        @""
#define PUSH_TYPE           @"1"
#endif


// 앱 API 통신 시 사용되는 Header Key
#define HEADER_CLIENT_ID            @"Client-ID"
#define HEADER_CLIENT_SECRENT       @"Client-Secret"
#define HEADER_AUTHORIZATION        @"Authorization"
#define HEADER_APP_VERSION          @"APP-VER"
#define HEADER_TZ_OFFEST            @"TZ-OFFSET"
#define HEADER_COUNTRY              @"COUNTRY"
#define HEADER_ACCEPT_LANGUAGE      @"Accept-Language"
#define HEADER_CONTENT_TYPE         @"Content-Type"
#define HEADER_CACHE_CONTROL        @"Cache-Control"


// 앱 API 통신 시 사용되는 Header Value
#define CLIENT_ID                               @""
#define CLIENT_SECRET                           @""
#define HEADER_CONTENT_TYPE_FILE                @"multipart/form-data"
#define HEADER_CONTENT_TYPE_APPLICATION_JSON    @"application/json; charset=utf-8"
#define CACHE_NO_CACHE                          @"no-cache"
#define BASIC                                   @"Basic "
#define BEARER                                  @"Bearer "

// Request Client Key
#define REQEUST_UNIQUE_ID @"uniqueID"
#define REQUEST_OPERATION_MANAGER @"operationManager"
#define REQUEST_TYPE @"requestType"
#define REQUEST_URL @"url"
#define REQUEST_PARAMS @"parameters"
#define REQUEST_SUCCESS @"successResponse"
#define REQUEST_FAILURE @"failureResponse"

#define REQUEST_TYPE_NOT_TOKEN_GET @"not_token_get"
#define REQUEST_TYPE_NOT_TOKEN_POST @"not_token_post"
#define REQUEST_TYPE_GET @"get"
#define REQUEST_TYPE_PUT @"put"
#define REQUEST_TYPE_POST @"post"
#define REQUEST_TYPE_DELETE @"delete"
#define REQUEST_TYPE_FILE @"file"


@end
