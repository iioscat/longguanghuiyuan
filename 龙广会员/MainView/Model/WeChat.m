//
//  WeChat.m
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "WeChat.h"

@implementation WeChat

+ (NSArray *)loadWeiChatData  {
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"weixin" ofType:@"plist"];
    NSArray * sectionList = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray * itemsList = [NSMutableArray array];
    
    for (NSArray * rowList in sectionList) {
        
        NSMutableArray * itemList = [NSMutableArray array];
        
        for (NSDictionary * dict in rowList) {
            
            WeChat * w = [[WeChat alloc] init];
            [w setValuesForKeysWithDictionary:dict];
            
            [itemList addObject:w];
        }
        
        [itemsList addObject:itemList];
    }
    
    return itemsList;
}


@end
