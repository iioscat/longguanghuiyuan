//
//  LGHYHDFirstViewModel.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDFirstViewModel.h"

@implementation LGHYHDFirstViewModel

+ (NSDictionary *)loadFirstViewData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FirstViewList" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    return dict;
}

@end
