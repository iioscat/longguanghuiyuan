//
//  LGHYHDRealName.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHYHDRealName : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *data;

+ (NSArray *)loadRealNameData;

@end
