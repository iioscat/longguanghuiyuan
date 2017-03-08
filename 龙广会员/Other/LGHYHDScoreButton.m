//
//  LGHYHDScoreButton.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDScoreButton.h"

@interface LGHYHDScoreButton ()

@property (nonatomic, strong)UIImageView *giftImageView;
@property (nonatomic, strong)UILabel *giftLabel;

@end

@implementation LGHYHDScoreButton

- (UIImageView *)giftImageView {
    if (!_giftImageView) {
        _giftImageView = [[UIImageView alloc] init];
        _giftImageView.backgroundColor = [UIColor redColor];
    }
    return _giftImageView;
}

- (UILabel *)giftLabel {
    if (!_giftLabel) {
        _giftLabel = [[UILabel alloc] init];
        _giftLabel.backgroundColor = [UIColor orangeColor];
        _giftLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _giftLabel;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.giftImageView];
        [self.giftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        [self addSubview:self.giftLabel];
        [self.giftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.giftImageView.mas_bottom).with.offset(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

+ (LGHYHDScoreButton *)buttonWithImage:(NSString *)imageName title:(NSString *)titleName textFont:(CGFloat)fontSize {
    LGHYHDScoreButton *btn = [[LGHYHDScoreButton alloc] init];
    btn.enabled = YES;
    btn.giftImageView.image = [UIImage imageNamed:imageName];
    btn.giftLabel.text = titleName;
    btn.giftLabel.font = [UIFont boldSystemFontOfSize:17];
    return btn;
}


@end
