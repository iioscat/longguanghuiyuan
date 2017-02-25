//
//  LGHYHDNumberOfRealViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDNumberOfRealViewController.h"
#import "LGHYHDTextField.h"

@interface LGHYHDNumberOfRealViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) LGHYHDTextField *nameTextField;
@property (nonatomic, strong) UILabel *reminderLabel;

@end

@implementation LGHYHDNumberOfRealViewController

#pragma mark - 懒加载
- (LGHYHDTextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[LGHYHDTextField alloc] init];
        _nameTextField.delegate = self;
        _nameTextField.placeholder = @"请输入身份证号...";
        _nameTextField.keyboardType = UIKeyboardTypeDefault;
        _nameTextField.leftViewMode = UITextFieldViewModeNever;
        
    }
    return _nameTextField;
}

- (UILabel *)reminderLabel {
    if (!_reminderLabel) {
        _reminderLabel = [[UILabel alloc] init];
        _reminderLabel.textAlignment = NSTextAlignmentLeft;
        _reminderLabel.text = @"请输入18位身份证号";
        _reminderLabel.font = [UIFont boldSystemFontOfSize:13];
        _reminderLabel.numberOfLines = 0;
        [_reminderLabel sizeToFit];
    }
    return _reminderLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"身份证号";
    self.view.backgroundColor = backColor;
    [self makeFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 布局
- (void)makeFrame {
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(44);
    }];
    [self.view addSubview:self.reminderLabel];
    [self.reminderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextField.mas_bottom).with.offset(HDMargin);
        make.left.mas_equalTo(HDMargin);
        make.width.mas_equalTo(HDTextFieldWidth);
        make.height.mas_equalTo(20);
    }];
}

#pragma mark - 点击其他位置键盘消失
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

@end
