//
//  LGHYHDRegisterView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGHYHDTextField;
@class LGHYHDRegisterModel;
typedef void(^ButtonBlock)(UIButton *button);
@interface LGHYHDRegisterView : UIView

@property (nonatomic, strong) UITextField *phoneTextField ,*numberTextField;
@property (nonatomic, strong) UIButton                         *registerBtn;
@property (nonatomic, strong) UIButton                         *numberBtn;
@property (nonatomic, strong) LGHYHDRegisterModel *registerModel;
@property (nonatomic, copy) NSString *phoneStr;
@property (nonatomic, copy) NSString *numberStr;


- (void)addRegisterButtonAction:(ButtonBlock)block;
- (void)addShowTextButtonAction:(ButtonBlock)block;
@end
