//
//  LGHYHDReponseCode.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/2.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDReponseCode.h"
#import "UIView+MJAlertView.h"

@implementation LGHYHDReponseCode

+ (void)actionWithCode:(NSString *)dataString {
    int code = [[dataString substringWithRange:NSMakeRange(8, 1)] intValue];
    NSString *codeString = [NSString stringWithFormat:@"%i", code];
    NSDictionary *dict = @{
                           @"0":@"登录成功",
                           @"1":@"需要登录",
                           @"2":@"权限不够",
                           @"3":@"没有数据",
                           @"4":@"已经存在同名的数据",
                           @"5":@"登录失败",
                           @"6":@"验证码错误",
                           @"7":@"短信验证码超时失效",
                           @"8":@"新旧密码一致",
                           @"9":@"密码错误",
                           @"10":@"已经注册过",
                           @"11":@"无法删除"
                           };
    NSString *str = dict[codeString];
    [UIView addMJNotifierWithText:str dismissAutomatically:YES];
}

@end
