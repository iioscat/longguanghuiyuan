//
//  Industry.m
//  行业状况
//
//  Created by 大欢 on 16/2/26.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "Industry.h"

@implementation Industry

+(NSArray *)loadIndustryData {
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"industry" ofType:@"plist"];
    
    NSArray * dataList = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray * industryList = [NSMutableArray array];
    
    for (NSDictionary * dict in dataList) {
        
        Industry * industry = [[Industry alloc] init];
        
        [industry setValuesForKeysWithDictionary:dict];
        
        [industryList addObject:industry];
    }
    
    return industryList;
}

@end
