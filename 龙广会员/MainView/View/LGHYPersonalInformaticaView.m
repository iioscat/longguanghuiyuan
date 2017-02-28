//
//  LGHYPersonalInformaticaView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/18.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYPersonalInformaticaView.h"

@implementation LGHYPersonalInformaticaView

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.text = @"姓名：张三";
        //_label1.backgroundColor = [UIColor redColor];
    }
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.text = @"身份证号：410187199009098778";
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        _label3.text = @"手机号：15819101245";
    }
    return _label3;
}

- (UILabel *)label4 {
    if (!_label4) {
        _label4 = [[UILabel alloc] init];
        _label4.text = @"性别：男";
    }
    return _label4;
}

- (UILabel *)label5 {
    if (!_label5) {
        _label5 = [[UILabel alloc] init];
        _label5.text = @"年龄：18";
    }
    return _label5;
}

- (UILabel *)label6 {
    if (!_label6) {
        _label6 = [[UILabel alloc] init];
        _label6.text = @"职业：";
        //_label6.backgroundColor = [UIColor redColor];
    }
    return _label6;
}

- (UILabel *)label7 {
    if (!_label7) {
        _label7 = [[UILabel alloc] init];
        _label7.text = @"职称：";
        //_label7.backgroundColor = [UIColor redColor];
    }
    return _label7;
}

- (UILabel *)label8 {
    if (!_label8) {
        _label8 = [[UILabel alloc] init];
        _label8.text = @"民族：";
        //_label8.backgroundColor = [UIColor redColor];
    }
    return _label8;
}

- (UILabel *)label9 {
    if (!_label9) {
        _label9 = [[UILabel alloc] init];
        _label9.text = @"学历：";
        //_label9.backgroundColor = [UIColor redColor];
    }
    return _label9;
}

- (UILabel *)label10 {
    if (!_label10) {
        _label10 = [[UILabel alloc] init];
        _label10.text = @"月收入：";
        //_label10.backgroundColor = [UIColor redColor];
    }
    return _label10;
}

- (UILabel *)label11 {
    if (!_label11) {
        _label11 = [[UILabel alloc] init];
        _label11.text = @"月支出：";
        //_label11.backgroundColor = [UIColor redColor];
    }
    return _label11;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [LGHYButton buttonWithImage:@"BtnImage.jpg" title:@"编辑个人信息" textFont:17 addView:self target:self action:@selector(compileAction:)];
    }
    return _btn1;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"03.jpg"];
    }
    return _imageView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        [self addSubview:self.label3];
        [self addSubview:self.label4];
        [self addSubview:self.label5];
        [self addSubview:self.label6];
        [self addSubview:self.label7];
        [self addSubview:self.label8];
        [self addSubview:self.label9];
        [self addSubview:self.label10];
        [self addSubview:self.label11];
        //[self addSubview:self.btn1];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = backColor;
    __weak __typeof__(self) weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(80);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.equalTo(weakSelf.imageView.mas_right).with.offset(10);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(25);
    }];
//    [weakSelf.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top).with.offset(120);
//        make.left.mas_equalTo(20);
//        make.width.mas_equalTo(150);
//        make.height.mas_equalTo(35);
//    }];
}
#pragma mark - Action
- (void)addCompileAction:(ButtonBlock)block {
    self.block = block;
}
- (void)compileAction:(UIButton *)button {
    if (self.block) {
        self.block(button);
    }
}


@end
