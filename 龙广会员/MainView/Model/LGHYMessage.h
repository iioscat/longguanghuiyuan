//
//  LGHYMessage.h
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHYMessage : NSObject

@property (nonatomic, copy) NSString * time;

@property (nonatomic, copy) NSString * message;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * image;


+ (NSArray *)loadMessageData;


@end
