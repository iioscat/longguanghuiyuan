//
//  LGHYHDLoginView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGHYHDTextField;

typedef void(^ButtonBlock)(UIButton *button);
@interface LGHYHDLoginView : UIView

@property (nonatomic, strong) UITextField *userNameTextField, *passwordTextField;
@property (nonatomic, strong) UIButton *loginBtn, *registerBtn, *forgetPasswordBtn;

- (void)addLoginButtonAction:(ButtonBlock)block;
- (void)addRegisterButtonAction:(ButtonBlock)block;
- (void)addForgetPasswordButtonAction:(ButtonBlock)block;


@end
