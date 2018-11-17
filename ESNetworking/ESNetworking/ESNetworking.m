//
//  ESNetworking.m
//  ESNetworking
//
//  Created by codeLocker on 2017/7/24.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESNetworking.h"

NSString * const ES_Network_Success = @"es_network_success";
NSString * const ES_Network_Fail = @"es_network_fail";

@interface ESNetworking()
@end

@implementation ESNetworking
+ (ESNetworking *)networking {
    static ESNetworking *networking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networking = [[ESNetworking alloc] init];
    });
    return networking;
}

- (id)init {
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
        [self.sessionManager.requestSerializer setTimeoutInterval:30.f];
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/xml", @"text/html", @"text/plain",nil];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    }
    return self;
}

- (NSURLSessionDataTask *)postUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail {
    params = params ? : @{};
    return [self.sessionManager POST:url parameters:params constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(task, error);
        }
    }];
}

- (NSURLSessionDataTask *)getUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail {
    params = params ? : @{};
    return [self.sessionManager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(task, error);
        }
    }];
}

- (NSURLSessionDataTask *)putUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail {
    params = params ? : @{};
    return [self.sessionManager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(task, error);
        }
    }];
}

- (NSURLSessionDataTask *)deleteUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask * task, id response))success fail:(void(^)(NSURLSessionDataTask * task, NSError *error))fail {
    params = params ? : @{};
    return [self.sessionManager DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(task, error);
        }
    }];
}
@end
