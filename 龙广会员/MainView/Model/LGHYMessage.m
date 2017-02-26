//
//  LGHYMessage.m
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYMessage.h"

@implementation LGHYMessage

+ (NSArray *)loadMessageData {
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    NSArray * dataList = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray * messageList = [NSMutableArray array];
    
    for (NSDictionary * dict in dataList) {
        
        LGHYMessage * message = [[LGHYMessage alloc] init];
        
        [message setValuesForKeysWithDictionary:dict];
        
        [messageList addObject:message];
    }
    
    return messageList;
}


@end
