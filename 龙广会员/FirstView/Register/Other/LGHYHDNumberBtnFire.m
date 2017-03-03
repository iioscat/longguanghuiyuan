//
//  LGHYHDNumberBtnFire.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/2.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDNumberBtnFire.h"
#import "LGHYHDRegisterView.h"

static NSInteger secondsCoundDown;
@interface LGHYHDNumberBtnFire ()

@property (nonatomic, assign)NSTimer *countDownTimer;
@property (nonatomic, copy)NSString *time;

@end

@implementation LGHYHDNumberBtnFire

- (LGHYHDRegisterView *)registerView {
    if (!_registerView) {
        _registerView = [[LGHYHDRegisterView alloc] init];
    }
    return _registerView;
}

- (void)registerClicked {
    
    //设置计时器
    
    secondsCoundDown = 3;
    secondsCoundDown = secondsCoundDown;
    
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    
    //设置按钮不可点击
    [self.registerView.numberBtn setEnabled:NO];
    
    
}

//倒计时方法，

- (void)timeFireMethod

{
    
    secondsCoundDown --;
    
    //更新按钮倒计时时间
    
    self.time = [NSMutableString stringWithFormat:@"%lds后重试",(long)secondsCoundDown];
    
    [self.registerView.numberBtn setTitle:self.time forState:UIControlStateDisabled];
    NSLog(@"%@", self.registerView.numberBtn.titleLabel.text);
    
    if (secondsCoundDown == 0) {
        
        [self.countDownTimer invalidate];
        
        self.countDownTimer = nil;
        
        //设置按钮可点击
        
        [self.registerView.numberBtn setEnabled:YES];
        
    }
    
    NSLog(@"%ld",(long)secondsCoundDown);
    
}


@end
