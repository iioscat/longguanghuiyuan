//
//  LGHYHDIdentifyingCodeViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/24.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDIdentifyingCodeViewController.h"
#import "LGHYHDTextField.h"

@interface LGHYHDIdentifyingCodeViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *reminderLabel, *phoneNumberLabel;
@property (nonatomic, strong) LGHYHDTextField *passwordTextField, *makeSurePasswordField;

@end

@implementation LGHYHDIdentifyingCodeViewController

#pragma mark - 懒加载
- (UILabel *)reminderLabel {
    if (!_reminderLabel) {
        _reminderLabel = [[UILabel alloc] init];
        _reminderLabel.text = @"重新设置密码后，你可以用手机号+密码登录，请牢记";
        _reminderLabel.textAlignment = NSTextAlignmentLeft;
        _reminderLabel.textColor = [UIColor grayColor];
        _reminderLabel.numberOfLines = 0;
        [_reminderLabel sizeToFit];
    }
    return _reminderLabel;
}

- (UILabel *)phoneNumberLabel {
    if (!_phoneNumberLabel) {
        _phoneNumberLabel = [[UILabel alloc] init];
        NSString *phoneNumberString = @"17745163521";
        NSString *string = [NSString stringWithFormat:@"手机号:%@", phoneNumberString];
        _phoneNumberLabel.textAlignment = NSTextAlignmentLeft;
        _phoneNumberLabel.textColor = [UIColor lightGrayColor];
        _phoneNumberLabel.text = string;
    }
    return _phoneNumberLabel;
}

- (LGHYHDTextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[LGHYHDTextField alloc] init];
        _passwordTextField.text = @"填写密码";
        _passwordTextField.delegate = self;
        _passwordTextField.leftViewMode = UITextFieldViewModeNever;
    }
    return _passwordTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = backColor;
    self.title = @"重置密码";
    [self makeFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 布局

- (void)makeFrame {
    [self. view addSubview:self.reminderLabel];
    [self.reminderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(HDMargin/2);
        make.width.mas_equalTo(HDWidth - HDMargin/2);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.phoneNumberLabel];
    [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reminderLabel.mas_bottom);
        make.left.mas_equalTo(HDMargin/2);
        make.width.mas_equalTo(HDWidth - HDMargin/2);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneNumberLabel.mas_bottom);
        make.left.mas_equalTo(HDMargin/2);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(44);
    }];
}

@end
