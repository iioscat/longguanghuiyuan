//
//  LGHYHDPost.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/1.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDPost.h"

@interface LGHYHDPost ()

@end

@implementation LGHYHDPost

- (void)postWithUrl:(NSString *)url andDictionary:(NSDictionary *)dict {
    __block NSDictionary *JSON = [NSDictionary dictionary];
    __block NSDictionary *Json = [NSDictionary dictionary];
    __block NSString *string = [NSString string];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    AFHTTPSessionManager *sesson = [AFHTTPSessionManager manager];
    sesson.requestSerializer = [AFJSONRequestSerializer serializer];
    sesson.responseSerializer = [AFHTTPResponseSerializer serializer];
    [sesson POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", responseObject);
            string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"string = %@", string);
//            JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"请求成功：%@", JSON);
            if([_postDelegate respondsToSelector:@selector(getJsonWithString:)]){
                [_postDelegate getJsonWithString:string];
            }
            
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@", error.description);
    }];
    });
}

@end
