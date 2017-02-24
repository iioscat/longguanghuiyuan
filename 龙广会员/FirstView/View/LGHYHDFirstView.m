//
//  LGHYHDFirstView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDFirstView.h"
#import "LGHYHDFirstViewModel.h"

@interface LGHYHDFirstView()

@property (nonatomic, copy) ButtonBlock loginButtonBlock;
@property (nonatomic, copy) ButtonBlock registerButtonBlock;
@property (nonatomic, copy) ButtonBlock visitorsButtonBlock;

@end

@implementation LGHYHDFirstView

#pragma mark - 懒加载

- (NSDictionary *)dict {
    if (!_dict) {
        _dict = [LGHYHDFirstViewModel loadFirstViewData];
    }
    return _dict;
}

- (LGHYHDFirstViewModel *)model {
    if (!_model) {
        _model = [[LGHYHDFirstViewModel alloc] init];
        [_model setValuesForKeysWithDictionary:self.dict];
    }
    return _model;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.imageName]];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = self.model.labelText;
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"会员登录" textFont:17];
        [_loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"注册会员" textFont:17];
        [_registerButton addTarget:self action:@selector(registerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)signInButton {
    if (!_signInButton) {
        _signInButton = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"游客身份" textFont:UIControlEventTouchUpInside];
        [_signInButton addTarget:self action:@selector(visitorsButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signInButton;
}
#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    [self makeFrame];
}
#pragma mark - 布局
- (void)makeFrame {
    //imageViewFrame
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self).with.offset(20);
        make.height.mas_equalTo(HDBounds.size.height/2);
    }];
    //labelFrame
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self.imageView.mas_bottom);
        make.width.equalTo(self.imageView.mas_width);
    }];
    //loginButtonFrame
    [self addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(30);
        //make.right.equalTo(self.view).with.offset(-30);
        make.top.equalTo(self.label.mas_bottom).with.offset(20);
        make.width.mas_equalTo((HDBounds.size.width-120)/3);
        make.height.mas_equalTo(40);
    }];
    //registerFrame
    [self addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginButton.mas_right).with.offset(30);
        //make.right.equalTo(self.view).with.offset(-30);
        make.top.equalTo(self.label.mas_bottom).with.offset(20);
        make.width.mas_equalTo((HDBounds.size.width-120)/3);
        make.height.mas_equalTo(40);
    }];
    //signInButton
    [self addSubview:self.signInButton];
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registerButton.mas_right).with.offset(30);
        //make.right.equalTo(self.view).with.offset(-30);
        make.top.equalTo(self.label.mas_bottom).with.offset(20);
        make.width.mas_equalTo((HDBounds.size.width-120)/3);
        make.height.mas_equalTo(40);
    }];
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
//signInButtonAction
- (void)addVisitorsButtonAction:(ButtonBlock)block {
    self.visitorsButtonBlock = block;
}

- (void)visitorsButtonAction:(UIButton *)button {
    if (self.visitorsButtonBlock) {
        self.visitorsButtonBlock(button);
    }
}


@end
