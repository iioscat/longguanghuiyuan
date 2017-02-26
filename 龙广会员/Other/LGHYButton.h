//
//  LGHYButton.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/18.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGHYButton : UIButton

+ (UIButton *)buttonWithImage:(NSString *)image title:(NSString *)title textFont:(CGFloat)fontSize addView:(UIView *)view target:(id)target action:(SEL)action;

@end
