//
//  LGHYHDFirstViewModel.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHYHDFirstViewModel : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *labelText;
@property (nonatomic, copy) NSString *loginButtonName;
@property (nonatomic, copy) NSString *registerButtonName;
@property (nonatomic, copy) NSString *visitorsButtonName;

+ (NSDictionary *)loadFirstViewData;

@end
