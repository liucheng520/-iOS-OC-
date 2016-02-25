//
//  AFNHttpTool.m
//  武汉二部iOS基础框架
//
//  Created by 苏荷 on 15/9/23.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "AFNHttpTool.h"

@implementation AFNHttpTool

+ (void)POSTWithMethod:(NSString *)method
                Params:(NSDictionary *)param
               success:(void (^)(id json))success
               failure:(void (^)(NSError *error))failure
{
    [[self manger] POST:method parameters:param success:^void(AFHTTPRequestOperation *operation, id json) {

        if (success) {
            success(json);
        }
    } failure:^void(AFHTTPRequestOperation *operation, NSError *error) {

        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POSTWithMethod:(NSString *)method
                Params:(NSDictionary *)param
            heardImage:(UIImage *)heardImage
               success:(void (^)(id json))success
               failure:(void (^)(NSError *))failure
{
    [[self manger] POST:method parameters:param constructingBodyWithBlock:^void(id<AFMultipartFormData> __nonnull formData) {
        
            NSData *imageData = UIImagePNGRepresentation(heardImage);
            //图片data拼接
            [formData appendPartWithFileData:imageData name:@"headImg" fileName:@"headImg.png" mimeType:@"image/png"];
        
    } success:^void(AFHTTPRequestOperation * __nonnull operation, id __nonnull json) {
        if (success) {
            success(json);
        }
    } failure:^void(AFHTTPRequestOperation * __nonnull operation, NSError * __nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POSTWithMethod:(NSString *)method
                Params:(NSDictionary *)param
                  pics:(NSArray *)picArr
               success:(void (^)(id))success
               failure:(void (^)(NSError *))failure
{
    NSString*strurl=[NSString stringWithFormat:@"%@%@",Base_URL,method];
    NSMutableURLRequest *request =[[self sharedClient].requestSerializer multipartFormRequestWithMethod:@"POST" URLString:strurl parameters:param  constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                                   {
                                       //图片
                                       for (int i= 0; i<picArr.count; i++) {
                                           [formData appendPartWithFileData:UIImagePNGRepresentation(picArr[i]) name:@"pics" fileName:[NSString stringWithFormat:@"%d.jpg",i] mimeType:@"image/jpeg"];
                                       }
                                   } error:nil];
    
    __block NSURLSessionDataTask *task = [[self sharedClient] dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error)
                                          {
                                              if (responseObject != nil){
                                                  if (success) {
                                                      success(responseObject);
                                                  }                              }
                                              else {
                                                  if (failure) {
                                                      failure(error);
                                                  }
                                              }
                                          }];
    [task resume];
    
}

+ (void)GETWithMethod:(NSString *)method
               Params:(NSDictionary *)param
              success:(void (^)(id))success
              failure:(void (^)(NSError *))failure
{
    [[self manger]GET:method parameters:param success:^void(AFHTTPRequestOperation * __nonnull operation, id __nonnull json) {
        if (success) {
            success(json);
        }
    } failure:^void(AFHTTPRequestOperation * __nonnull operation, NSError * __nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (AFHTTPRequestOperationManager *)manger
{
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:Base_URL]];
    
    //超时时间
    manger.requestSerializer.timeoutInterval = 10.f;
    
    // 让AFN支持text/html类型
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html" , nil];
    return manger;
}

+ (AFHTTPSessionManager *)sharedClient
{
    AFHTTPSessionManager *manger = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:Base_URL]];
    manger.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html" ,@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    return manger;
}

@end
