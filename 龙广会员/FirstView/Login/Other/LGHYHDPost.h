//
//  LGHYHDPost.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/1.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol postDelegate <NSObject>

- (void)getJsonWithString:(NSString *)string;

@end

@interface LGHYHDPost : NSObject

@property (nonatomic, assign)id<postDelegate>postDelegate;

- (void)postWithUrl:(NSString *)url andDictionary:(NSDictionary *)dict;

@end
