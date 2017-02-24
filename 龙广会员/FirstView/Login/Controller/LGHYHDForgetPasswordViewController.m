//
//  LGHYHDForgetPasswordViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDForgetPasswordViewController.h"
#import "LGHYHDForgetPasswordView.h"

@interface LGHYHDForgetPasswordViewController ()<UITextFieldDelegate>

@end

@implementation LGHYHDForgetPasswordViewController

#pragma mark - 懒加载
- (LGHYHDForgetPasswordView *)forgetPasswordView {
    if (!_forgetPasswordView) {
        _forgetPasswordView = [[LGHYHDForgetPasswordView alloc] initWithFrame:HDBounds];
        _forgetPasswordView.backgroundColor = backColor;
        [_forgetPasswordView.registerBtn setTitle:@"下一步" forState:UIControlStateNormal];
    }
    return _forgetPasswordView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = backColor;
    self.title = @"找回密码";
    [self.view addSubview:self.forgetPasswordView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
