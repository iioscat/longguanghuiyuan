//
//  LGHYHDMyScore_Model.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 结果
 *
 *  code  操作代码
 *  total 总数
 *  data  礼物列表
 */

@interface LGHYHDMyScore_Model : NSObject

@property (nonatomic, assign)NSInteger code;
@property (nonatomic, assign)NSInteger total;
@property (nonatomic, strong)NSMutableArray *data;

@end
