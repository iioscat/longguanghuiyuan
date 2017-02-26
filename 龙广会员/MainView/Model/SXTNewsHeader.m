//
//  SXTNewsHeader.m
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "SXTNewsHeader.h"

@implementation SXTNewsHeader

+ (NSArray *)loadNewsHeader {
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"plist"];
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray * headerList = dict[@"header"];
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (NSDictionary * news in headerList) {
        
        SXTNewsHeader * header = [[SXTNewsHeader alloc] init];
        [header setValuesForKeysWithDictionary:news];
        [array addObject:header];
    }
    
    return array;
}

@end
