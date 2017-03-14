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
    __block NSString *string = [NSString string];
    __block NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    AFHTTPSessionManager *sesson = [AFHTTPSessionManager manager];
    sesson.requestSerializer = [AFJSONRequestSerializer serializer];
    sesson.responseSerializer = [AFHTTPResponseSerializer serializer];
    [sesson POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"data = %@", responseObject);
            string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"数据转字典，dataDict = %@", dataDict);
            //NSLog(@"数据转字符串，string = %@", string);
            if([_postDelegate respondsToSelector:@selector(postJsonWithString:)]){
                [_postDelegate postJsonWithString:string];
            }
            if([_postDelegate respondsToSelector:@selector(postJsonWithDataDict:)]){
                [_postDelegate postJsonWithDataDict:dataDict];
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@", error.description);
        if (error.code == NSURLErrorCancelled) return;
        
        if (error.code == NSURLErrorTimedOut) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试！"];
        } else {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        }

    }];
    });
}

@end
