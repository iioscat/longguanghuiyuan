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

static NSInteger sms_token;
@interface LGHYHDRegisterViewController ()

@property (nonatomic, assign)NSTimer *countDownTimer;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSString *token;

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
    [self showWiderAlert];
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
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *phoneNumberString = self.registerView.phoneStr;
    NSString *url = [NSString stringWithFormat:@"http://221.212.177.245/sms-capt?mobile=%@", phoneNumberString];
    __weak __typeof__(self) weakself = self;
    [session GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.token = JSON[@"token"];
        NSLog(@"%@", _token);
        NSLog(@"请求成功JSON:%@", JSON);
        [weakself performSelector:@selector(dismiss:) withObject:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败:%@", error.description);
        [JDStatusBarNotification showWithStatus:@"请稍后再试" dismissAfter:3];
    }];
    }
}

- (void)showSecondText {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"加载中，请稍后。。。"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *numberString = self.registerView.numberTextField.text;
    NSString *phoneNumberString = self.registerView.phoneTextField.text;
    NSString *sms_capt_token = _token;
    //NSLog(@"%@, %@, %@", numberString, phoneNumberString, sms_capt_token);
    NSString *url = @"http://221.212.177.245/mobile-reg";
    NSDictionary *dict = @{
                           @"mobile":phoneNumberString,
                           @"capt":numberString,
                           @"sms_capt_token":@"1e77c6d6-8745-493b-9d5d-ff193679bdab"
                          };
    NSLog(@"%@", dict);
    
    __weak __typeof__(self) weakself = self;
    [session POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        //[self performSelector:@selector(showOkayCancelAlert) withObject:nil];
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"请求成功JSON:%@", JSON);
        sms_token = [JSON[@"code"] integerValue];
        NSLog(@"%li", sms_token);
        switch (sms_token) {
            case 7:
                [weakself performSelector:@selector(showOkayCancelAlert) withObject:nil];
                break;
                
            default:
                [weakself performSelector:@selector(dismiss_) withObject:nil];
                break;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败:%@", error.description);

    }];
}

- (void)dismiss:(id)sender {
    [SVProgressHUD dismiss];
    [self registerClicked];
}

- (void)dismiss_ {
    [SVProgressHUD dismiss];
}
static NSInteger secondsCoundDown;

- (void)registerClicked

{
    
    //设置计时器
    
    secondsCoundDown = 3;
    
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
    
    if (secondsCoundDown == 0) {
        
        [self.countDownTimer invalidate];
        
        self.countDownTimer = nil;
        
        //设置按钮可点击
        
        [self.registerView.numberBtn setEnabled:YES];
        self.registerView.numberBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        
        //        [self.numberBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        
    }
    
    NSLog(@"%ld",(long)secondsCoundDown);
    
}

#pragma mark - jumpRealNameViewController

- (void)jumpRealNameViewController {
    LGHYHDRealNameViewController *vc = [[LGHYHDRealNameViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - alertView
- (void)showWiderAlert{
    NSString *title = NSLocalizedString(@"提示", nil);
    NSString *message = NSLocalizedString(@"会员俱乐部采用实名会员管理，请确认信息与身份证信息相同，注册成功后，可凭本人身份证领取实体会员卡", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"我知道了", nil);
    //    NSString *otherButtonTitle = NSLocalizedString(@"实名认证", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
