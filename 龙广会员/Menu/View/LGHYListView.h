//
//  LGHYListView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/12.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock)(UIButton *button);

@interface LGHYListView : UIView

@property (nonatomic, strong)UIButton *btn1, *btn2, *btn3, *btn4, *btn5, *btn6, *btn7, *btn8, *btn9, *btn10;

- (void)addQianDaoAction:(ButtonBlock)block;
- (void)addSettingAction:(ButtonBlock)block;

@end
