//
//  LGHYHDShowAlert.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/2.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDShowAlert.h"

@implementation LGHYHDShowAlert

#pragma mark - alertView
+ (UIAlertController *)showAlert{
    NSString *title = NSLocalizedString(@"提示", nil);
    NSString *message = NSLocalizedString(@"会员俱乐部采用实名会员管理，请确认信息与身份证信息相同，注册成功后，可凭本人身份证领取实体会员卡", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"我知道了", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    return alertController;
}


@end
