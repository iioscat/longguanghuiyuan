//
//  LGHYHDLoginViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDLoginViewController.h"
#import "LGHYHDLoginView.h"
#import "UIView+MJAlertView.h"
#import "LGHYHDVisitorsViewController.h"
#import "LGHYHDRegisterViewController.h"
#import "LGHYHDForgetPasswordViewController.h"
#import "SVProgressHUD.h"

@interface LGHYHDLoginViewController ()<UITextFieldDelegate>

@end

@implementation LGHYHDLoginViewController

#pragma mark - 懒加载
- (LGHYHDLoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LGHYHDLoginView alloc] initWithFrame:HDBounds];
        _loginView.backgroundColor = backColor;
    }
    return _loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会员登录";
    [self.view addSubview:self.loginView];
    [self showWiderAlert];
    [self addButtonAction];
//    [self.view addSubview:self.firstView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginAction
{
    //NSLog(@"userName:%@ password:%@", _userNameTextField.text, _passwordTextField.text);
    //[self dismissViewControllerAnimated:YES completion:nil];
    LGHYHDVisitorsViewController *vc = [[LGHYHDVisitorsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - showText
- (void)showText {
    //键盘隐藏
    //[_loginView.userNameTextField resignFirstResponder];
    NSLog(@"show");
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
}

- (void)dismiss {
    [SVProgressHUD dismiss];
    [self loginAction];
}

#pragma mark - 提醒
- (void)showWiderAlert {
    [UIView addMJNotifierWithText:@"为了保护您的账号安全，请您及时修改密码！" dismissAutomatically:YES];
}

#pragma buttonAction
- (void)addButtonAction {
    __weak __typeof__(self) weakSelf = self;
    [self.loginView addLoginButtonAction:^(UIButton *button) {
        [weakSelf showText];
    }];
    [self.loginView addRegisterButtonAction:^(UIButton *button) {
        LGHYHDRegisterViewController *vc1 = [[LGHYHDRegisterViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc1 animated:YES];
    }];
    [self.loginView addForgetPasswordButtonAction:^(UIButton *button) {
        LGHYHDForgetPasswordViewController *vc2 = [[LGHYHDForgetPasswordViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc2 animated:YES];
    }];
}
@end
