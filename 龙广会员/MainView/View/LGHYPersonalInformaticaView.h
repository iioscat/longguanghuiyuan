//
//  LGHYPersonalInformaticaView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/18.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock)(UIButton *button);

@interface LGHYPersonalInformaticaView : UIView

@property (nonatomic, strong)UILabel *label1, *label2, *label3, *label4, *label5, *label6, *label7, *label8, *label9, *label10, *label11;
@property (nonatomic, strong)UIButton *btn1, *btn2;

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, copy)ButtonBlock block;

- (void)addCompileAction:(ButtonBlock)block;

@end
