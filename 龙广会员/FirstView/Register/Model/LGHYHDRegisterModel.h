//
//  LGHYHDRegisterModel.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/27.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHYHDRegisterModel : NSObject

/**
 * 会员注册信息
 *
 *  name           姓名
 *  idno           身份证号
 *  mobile         手机号
 *  capt           手机验证码
 *  sms_capt_token 手机验证码验证token
 *  source         会员来源
 */

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *idno;
@property (nonatomic, copy)NSString *mobile;
@property (nonatomic, copy)NSString *capt;
@property (nonatomic, copy)NSString *sms_capt_token;
@property (nonatomic, assign)NSInteger *source;


+ (instancetype)registerWithDic:(NSDictionary *)dict;


@end
