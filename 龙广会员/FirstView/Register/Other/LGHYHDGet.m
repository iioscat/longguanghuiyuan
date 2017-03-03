//
//  LGHYHDGet.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/2.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDGet.h"

@implementation LGHYHDGet

- (void)getWithUrl:(NSString *)url {
    __block NSString *string = [NSString string];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AFHTTPSessionManager *sesson = [AFHTTPSessionManager manager];
        sesson.requestSerializer = [AFJSONRequestSerializer serializer];
        sesson.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [sesson GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            dispatch_async(dispatch_get_main_queue(), ^{
                string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                if([_getDelegate respondsToSelector:@selector(getJsonWithString:)]){
                    [_getDelegate getJsonWithString:string];
                }
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    });
}

@end
