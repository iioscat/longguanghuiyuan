//
//  Industry.h
//  行业状况
//
//  Created by 大欢 on 16/2/26.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Industry : NSObject

@property (nonatomic, copy) NSString * icon;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * state;

+(NSArray *)loadIndustryData;

@end
