//
//  LGHYHDForgetPasswordView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGHYHDTextField;
typedef void(^ButtonBlock_)(UIButton *button);
@interface LGHYHDForgetPasswordView : UIView

@property (nonatomic, strong) LGHYHDTextField *phoneTextField ,*numberTextField;
@property (nonatomic, strong) UIButton                         *registerBtn;
@property (nonatomic, strong) UIButton                         *numberBtn;

- (void)addRegisterButtonAction_:(ButtonBlock_)block;
- (void)addShowTextButtonAction_:(ButtonBlock_)block;
@end
