//
//  LGHYHDRuleModel.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/14.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *
 *  redup   红卡升级所需积分
 *  redcut  红卡升级后扣除积分
 *  agup    银卡升级所需积分
 *  agcut   银卡升级后扣除积分
 *  auup   金卡升级所需积分
 *  aucut   金卡升级后扣除积分
 *  agdown  银卡降级积分
 *  audown 金卡降级积分
 *  sign   会员报名积分
 *  register  注册积分
 *  punish  积分惩罚
 *  complete  完善资料积分
 *  share  分享活动积分
 *  project_A  A级活动基础积分
 *  project_B  B级活动基础积分
 *  project_C  C级活动基础积分
 *  project_double  活动签到积分翻倍倍数
 *  program  节目签到积分
 *  program_double  节目签到积分翻倍倍数
 *  A_red_double  A级活动红卡会员翻倍倍数
 *  A_ag_double   A级活动银卡会员翻倍倍数
 *  A_au_double  A级活动金卡会员翻倍倍数
 *  A_diamond_double  A级活动钻石卡会员翻倍倍数
 *  B_red_double     B级活动红卡会员翻倍倍数
 *  B_ag_double    B级活动银卡会员翻倍倍数
 *  B_au_double   B级活动金卡会员翻倍倍数
 *  B_diamond_double  B级活动钻石卡会员翻倍倍数
 *  C_red_double   C级活动红卡会员翻倍倍数
 *  C_ag_double   C级活动银卡会员翻倍倍数
 *  C_au_double    C级活动金卡会员翻倍倍数
 *  C_diamond_double  C级活动钻石卡会员翻倍倍数
 */
//case class Point_rule(redup: Int, redcut: Int, agup: Int, agcut: Int, auup: Int, aucut: Int, agdown: Int, audown: Int, sign: Int, register: Int, punish: Int, complete: Int, share: Int, project_A: Int, project_B: Int, project_C: Int, project_double: Double, program: Int, program_double: Double, A_red_double: Double, A_ag_double: Double, A_au_double: Double, A_diamond_double: Double,B_red_double: Double, B_ag_double: Double, B_au_double: Double, B_diamond_double: Double,C_red_double: Double, C_ag_double: Double, C_au_double: Double, C_diamond_double: Double )

@interface LGHYHDRuleModel : NSObject

@property (nonatomic, assign)NSInteger redup;
@property (nonatomic, assign)NSInteger redcut;
@property (nonatomic, assign)NSInteger agup;
@property (nonatomic, assign)NSInteger agcut;
@property (nonatomic, assign)NSInteger auup;
@property (nonatomic, assign)NSInteger aucut;
@property (nonatomic, assign)NSInteger agdown;
@property (nonatomic, assign)NSInteger audown;
@property (nonatomic, assign)NSInteger sign;
@property (nonatomic, assign)NSInteger registerScore;
@property (nonatomic, assign)NSInteger punish;
@property (nonatomic, assign)NSInteger complete;
@property (nonatomic, assign)NSInteger share;
@property (nonatomic, assign)NSInteger project_A;
@property (nonatomic, assign)NSInteger project_B;
@property (nonatomic, assign)NSInteger project_C;
@property (nonatomic, assign)double project_double;
@property (nonatomic, assign)NSInteger program;
@property (nonatomic, assign)double program_double;
@property (nonatomic, assign)double A_red_double;
@property (nonatomic, assign)double A_ag_double;
@property (nonatomic, assign)double A_au_double;
@property (nonatomic, assign)double A_diamond_double;
@property (nonatomic, assign)double B_red_double;
@property (nonatomic, assign)double B_ag_double;
@property (nonatomic, assign)double B_au_double;
@property (nonatomic, assign)double B_diamond_double;
@property (nonatomic, assign)double C_red_double;
@property (nonatomic, assign)double C_ag_double;
@property (nonatomic, assign)double C_au_double;
@property (nonatomic, assign)double C_diamond_double;

@end
