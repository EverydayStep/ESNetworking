//
//  ESNetworking.h
//  ESNetworking
//
//  Created by codeLocker on 2017/7/24.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

extern NSString * const ES_Network_Success;
extern NSString * const ES_Network_Fail;

@interface ESNetworking : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

+ (ESNetworking *)networking;

- (NSURLSessionDataTask *)postUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail;

- (NSURLSessionDataTask *)getUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail;

- (NSURLSessionDataTask *)putUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail;

- (NSURLSessionDataTask *)deleteUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail;
@end
