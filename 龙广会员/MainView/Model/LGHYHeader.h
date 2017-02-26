//
//  LGHYHeader.h
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHYHeader : NSObject
@property (nonatomic, copy)NSString *caidan;
@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *message;
@property (nonatomic, copy)NSString *qiandao;

+ (NSArray *)loadData;

@end
