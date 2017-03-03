//
//  LGHYHDGet.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/2.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol getDelegate <NSObject>

- (void)getJsonWithString:(NSString *)string;

@end
@interface LGHYHDGet : NSObject

@property (nonatomic, assign)id<getDelegate>getDelegate;

- (void)getWithUrl:(NSString *)url;

@end
