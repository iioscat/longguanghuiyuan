//
//  LGHYHDRealName.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRealName.h"

@implementation LGHYHDRealName

+ (NSArray *)loadRealNameData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RealNameList" ofType:@"plist"];
    NSArray *rowLists = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *itemsArray = [NSMutableArray array];
    
    for (NSArray *rowList in rowLists) {
        NSMutableArray *itemList = [NSMutableArray array];
        for (NSDictionary *dict in rowList) {
            LGHYHDRealName *realname = [[LGHYHDRealName alloc] init];
            [realname setValuesForKeysWithDictionary:dict];
            [itemList addObject:realname];
        }
        [itemsArray addObject:itemList];
    }
    return itemsArray;
}

@end
