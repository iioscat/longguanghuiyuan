//
//  LGHYHDRegisterModel.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/27.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRegisterModel.h"

@implementation LGHYHDRegisterModel

+ (instancetype)registerWithDic:(NSDictionary *)dict {
    LGHYHDRegisterModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
