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
#import "LGHYHDMainViewController.h"
#import "LGHYHDRegisterViewController.h"
#import "LGHYHDForgetPasswordViewController.h"
#import "SVProgressHUD.h"
#import "LGHYHDPost.h"
#import "LGHYHDReponseCode.h"
#import "UIView+MJAlertView.h"


@interface LGHYHDLoginViewController ()<postDelegate>

@property (nonatomic, copy) NSString *nameStr, *pwdStr;
@property (nonatomic, strong) NSDictionary *jsonData;
@property (nonatomic, strong) LGHYHDPost *post;

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
    [self addButtonAction];
//    [self.view addSubview:self.firstView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginAction
{
    LGHYHDMainViewController *vc = [[LGHYHDMainViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - showText
- (void)showText {
    
    _post = [[LGHYHDPost alloc] init];
    _post.postDelegate = self;
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    NSString *url = @"http://221.212.177.245/login";
    self.nameStr = self.loginView.userNameTextField.text;
    self.pwdStr = self.loginView.passwordTextField.text;
    NSDictionary *dict = @{
                           @"name":self.nameStr,
                           @"pwd":self.pwdStr
                           };
    [_post postWithUrl:url andDictionary:dict];
}

- (void)postJsonWithString:(NSString *)string {
    NSLog(@"接收到传值%@", string);
    [SVProgressHUD dismiss];
    //键盘隐藏
    [self.loginView.passwordTextField resignFirstResponder];
    [LGHYHDReponseCode actionWithCode:string];
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
