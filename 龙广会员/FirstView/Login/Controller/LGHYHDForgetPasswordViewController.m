//
//  LGHYHDForgetPasswordViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDForgetPasswordViewController.h"
#import "LGHYHDForgetPasswordView.h"
#import "LGHYHDIdentifyingCodeViewController.h"

@interface LGHYHDForgetPasswordViewController ()

@property (nonatomic, assign)NSTimer *countDownTimer;
@property (nonatomic, copy)NSString *time;

@end

@implementation LGHYHDForgetPasswordViewController

#pragma mark - 懒加载
- (LGHYHDForgetPasswordView *)forgetPasswordView {
    if (!_forgetPasswordView) {
        _forgetPasswordView = [[LGHYHDForgetPasswordView alloc] initWithFrame:HDBounds];
        _forgetPasswordView.backgroundColor = backColor;
    }
    return _forgetPasswordView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"找回密码";
    [self.view addSubview:self.forgetPasswordView];
    [self addButtonAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - makeButtonAction
- (void)addButtonAction {
    __weak __typeof__(self) weakSelf = self;
    [self.forgetPasswordView addShowTextButtonAction_:^(UIButton *button) {
        [weakSelf showText];
    }];
    [self.forgetPasswordView addRegisterButtonAction_:^(UIButton *button) {
        [weakSelf showSecondText];
    }];
}

- (void)showText {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    [self performSelector:@selector(registerClicked) withObject:nil afterDelay:3];
}

- (void)showSecondText {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    [self performSelector:@selector(jumpIdentifyingCodeViewController) withObject:nil afterDelay:3];
}

- (void)dismiss {
    [SVProgressHUD dismiss];
}

static NSInteger secondsCoundDown;

- (void)registerClicked

{
    
    //设置计时器
    
    secondsCoundDown = 3;
    
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    
    //设置按钮不可点击
    
    [self.forgetPasswordView.numberBtn setEnabled:NO];
    
    
}

//倒计时方法，

- (void)timeFireMethod

{
    
    secondsCoundDown --;
    
    //更新按钮倒计时时间
    
    self.time = [NSMutableString stringWithFormat:@"%lds后重试",(long)secondsCoundDown];
    
    [self.forgetPasswordView.numberBtn setTitle:self.time forState:UIControlStateDisabled];
    
    if (secondsCoundDown == 0) {
        
        [self.countDownTimer invalidate];
        
        self.countDownTimer = nil;
        
        //设置按钮可点击
        
        [self.forgetPasswordView.numberBtn setEnabled:YES];
        self.forgetPasswordView.numberBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        
        //        [self.numberBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        
    }
    
    NSLog(@"%ld",(long)secondsCoundDown);
    
}

#pragma mark - jumpIdentifyingCodeViewController

- (void)jumpIdentifyingCodeViewController {
    LGHYHDIdentifyingCodeViewController *vc = [[LGHYHDIdentifyingCodeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"jumpIdentifyingCodeViewController");
}

@end
