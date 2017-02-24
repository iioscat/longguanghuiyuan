//
//  LGHYHDLoginView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDLoginView.h"
#import "LGHYHDTextField.h"

@interface LGHYHDLoginView ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *btnLabel;
@property (nonatomic, copy) ButtonBlock loginButtonBlock;
@property (nonatomic, copy) ButtonBlock registerButtonBlock;
@property (nonatomic, copy) ButtonBlock forgetPasswordButtonBlock;


@end
@implementation LGHYHDLoginView

#pragma mark - 懒加载
- (LGHYHDTextField *)userNameTextField
{
    if (!_userNameTextField) {
        _userNameTextField = [[LGHYHDTextField alloc] init];
        _userNameTextField.delegate = self;
        _userNameTextField.leftImgName = @"userName";
        _userNameTextField.placeholder = @"会员卡号/身份证号/注册手机号";
        _userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
        _userNameTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _userNameTextField.layer.borderWidth = 2.0;
        _userNameTextField.layer.cornerRadius = 4.0f;
        _userNameTextField.tintColor = [UIColor grayColor];
    }
    return _userNameTextField;
}

- (LGHYHDTextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [[LGHYHDTextField alloc] init];
        _passwordTextField.leftImgName = @"password";
        _passwordTextField.delegate = self;
        // 密码模式
        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.placeholder = @"请输入密码...";
        _passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _passwordTextField.layer.borderWidth = 2.0;
        _passwordTextField.layer.cornerRadius = 2.0;
        _passwordTextField.tintColor = [UIColor grayColor];
        
    }
    return _passwordTextField;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [LGHYHDButton buttonWithImage:@"BtnImage.jpg" title:@"登录" textFont:17];
        [_loginBtn addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

- (UILabel *)btnLabel {
    if (!_btnLabel) {
        _btnLabel = [[UILabel alloc] init];
        //_btnLabel.backgroundColor = [UIColor redColor];
        _btnLabel.text = @"|";
        _btnLabel.textAlignment = NSTextAlignmentCenter;
        _btnLabel.textColor = [UIColor grayColor];
    }
    return _btnLabel;
}

- (UIButton *)registerBtn {
    
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _registerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_registerBtn setTitle:@"我要注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //_btn1.backgroundColor = [UIColor redColor];
    }
    return _registerBtn;
}

- (UIButton *)forgetPasswordBtn {
    if (!_forgetPasswordBtn) {
        _forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _forgetPasswordBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPasswordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_forgetPasswordBtn addTarget:self action:@selector(forgetPasswordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //_btn2.backgroundColor = [UIColor greenColor];
    }
    return _forgetPasswordBtn;
}

#pragma mark - 布局
- (void)makeFrame {
    [self addSubview:self.userNameTextField];
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.left.equalTo(@(HDMargin));
        make.width.equalTo(@(HDTextFieldWidth));
        make.height.equalTo(@44);
    }];
    [self addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTextField.mas_bottom).with.offset(HDMargin);
        make.left.equalTo(@(HDMargin));
        make.width.equalTo(@(HDTextFieldWidth));
        make.height.equalTo(@44);
    }];
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(HDMargin);
        make.right.equalTo(self).with.offset(-20);
        make.top.equalTo(self.passwordTextField.mas_bottom).with.offset(HDMargin);
        make.height.equalTo(@44);
    }];
    [self addSubview:self.btnLabel];
    [self.btnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(HDMargin/2);
        make.centerX.equalTo(self.loginBtn.mas_centerX);
        make.height.equalTo(@20);
        make.width.equalTo(@16);
    }];
    [self addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btnLabel.mas_left);
        make.height.equalTo(@20);
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(HDMargin/2);
        make.width.equalTo(@70);
    }];
    [self addSubview:self.forgetPasswordBtn];
    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btnLabel.mas_right);
        make.height.equalTo(@20);
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(HDMargin/2);
        make.width.equalTo(@70);
    }];
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    [self makeFrame];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - 点击其他位置键盘消失
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    
}

#pragma mark - 按钮点击事件
//loginButtonAction
- (void)addLoginButtonAction:(ButtonBlock)block {
    self.loginButtonBlock = block;
}

- (void)loginButtonAction:(UIButton *)button {
    if (self.loginButtonBlock) {
        self.loginButtonBlock(button);
    }
}
//registerButtonAction
- (void)addRegisterButtonAction:(ButtonBlock)block {
    self.registerButtonBlock = block;
}

- (void)registerButtonAction:(UIButton *)button {
    if (self.registerButtonBlock) {
        self.registerButtonBlock(button);
    }
}
//forgetPasswordButtonAction
- (void)addForgetPasswordButtonAction:(ButtonBlock)block {
    self.forgetPasswordButtonBlock = block;
}

- (void)forgetPasswordButtonAction:(UIButton *)button {
    if (self.forgetPasswordButtonBlock) {
        self.forgetPasswordButtonBlock(button);
    }
}
#pragma mark - textDidChangeNotification
- (void)textDidChangeNotification:(NSNotification *)notifi {
    
    if ([self.passwordTextField.text isEqualToString:@""] || [self.userNameTextField.text isEqualToString:@""]) {
        self.loginBtn.enabled = NO;
    }else{
        self.loginBtn.enabled = YES;
    }
}



@end
