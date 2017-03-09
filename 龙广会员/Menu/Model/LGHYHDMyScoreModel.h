//
//  LGHYHDMyScoreModel.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGHYHDMyScoreModel : NSObject

/**
 *  积分历史信息
 *  before_point  修改前积分
 *  after_point    修改后积分
 *  create_time   修改时间
 *  uid          系统用户id
 *  reason        修改原因
 *  userName          系统用户名字
   case class Pointhistory(before_point: Int, after_point: Int, create_time: String, uid: Int, reason: String, userName: String)
 */

@property (nonatomic, assign)NSInteger before_point;
@property (nonatomic, assign)NSInteger after_point;
@property (nonatomic, copy)NSString *create_time;
@property (nonatomic, assign)NSInteger uid;
@property (nonatomic, copy)NSString *reason;
@property (nonatomic, copy)NSString *userName;
@property (nonatomic, assign)CGFloat cellHeight;

+ (void)loadData;
+ (NSArray *)loadDataList;

@end
