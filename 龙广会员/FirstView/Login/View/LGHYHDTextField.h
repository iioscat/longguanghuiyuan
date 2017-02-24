//
//  LGHYHDTextField.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LGHYHDTextField : UITextField

// 设置左边图片名字
@property (copy, nonatomic) NSString *leftImgName;

- (instancetype)initWithFrame:(CGRect)frame
                  leftImgName:(NSString *)leftImgName;

- (void)drawRect:(CGRect)rect;


@end
