//
//  LGHYListView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/12.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYListView.h"

@interface LGHYListView()

@property (nonatomic,copy)ButtonBlock block;
@property (nonatomic,copy)ButtonBlock settingBlock;
@property (nonatomic,copy)ButtonBlock personInfoBlock;
@property (nonatomic,copy)ButtonBlock managementBlock;
@property (nonatomic,copy)ButtonBlock myScoreBlock;
@property (nonatomic,copy)ButtonBlock exchangeScoreBlock;
@property (nonatomic,copy)ButtonBlock myCardsBlock;
@property (nonatomic,copy)ButtonBlock myMessageBlock;
@property (nonatomic,copy)ButtonBlock collectBlock;
@property (nonatomic,copy)ButtonBlock questionBlock;

@end
@implementation LGHYListView

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1 setTitle:@"个人资料" forState:UIControlStateNormal];
        _btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn1.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);//设置button文字距离左端的距离为15；
        //_btn1.titleLabel.backgroundColor = [UIColor redColor];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2 setTitle:@"活动管理" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn2.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);

    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn3 setTitle:@"我的积分" forState:UIControlStateNormal];
        _btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn3.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn3;
}

- (UIButton *)btn4 {
    if (!_btn4) {
        _btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn4 setTitle:@"积分兑换" forState:UIControlStateNormal];
        _btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn4.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn4;
}

- (UIButton *)btn5 {
    if (!_btn5) {
        _btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn5 setTitle:@"我的卡券" forState:UIControlStateNormal];
        _btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn5.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn5;
}

- (UIButton *)btn6 {
    if (!_btn6) {
        _btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn6 setTitle:@"我要签到" forState:UIControlStateNormal];
        _btn6.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn6.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return _btn6;
}

- (UIButton *)btn7 {
    if (!_btn7) {
        _btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn7 setTitle:@"我的消息" forState:UIControlStateNormal];
        _btn7.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn7.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn7;
}

- (UIButton *)btn8 {
    if (!_btn8) {
        _btn8 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn8 setTitle:@"收藏" forState:UIControlStateNormal];
        _btn8.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn8.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn8;
}

- (UIButton *)btn9 {
    if (!_btn9) {
        _btn9 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn9 setTitle:@"问题反馈" forState:UIControlStateNormal];
        _btn9.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn9.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn9;
}

- (UIButton *)btn10 {
    if (!_btn10) {
        _btn10 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn10 setTitle:@"设置" forState:UIControlStateNormal];
        _btn10.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn10.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_btn10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return _btn10;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.btn1];
        [self.btn1 addTarget:self action:@selector(personInfoAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn2];
        [self.btn2 addTarget:self action:@selector(managementAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn3];
        [self.btn3 addTarget:self action:@selector(myScoreAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn4];
        [self.btn4 addTarget:self action:@selector(exchangeScoreAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn5];
        [self.btn5 addTarget:self action:@selector(myCardsAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn6];
        [self.btn6 addTarget:self action:@selector(qianDaoAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn7];
        [self.btn7 addTarget:self action:@selector(myMessageAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn8];
        [self.btn8 addTarget:self action:@selector(collectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn9];
        [self.btn9 addTarget:self action:@selector(questionAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn10];
        [self.btn10 addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn1.frame = CGRectMake(0, 0, 150, 40);
    self.btn2.frame = CGRectMake(0, 40, 150, 40);
    self.btn3.frame = CGRectMake(0, 80, 150, 40);
    self.btn4.frame = CGRectMake(0, 120, 150, 40);
    self.btn5.frame = CGRectMake(0, 160, 150, 40);
    self.btn6.frame = CGRectMake(0, 200, 150, 40);
    self.btn7.frame = CGRectMake(0, 240, 150, 40);
    self.btn8.frame = CGRectMake(0, 280, 150, 40);
    self.btn9.frame = CGRectMake(0, 320, 150, 40);
    self.btn10.frame = CGRectMake(0, 360, 150, 40);

}

#pragma mark - Action
- (void)addQianDaoAction:(ButtonBlock)block {
    self.block = block;
}
- (void)qianDaoAction:(UIButton *)button {
    if (self.block) {
        self.block(button);
    }
}
- (void)addSettingAction:(ButtonBlock)block {
    self.settingBlock = block;
}

- (void)settingAction:(UIButton*)button {
    if (self.settingBlock) {
        self.settingBlock(button);
    }
}

- (void)addPersonInfoAction:(ButtonBlock)block {
    self.personInfoBlock = block;
}

- (void)personInfoAction:(UIButton *)button {
    if (self.personInfoBlock) {
        self.personInfoBlock(button);
    }
}

- (void)addManagementAction:(ButtonBlock)block {
    self.managementBlock = block;
}

- (void)managementAction:(UIButton *)button {
    if (self.managementBlock) {
        self.managementBlock(button);
    }
}

- (void)addMyScoreAction:(ButtonBlock)block {
    self.myScoreBlock = block;
}

- (void)myScoreAction:(UIButton *)button {
    if (self.myScoreBlock) {
        self.myScoreBlock(button);
    }
}
- (void)addExchangeScoreAction:(ButtonBlock)block {
    self.exchangeScoreBlock = block;
}
- (void)exchangeScoreAction:(UIButton *)button {
    if (self.exchangeScoreBlock) {
        self.exchangeScoreBlock(button);
    }
}

- (void)addMyCardsAction:(ButtonBlock)block {
    self.myCardsBlock = block;
}
- (void)myCardsAction:(UIButton *)button {
    if (self.myCardsBlock) {
        self.myCardsBlock(button);
    }
}

- (void)addMyMessageAction:(ButtonBlock)block {
    self.myMessageBlock = block;
}
- (void)myMessageAction:(UIButton *)button {
    if (self.myMessageBlock) {
        self.myMessageBlock(button);
    }
}

- (void)addCollectAction:(ButtonBlock)block {
    self.collectBlock = block;
}
- (void)collectAction:(UIButton *)button {
    if (self.collectBlock) {
        self.collectBlock(button);
    }
}

- (void)addQuestionAction:(ButtonBlock)block {
    self.questionBlock = block;
}
- (void)questionAction:(UIButton *)button {
    if (self.questionBlock) {
        self.questionBlock(button);
    }
}
@end
