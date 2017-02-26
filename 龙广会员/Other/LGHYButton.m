//
//  LGHYButton.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/18.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYButton.h"

@implementation LGHYButton

+ (UIButton *)buttonWithImage:(NSString *)image title:(NSString *)title textFont:(CGFloat)fontSize addView:(UIView *)view target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    btn.layer.cornerRadius = 4.0f;
    btn.layer.masksToBounds = YES;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return btn;
}
@end
