//
//  LGHYHDExchangeScoreController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDExchangeScoreController.h"
#import "LGHYHDScoreButtonView.h"
#import "LGHYHDLoginViewController.h"
#import "LGHYHDRemenViewController.h"

#define wid [UIScreen mainScreen].bounds.size.width

@interface LGHYHDExchangeScoreController ()

@property (nonatomic, strong) LGHYHDScoreButtonView *buttonView1, *buttonView2, *buttonView3, *buttonView4, *buttonView5, *buttonView6, *buttonView7, *buttonView8, *buttonView9, *buttonView11, *buttonView12, *buttonView13, *buttonView14, *buttonView15, *buttonView16, *buttonView17, *buttonView18, *buttonView19;

@property (nonatomic, strong) UIButton *btn1, *btn2;

@property (nonatomic, strong) UIView *view1, *view2;

@end

@implementation LGHYHDExchangeScoreController

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"我要兑换" textFont:17];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btn1DoAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [LGHYHDButton buttonWithImage:@"FollowBtnBg" title:@"积分筛选" textFont:17];
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(btn2DoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = backColor;
    }
    return _view1;
}

- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = [UIColor redColor];
    }
    return _view2;
}
- (LGHYHDScoreButtonView *)buttonView1 {
    if (!_buttonView1) {
        _buttonView1 = [[LGHYHDScoreButtonView alloc] init];
        [_buttonView1.button addTarget:self action:@selector(jumpMain) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonView1;
}

- (LGHYHDScoreButtonView *)buttonView2 {
    if (!_buttonView2) {
        _buttonView2 = [[LGHYHDScoreButtonView alloc] init];
        [_buttonView2.button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonView2;
}

- (LGHYHDScoreButtonView *)buttonView3 {
    if (!_buttonView3) {
        _buttonView3 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView3;
}

- (LGHYHDScoreButtonView *)buttonView4 {
    if (!_buttonView4) {
        _buttonView4 = [[LGHYHDScoreButtonView alloc] init];
        
    }
    return _buttonView4;
}

- (LGHYHDScoreButtonView *)buttonView5 {
    if (!_buttonView5) {
        _buttonView5 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView5;
}

- (LGHYHDScoreButtonView *)buttonView6 {
    if (!_buttonView6) {
        _buttonView6 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView6;
}

- (LGHYHDScoreButtonView *)buttonView7 {
    if (!_buttonView7) {
        _buttonView7 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView7;
}

- (LGHYHDScoreButtonView *)buttonView8 {
    if (!_buttonView8) {
        _buttonView8 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView8;
}

- (LGHYHDScoreButtonView *)buttonView9 {
    if (!_buttonView9) {
        _buttonView9 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView9;
}

- (LGHYHDScoreButtonView *)buttonView11 {
    if (!_buttonView11) {
        _buttonView11 = [[LGHYHDScoreButtonView alloc] init];
        [_buttonView11.button addTarget:self action:@selector(jumpMain) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonView11;
}

- (LGHYHDScoreButtonView *)buttonView12 {
    if (!_buttonView12) {
        _buttonView12 = [[LGHYHDScoreButtonView alloc] init];
        [_buttonView12.button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonView12;
}

- (LGHYHDScoreButtonView *)buttonView13 {
    if (!_buttonView13) {
        _buttonView13 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView13;
}

- (LGHYHDScoreButtonView *)buttonView14 {
    if (!_buttonView14) {
        _buttonView14 = [[LGHYHDScoreButtonView alloc] init];
        
    }
    return _buttonView14;
}

- (LGHYHDScoreButtonView *)buttonView15 {
    if (!_buttonView15) {
        _buttonView15 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView15;
}

- (LGHYHDScoreButtonView *)buttonView16 {
    if (!_buttonView16) {
        _buttonView16 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView16;
}

- (LGHYHDScoreButtonView *)buttonView17 {
    if (!_buttonView17) {
        _buttonView17 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView17;
}

- (LGHYHDScoreButtonView *)buttonView18 {
    if (!_buttonView18) {
        _buttonView18 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView18;
}

- (LGHYHDScoreButtonView *)buttonView19 {
    if (!_buttonView19) {
        _buttonView19 = [[LGHYHDScoreButtonView alloc] init];
    }
    return _buttonView19;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
    self.title = @"积分兑换";
    [self showBtn];
    [self showView2];
    [self showView1];
}

- (void)showBtn {
    [self.view addSubview:self.btn1];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.top.equalTo(@63);
        make.width.equalTo(@(wid/2));
        make.height.equalTo(@40);
    }];
    
    [self.view addSubview:self.btn2];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn1.mas_right).with.offset(0);
        make.top.equalTo(self.view).with.offset(63);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@40);
    }];
}

- (void)showView1 {
    
    [self.view addSubview:self.view1];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
    }];
    [self.view1 addSubview:self.buttonView1];
    [self.buttonView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HDMargin);
        make.top.mas_equalTo(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView2];
    [self.buttonView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView1.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.mas_equalTo(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView3];
    [self.buttonView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView2.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.mas_equalTo(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView4];
    [self.buttonView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HDMargin);
        make.top.equalTo(self.buttonView1.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView5];
    [self.buttonView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView4.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView2.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView6];
    [self.buttonView6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView5.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView3.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView7];
    [self.buttonView7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HDMargin);
        make.top.equalTo(self.buttonView4.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView8];
    [self.buttonView8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView7.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView5.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view1 addSubview:self.buttonView9];
    [self.buttonView9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView8.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView6.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
}

- (void)showView2 {
    [self.view addSubview:self.view2];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
}

- (void)btn1DoAction:(UIButton *)btn {
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    
    NSLog(@"活动签到");
    self.view2.hidden = YES;
    self.view1.hidden = NO;
}

- (void)btn2DoAction:(UIButton *)btn {
    NSLog(@"节目签到");
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    
    [self.view2 addSubview:self.buttonView11];
    [self.buttonView11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HDMargin);
        make.top.mas_equalTo(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView12];
    [self.buttonView12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView11.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.mas_equalTo(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView13];
    [self.buttonView13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView12.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.mas_equalTo(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView14];
    [self.buttonView14 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HDMargin);
        make.top.equalTo(self.buttonView11.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView15];
    [self.buttonView15 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView14.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView12.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView16];
    [self.buttonView16 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView15.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView13.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView17];
    [self.buttonView17 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HDMargin);
        make.top.equalTo(self.buttonView14.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView18];
    [self.buttonView18 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView17.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView15.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.view2 addSubview:self.buttonView19];
    [self.buttonView19 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonView18.mas_right).with.offset((wid - 300 - 2*HDMargin)/2);
        make.top.equalTo(self.buttonView16.mas_bottom).with.offset(HDMargin);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];

    
    self.view1.hidden = YES;
    [self showView2];
    self.view2.hidden = NO;
}



- (void)jumpMain {
    LGHYHDLoginViewController *vc = [[LGHYHDLoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jump {
    LGHYHDRemenViewController *vc = [[LGHYHDRemenViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
