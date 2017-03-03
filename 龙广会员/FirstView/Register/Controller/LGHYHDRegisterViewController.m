//
//  LGHYHDRegisterViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRegisterViewController.h"
#import "LGHYHDRegisterView.h"
#import "LGHYHDRealNameViewController.h"
#import "UITextField+LGHYHDMobileNumber.h"
#import "LGHYHDLoginViewController.h"
#import "LGHYHDGet.h"
#import "LGHYHDReponseCode.h"
#import "LGHYHDShowAlert.h"
#import "LGHYHDNumberBtnFire.h"
#import "LGHYHDPost.h"

static NSInteger sms_token;
@interface LGHYHDRegisterViewController ()<getDelegate, postDelegate>

@property (nonatomic, copy)NSString *token;
@property (nonatomic, assign)NSTimer *countDownTimer;
@property (nonatomic, copy)NSString *time;

@end

@implementation LGHYHDRegisterViewController

#pragma mark - 懒加载
- (LGHYHDRegisterView *)registerView {
    if (!_registerView) {
        _registerView = [[LGHYHDRegisterView alloc] initWithFrame:HDBounds];
        _registerView.backgroundColor = backColor;
    }
    return _registerView;
    
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册会员";
    [self presentViewController:[LGHYHDShowAlert showAlert] animated:YES completion:nil];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.registerView];
    [self addButtonAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - makeButtonAction
- (void)addButtonAction {
    __weak __typeof__(self) weakSelf = self;
    [self.registerView addShowTextButtonAction:^(UIButton *button) {
        [weakSelf showText];
    }];
    [self.registerView addRegisterButtonAction:^(UIButton *button) {
        [weakSelf showSecondText];
    }];
}

#pragma mark - showOkayCancelAlert
- (void)showOkayCancelAlert {
    //[self.numberTextField resignFirstResponder];
    [SVProgressHUD dismiss];
    NSString *title = NSLocalizedString(@"自助实名认证", nil);
    NSString *message = NSLocalizedString(@"您已通过注册成为龙广会员，默认初始密码为手机号，通过“实名认证”即可享受龙广会员俱乐部的贴心服务", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"暂不认证", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"实名认证", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        LGHYHDLoginViewController *vc = [[LGHYHDLoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
        [self jumpRealNameViewController];
        
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showText {
    if (![self.registerView.phoneTextField isMobileNumber:self.registerView.phoneTextField.text]) {
        [JDStatusBarNotification showWithStatus:@"请输入正确的手机号" dismissAfter:3];
    }else {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
        NSString *phoneNumberString = self.registerView.phoneStr;
        NSString *url = [NSString stringWithFormat:@"http://221.212.177.245/sms-capt?mobile=%@", phoneNumberString];
        
        LGHYHDGet *hdGet = [[LGHYHDGet alloc] init];
        hdGet.getDelegate = self;
        [hdGet getWithUrl:url];
    
    }
}

- (void)showSecondText {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    
    NSString *numberString = self.registerView.numberTextField.text;
    NSString *phoneNumberString = self.registerView.phoneTextField.text;
    NSString *sms_capt_token = _token;
    //NSLog(@"%@, %@, %@", numberString, phoneNumberString, sms_capt_token);
    NSString *url = @"http://221.212.177.245/mobile-reg";
    NSDictionary *dict = @{
                           @"mobile":phoneNumberString,
                           @"capt":numberString,
                           @"sms_capt_token":sms_capt_token
                          };
    NSLog(@"%@", dict);
    LGHYHDPost *post = [[LGHYHDPost alloc] init];
    post.postDelegate = self;
    [post postWithUrl:url andDictionary:dict];
}

- (void)getJsonWithString:(NSString *)string {
    NSLog(@"接收到传值%@", string);
    _token = [string substringWithRange:NSMakeRange(19, 36)];
    NSLog(@"token = %@", _token);
    [SVProgressHUD dismiss];
    [self registerClicked];
    //键盘隐藏
    [self.registerView.phoneTextField resignFirstResponder];
    [LGHYHDReponseCode actionWithCode:string];
}

- (void)postJsonWithString:(NSString *)string {
    NSLog(@"接收到传值%@", string);
    [SVProgressHUD dismiss];
    //键盘隐藏
    [self.registerView.numberTextField resignFirstResponder];
    [LGHYHDReponseCode actionWithCode:string];
}

- (void)dismiss_ {
    [SVProgressHUD dismiss];
}
#pragma mark - jumpRealNameViewController

- (void)jumpRealNameViewController {
    LGHYHDRealNameViewController *vc = [[LGHYHDRealNameViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 发送验证码改变按钮的text
static NSInteger secondsCoundDown;

- (void)registerClicked {
    
    //设置计时器
    secondsCoundDown = 3;
    //设置按钮不可点击
    [self.registerView.numberBtn setEnabled:NO];
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    
}

//倒计时方法，

- (void)timeFireMethod

{
    secondsCoundDown--;
    self.time = [NSMutableString stringWithFormat:@"%lds后重试",(long)secondsCoundDown];
    [self.registerView.numberBtn setTitle:self.time forState:UIControlStateDisabled];
    //更新按钮倒计时时间
    if (secondsCoundDown == 0) {
        [self.countDownTimer invalidate];
        
        self.countDownTimer = nil;
        
        //设置按钮可点击
        
        [self.registerView.numberBtn setEnabled:YES];
        [self.registerView.numberBtn setTitle:@"获取验证码" forState:UIControlStateDisabled];
    }
    
    NSLog(@"%ld",(long)secondsCoundDown);
    
}




@end
