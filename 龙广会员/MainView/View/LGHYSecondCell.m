//
//  LGHYSecondCell.m
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYSecondCell.h"
#import "Masonry.h"
#import "LGHYCompileViewController.h"
#import "LGHYSecond.h"

@interface LGHYSecondCell()

@property (nonatomic, strong)UIImageView *iconView;
@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UILabel *label3;
@property (nonatomic, strong)UILabel *label4;
@property (nonatomic, strong)UIButton *btn1;
@property (nonatomic, strong)UIButton *btn2;
@property (nonatomic, strong)LGHYSecond *second;

@end

@implementation LGHYSecondCell

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"03.jpg"]];
        
        
    }
    return _iconView;
}

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.text = @"姓名：张三    卡号：0101001";
        _label1.textColor = [UIColor grayColor];
    }
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.text = @"积分：88     等级：中";
        _label2.textColor = [UIColor grayColor];
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        _label3.text = @"性别：女   年龄：18";
        _label3.textColor = [UIColor grayColor];
    }
    return _label3;
}

- (UILabel *)label4 {
    if (!_label4) {
        _label4 = [[UILabel alloc] init];
        _label4.textColor = [UIColor grayColor];
        _label4.text = @"民族：汉  生日：2016/08/08";
    }
    return _label4;
}

- (UIButton *)btn1 {
    if (!_btn1) {
    _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.backgroundColor = [UIColor grayColor];
    [_btn1 setTitle:@"更多信息" forState:UIControlStateNormal];
    _btn1.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        //[_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    _btn1.layer.cornerRadius = 5;
    _btn1.layer.masksToBounds = YES;
    [_btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn2.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_btn2 setTitle:@"编辑" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
        //_btn1.backgroundColor = [UIColor redColor];
    }
    return _btn2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label3];
        [self.contentView addSubview:self.label4];
        [self.contentView addSubview:self.btn1];
        [self.contentView addSubview:self.btn2];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
        make.top.equalTo(@20);
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(self.iconView.mas_right).with.offset(20);
        make.right.equalTo(@20);
    }];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label1.mas_bottom).with.offset(5);
        make.left.equalTo(self.iconView.mas_right).with.offset(20);
        make.right.equalTo(@20);
    }];
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label2.mas_bottom).with.offset(5);
        make.left.equalTo(self.iconView.mas_right).with.offset(20);
        make.right.equalTo(@20);
    }];
    [self.label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label3.mas_bottom).with.offset(5);
        make.left.equalTo(self.iconView.mas_right).with.offset(20);
        make.right.equalTo(@20);
    }];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-20));
        make.left.equalTo(self.iconView.mas_right).with.offset(50);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-40));
        make.height.equalTo(@20);
        make.width.equalTo(@40);
        make.bottom.equalTo(@0);
    }];
    _second.cellHeight = CGRectGetMaxY(self.btn2.frame) + 5;
    
}
- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)btn1Action:(UIButton *)btn {
    NSLog(@"secndcell button1-------");
    [self.delegate secondCellBtn1Click:self];
}

- (void)checkAction:(UIButton *)sender {
    NSLog(@"测试");
    [self.delegate myTabVClick:self];
}

@end
