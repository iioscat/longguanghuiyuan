//
//  LGHYHDMyScoreModel.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMyScoreModel.h"

@interface LGHYHDMyScoreModel ()

@end

@implementation LGHYHDMyScoreModel

+ (NSArray *)loadDataList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"industry" ofType:@"plist"];
    NSArray *itemsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *dict in itemsArray) {
        LGHYHDMyScoreModel *model = [[LGHYHDMyScoreModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [dataArray addObject:model];
    }
    return dataArray;
}
@end
