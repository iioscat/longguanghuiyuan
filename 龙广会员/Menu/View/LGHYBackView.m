//
//  LGHYBackView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/13.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYBackView.h"

@interface LGHYBackView()

@property (nonatomic, copy) ButtonBlock block;

@end

@implementation LGHYBackView

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setBackgroundColor: [UIColor clearColor]];
    }
    return _btn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.btn];
        [self.btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)addButtonAction:(ButtonBlock)block {
    self.block = block;
}
- (void)buttonAction:(UIButton *)button {
    if (self.block) {
        self.block(button);
    }
}
@end
