//
//  LGHYHDMangementCellModel.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMangementCellModel.h"

@implementation LGHYHDMangementCellModel

+ (NSArray *)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"industry" ofType:@"plist"];
    NSArray *itemsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *itemArray = [NSMutableArray array];
    for (NSDictionary *dict in itemsArray) {
        LGHYHDMangementCellModel *model = [[LGHYHDMangementCellModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [itemArray addObject:model];
    }
    return itemArray;
}

@end
