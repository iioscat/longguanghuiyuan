//
//  LGHYHDMangementCellModel.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGHYHDMangementCellModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, assign) CGFloat cellHeight;

+ (NSArray *)loadData;

@end
