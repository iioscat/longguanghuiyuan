//
//  LGHYHDTextField.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDTextField.h"

@interface LGHYHDTextField ()

@property (strong, nonatomic) UIImageView *leftImageView;

@end

@implementation LGHYHDTextField

#pragma mark -
#pragma mark lifecycle
- (instancetype)initWithFrame:(CGRect)frame
                  leftImgName:(NSString *)leftImgName
{
    self.leftImgName = leftImgName;
    
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置xx
        self.clearButtonMode = UITextFieldViewModeAlways;
        // 第二次输入清除内容
        self.clearsOnBeginEditing = NO;
        
        // return模式
        self.returnKeyType = UIReturnKeyDone;
        
        // 设置背景图片
        self.background = [UIImage imageNamed:@"background"];
        
        // 设置左边view
        self.leftView = self.leftImageView;
        // 设置左边view一直存在
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.borderStyle = UITextBorderStyleNone;
    }
    return self;
}

#pragma mark -
#pragma mark init methods
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 4, 45, 36)];
        _leftImageView.backgroundColor = [UIColor clearColor];
        _leftImageView.contentMode = UIViewContentModeCenter;
    }
    return _leftImageView;
}

#pragma mark -
#pragma mark set
- (void)setLeftImgName:(NSString *)leftImgName
{
    _leftImgName = leftImgName;
    
    // 把图片展示在leftView上面
    self.leftImageView.image = [UIImage imageNamed:leftImgName];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}


@end
