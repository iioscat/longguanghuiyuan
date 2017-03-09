//
//  LGHYHDScoreButtonView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDScoreButtonView.h"

@implementation LGHYHDScoreButtonView

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setBackgroundImage:[UIImage imageNamed:@"03"] forState:UIControlStateNormal];
        
    }
    return _button;
}

- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
        //_desLabel.backgroundColor = [UIColor orangeColor];
        _desLabel.textAlignment = NSTextAlignmentCenter;
        _desLabel.text = @"baby01";
    }
    return _desLabel;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        [self addSubview:self.desLabel];
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.button.mas_bottom);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
    }
    return  self;
}
@end
