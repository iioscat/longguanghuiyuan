//
//  LGHYBackView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/13.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock)(UIButton *button);

@interface LGHYBackView : UIView

@property (nonatomic, strong)UIButton *btn;

- (void)addButtonAction:(ButtonBlock)block;  

@end
