//
//  LGHYHDFirstView.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGHYHDFirstViewModel;

typedef void (^ButtonBlock)(UIButton *button);

@interface LGHYHDFirstView : UIView

@property (nonatomic, strong) UIImageView          *imageView;
@property (nonatomic, strong) UILabel              *label;
@property (nonatomic, strong) UIButton             *loginButton;
@property (nonatomic, strong) UIButton             *registerButton;
@property (nonatomic, strong) UIButton             *signInButton;
@property (nonatomic, copy)   NSDictionary         *dict;
@property (nonatomic, strong) LGHYHDFirstViewModel *model;

- (void)addLoginButtonAction:(ButtonBlock)block;
- (void)addRegisterButtonAction:(ButtonBlock)block;
- (void)addVisitorsButtonAction:(ButtonBlock)block;
@end
