//
//  LGHYHDRegisterView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRegisterView.h"
#import "LGHYHDTextField.h"
#import "LGHYHDRegisterModel.h"
#import "UITextField+LGHYHDMobileNumber.h"

@interface LGHYHDRegisterView ()<UITextFieldDelegate, UIActionSheetDelegate>

@property (nonatomic ,copy) ButtonBlock registerButtonBlock;
@property (nonatomic, copy) ButtonBlock showTextButtonBlock;

@end

@implementation LGHYHDRegisterView

#pragma mark - 懒加载
- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [[LGHYHDTextField alloc] init];
        _phoneTextField.delegate = self;
        //_phoneTextField.leftImgName = @"userName";
        _phoneTextField.placeholder = @"请输入手机号...";
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _phoneTextField.layer.borderWidth = 2.0;
        _phoneTextField.layer.cornerRadius = 2.0f;
    }
    return _phoneTextField;
}

- (UITextField *)numberTextField {
    if (!_numberTextField) {
        _numberTextField = [[LGHYHDTextField alloc] init];
        _numberTextField.delegate = self;
        //_numberTextField.leftImgName = @"userName";
        _numberTextField.placeholder = @"请输入验证码...";
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
        _numberTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _numberTextField.layer.borderWidth = 2.0;
        _numberTextField.layer.cornerRadius = 2.0f;
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
        make.left.equalTo(self.phoneTextField.mas_right).with.offset(HDMargin);
        make.right.equalTo(self).with.offset(-20);
        make.height.mas_equalTo(44);
    }];

}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    [self makeFrame];
    self.numberStr = self.numberTextField.text;
    self.phoneStr = self.phoneTextField.text;
    NSLog(@"%@ %@", self.numberStr, self.phoneStr);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - 点击其他位置键盘消失
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    
}

#pragma mark - textDidChangeNotification
- (void)textDidChangeNotification:(NSNotification *)notifi {
    
    if (self.numberTextField.text.length != 0 && [self.phoneTextField isMobileNumber:self.phoneTextField.text]) {
        self.registerBtn.enabled = YES;
    }else{
        self.registerBtn.enabled = NO;
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

- (void)setRegisterModel:(LGHYHDRegisterModel *)registerModel {
    _registerModel = registerModel;
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = @"http://221.212.177.245/mobile-reg";
    NSString *mobile = _phoneTextField.text;
    NSString *capt = _numberTextField.text;
    NSDictionary *dict = @{
                           @"mobile":mobile,
                           @"capt":capt,
                           @"sms_capt_token":@"1e77c6d6-8745-493b-9d5d-ff193679bdab"
                           };

    [session POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"请求成功JSON:%@", JSON);
        self.registerModel.mobile = JSON[@"mobile"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败:%@", error.description);

    }];
}

@end
