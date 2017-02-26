//
//  WeChat.h
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeChat : NSObject

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * icon;

+ (NSArray *)loadWeiChatData;

@end
