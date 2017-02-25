//
//  LGHYHDIdentifyingCodeViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/24.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDIdentifyingCodeViewController.h"
#import "LGHYHDTextField.h"
#import "LGHYHDLoginViewController.h"

@interface LGHYHDIdentifyingCodeViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *reminderLabel, *phoneNumberLabel;
@property (nonatomic, strong) LGHYHDTextField *passwordTextField, *makeSurePasswordField;
@property (nonatomic, strong) UIButton *nextStepButton;

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
        _passwordTextField.placeholder = @"填写密码";
        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.tintColor = [UIColor grayColor];
        _passwordTextField.delegate = self;
        _passwordTextField.leftViewMode = UITextFieldViewModeNever;
    }
    return _passwordTextField;
}

- (LGHYHDTextField *)makeSurePasswordField {
    if (!_makeSurePasswordField) {
        _makeSurePasswordField = [[LGHYHDTextField alloc] init];
        _makeSurePasswordField.delegate = self;
        _makeSurePasswordField.placeholder = @"重新填写密码";
        _makeSurePasswordField.secureTextEntry = YES;
        _makeSurePasswordField.tintColor = [UIColor grayColor];
        _makeSurePasswordField.textAlignment = NSTextAlignmentLeft;
        _makeSurePasswordField.leftViewMode = UITextFieldViewModeNever;
    }
    return _makeSurePasswordField;
}

- (UIButton *)nextStepButton {
    if (!_nextStepButton) {
        _nextStepButton = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"下一步" textFont:17];
        [_nextStepButton addTarget:self action:@selector(showText) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepButton;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = backColor;
    self.title = @"重置密码";
    [self makeFrame];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
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
        make.left.mas_equalTo(HDMargin);
        make.width.mas_equalTo(HDWidth - 2 * HDMargin);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.phoneNumberLabel];
    [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reminderLabel.mas_bottom);
        make.left.mas_equalTo(HDMargin);
        make.width.mas_equalTo(HDWidth - 2 * HDMargin);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneNumberLabel.mas_bottom);
        make.left.mas_equalTo(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.makeSurePasswordField];
    [self.makeSurePasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom);
        make.left.mas_equalTo(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.nextStepButton];
    [self.nextStepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.makeSurePasswordField.mas_bottom).with.offset(HDMargin);
        make.left.mas_equalTo(HDMargin);
        make.right.mas_equalTo(-HDMargin);
        make.height.mas_equalTo(44);
    }];
}

#pragma mark - 收回键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

#pragma mark - 加载动画方法
- (void)showText {
    //键盘隐藏
    [self.makeSurePasswordField resignFirstResponder];
    NSLog(@"show");
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
}

- (void)dismiss {
    [SVProgressHUD dismiss];
    [self jumpLoginViewController];
}

#pragma mark - 跳转到登录页面
- (void)jumpLoginViewController {
    LGHYHDLoginViewController *vc = [[LGHYHDLoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - textDidChangeNotification
- (void)textDidChangeNotification:(NSNotification *)notifi {
    
    if ([self.passwordTextField.text isEqualToString:@""] || [self.makeSurePasswordField.text isEqualToString:@""]) {
        self.nextStepButton.enabled = NO;
    }else{
        self.nextStepButton.enabled = YES;
    }
}
@end
