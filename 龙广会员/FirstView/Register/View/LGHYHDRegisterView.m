//
//  LGHYHDRegisterView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRegisterView.h"
#import "LGHYHDTextField.h"

@interface LGHYHDRegisterView ()<UITextFieldDelegate, UIActionSheetDelegate>

@property (nonatomic ,copy) ButtonBlock registerButtonBlock;
@property (nonatomic, copy) ButtonBlock showTextButtonBlock;

@end

@implementation LGHYHDRegisterView

#pragma mark - 懒加载
- (LGHYHDTextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [[LGHYHDTextField alloc] init];
        _phoneTextField.delegate = self;
        _phoneTextField.leftImgName = @"userName";
        _phoneTextField.placeholder = @"请输入手机号...";
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _phoneTextField.layer.borderWidth = 2.0;
        _phoneTextField.layer.cornerRadius = 4.0f;
    }
    return _phoneTextField;
}

- (LGHYHDTextField *)numberTextField {
    if (!_numberTextField) {
        _numberTextField = [[LGHYHDTextField alloc] init];
        _numberTextField.delegate = self;
        _numberTextField.leftImgName = @"userName";
        _numberTextField.placeholder = @"请输入验证码...";
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
        _numberTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _numberTextField.layer.borderWidth = 2.0;
        _numberTextField.layer.cornerRadius = 4.0f;
    }
    return _numberTextField;
}

#pragma mark - registerBtn
- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [LGHYHDButton buttonWithImage:@"BtnImage.jpg" title:@"注册" textFont:17];
        [_registerBtn addTarget:self action:@selector(showOkayCancelAlert:) forControlEvents:UIControlEventTouchUpInside];
        _registerBtn.enabled = NO;
        
    }
    return _registerBtn;
}

- (UIButton *)numberBtn {
    if (!_numberBtn) {
        _numberBtn = [LGHYHDButton buttonWithImage:@"BtnImage.jpg" title:@"获取验证码" textFont:17];
        [_numberBtn addTarget:self action:@selector(showText:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _numberBtn;
}

#pragma mark - 布局
- (void)makeFrame {
    [self addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(100);
        make.left.equalTo(self).with.offset(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth - 140);
        make.height.mas_equalTo(44);
    }];
    [self addSubview:self.numberTextField];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_bottom).with.offset(HDMargin);
        make.left.equalTo(self).with.offset(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(44);
    }];
    [self addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberTextField.mas_bottom).with.offset(2 * HDMargin);
        make.left.equalTo(self).with.offset(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(44);
    }];
    [self addSubview:self.numberBtn];
    [self.numberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(100);
        make.left.equalTo(self.phoneTextField.mas_right).with.offset(2 * HDMargin);
        make.right.equalTo(self).with.offset(-20);
        make.height.mas_equalTo(44);
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

#pragma mark - textDidChangeNotification
- (void)textDidChangeNotification:(NSNotification *)notifi {
    
    if ([self.numberTextField.text isEqualToString:@""] || [self.phoneTextField.text isEqualToString:@""]) {
        self.registerBtn.enabled = NO;
    }else{
        self.registerBtn.enabled = YES;
    }
}

#pragma mark - 添加点击事件
- (void)addRegisterButtonAction:(ButtonBlock)block {
    self.registerButtonBlock = block;
}
- (void)showOkayCancelAlert:(UIButton *)button {
    if (self.registerButtonBlock) {
        self.registerButtonBlock(button);
        NSLog(@"%s", __func__);
    }
}
- (void)addShowTextButtonAction:(ButtonBlock)block {
    self.showTextButtonBlock = block;
}
- (void)showText:(UIButton *)button {
    if (self.showTextButtonBlock) {
        self.showTextButtonBlock(button);
    }
}

@end
