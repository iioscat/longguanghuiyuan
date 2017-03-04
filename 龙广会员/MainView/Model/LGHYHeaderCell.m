//
//  LGHYHDHeaderCell.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHeaderCell.h"

#define wid ([UIScreen mainScreen].bounds.size.width - 80)/4

@interface LGHYHeaderCell()

@property (nonatomic, strong)UIButton *btn1;
@property (nonatomic, strong)UIImageView *iconView;
@property (nonatomic, strong)UIButton *btn2;
@property (nonatomic, strong)UIButton *btn3;

@end

@implementation LGHYHeaderCell

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"菜单" textFont:17];
        [_btn1 addTarget:self action:@selector(btn1CheckAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"消息" textFont:17];
        [_btn2 addTarget:self action:@selector(btn2CheckAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"签到" textFont:17];
        [_btn3 addTarget:self action:@selector(btn3CheckAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn3;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"header_cry_icon"];
    }
    return _iconView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.btn1];
        [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(wid);
        }];

        [self.contentView addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn1.mas_right).with.offset(20);
            make.width.mas_equalTo(wid);
            make.top.mas_equalTo(10);
            make.height.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.btn2];
        [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconView.mas_right).with.offset(20);
            make.width.mas_equalTo(wid);
            make.top.mas_equalTo(10);
            make.height.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.btn3];
        [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn2.mas_right).with.offset(20);
            make.width.mas_equalTo(wid);
            make.top.mas_equalTo(10);
            make.height.mas_equalTo(40);
        }];
        [self layoutIfNeeded];
        _cellHeight = CGRectGetMaxY(self.btn1.frame) + 10;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)btn1CheckAction:(UIButton *)sender {
    NSLog(@"测试");
    [self.headerCellBtn1Delegate headerCellBtn1Click:self];
}

- (void)btn2CheckAction:(UIButton *)sender {
    NSLog(@"测试");
    [self.headerCellBtn2Delegate headerCellBtn2Click:self];
}

- (void)btn3CheckAction:(UIButton *)sender {
    NSLog(@"测试");
    [self.headerCellBtn3Delegate headerCellBtn3Click:self];
}

@end
