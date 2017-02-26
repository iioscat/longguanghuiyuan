//
//  SXTNewsHeader.h
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXTNewsHeader : NSObject

@property (nonatomic, copy) NSString * image;

@property (nonatomic, copy) NSString * title;

+ (NSArray *)loadNewsHeader;

@end
