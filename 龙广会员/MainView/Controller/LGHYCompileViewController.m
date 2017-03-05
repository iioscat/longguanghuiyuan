//
//  LGHYCompileViewController.m
//  龙广会员
//
//  Created by 王宏达 on 17/2/10.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYCompileViewController.h"
#import "Masonry.h"
#import "LGHYHDRealNameViewController.h"
#import "LGHYHDTextField.h"

@interface LGHYCompileViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UILabel *label1, *label2, *label3, *label4, *label5, *label6, *label7, *label8, *label9, *label10, *label11;

@property (nonatomic, strong)LGHYHDTextField *field6, *field7, *field8, *field9, *field10, *field11;

@property (nonatomic, strong)UIButton *btn1, *btn2;

@end

@implementation LGHYCompileViewController

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.text = @"姓名：张三";
        //_label1.backgroundColor = [UIColor redColor];
    }
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.text = @"身份证号：410187199009098778";
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        _label3.text = @"手机号：15819101245";
    }
    return _label3;
}

- (UILabel *)label4 {
    if (!_label4) {
        _label4 = [[UILabel alloc] init];
        _label4.text = @"性别：男";
    }
    return _label4;
}

- (UILabel *)label5 {
    if (!_label5) {
        _label5 = [[UILabel alloc] init];
        _label5.text = @"年龄：18";
    }
    return _label5;
}

- (UILabel *)label6 {
    if (!_label6) {
        _label6 = [[UILabel alloc] init];
        _label6.text = @"职业：";
        //_label6.backgroundColor = [UIColor redColor];
    }
    return _label6;
}

- (UILabel *)label7 {
    if (!_label7) {
        _label7 = [[UILabel alloc] init];
        _label7.text = @"职称：";
        //_label7.backgroundColor = [UIColor redColor];
    }
    return _label7;
}

- (UILabel *)label8 {
    if (!_label8) {
        _label8 = [[UILabel alloc] init];
        _label8.text = @"民族：";
        //_label8.backgroundColor = [UIColor redColor];
    }
    return _label8;
}

- (UILabel *)label9 {
    if (!_label9) {
        _label9 = [[UILabel alloc] init];
        _label9.text = @"学历：";
        //_label9.backgroundColor = [UIColor redColor];
    }
    return _label9;
}

- (UILabel *)label10 {
    if (!_label10) {
        _label10 = [[UILabel alloc] init];
        _label10.text = @"月收入：";
        //_label10.backgroundColor = [UIColor redColor];
    }
    return _label10;
}

- (UILabel *)label11 {
    if (!_label11) {
        _label11 = [[UILabel alloc] init];
        _label11.text = @"月支出：";
        //_label11.backgroundColor = [UIColor redColor];
    }
    return _label11;
}

- (UITextField *)field6 {
    if (!_field6) {
        _field6 = [[LGHYHDTextField alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
        _field6.text = @"教师";
        //_field6.backgroundColor = [UIColor greenColor];
        _field6.delegate = self;
        _field6.leftViewMode = UITextFieldViewModeNever;
    }
    return _field6;
}

- (UITextField *)field7 {
    if (!_field7) {
        _field7 = [[LGHYHDTextField alloc] init];
        _field7.text = @"教授";
        //_field7.backgroundColor = [UIColor greenColor];
        _field7.delegate = self;
        _field7.leftViewMode = UITextFieldViewModeNever;
        _field7.borderStyle = UITextBorderStyleLine;

    }
    return _field7;
}

- (UITextField *)field8 {
    if (!_field8) {
        _field8 = [[LGHYHDTextField alloc] init];
        _field8.text = @"汉";
        //_field8.backgroundColor = [UIColor greenColor];
        _field8.delegate = self;
        _field8.leftViewMode = UITextFieldViewModeNever;

    }
    return _field8;
}

- (UITextField *)field9 {
    if (!_field9) {
        _field9 = [[LGHYHDTextField alloc] init];
        _field9.text = @"博士";
        //_field9.backgroundColor = [UIColor greenColor];
        _field9.delegate = self;
        _field9.leftViewMode = UITextFieldViewModeNever;

    }
    return _field9;
}

- (UITextField *)field10 {
    if (!_field10) {
        _field10 = [[LGHYHDTextField alloc] init];
        _field10.text = @"8000";
        //_field10.backgroundColor = [UIColor greenColor];
        _field10.delegate = self;
        _field10.leftViewMode = UITextFieldViewModeNever;

    }
    return _field10;
}

- (UITextField *)field11 {
    if (!_field11) {
        _field11 = [[LGHYHDTextField alloc] init];
        _field11.text = @"3000";
        //_field11.backgroundColor = [UIColor greenColor];
        _field11.delegate = self;
        _field11.leftViewMode = UITextFieldViewModeNever;

    }
    return _field11;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.backgroundColor = [UIColor grayColor];
        [_btn1 setTitle:@"确认" forState:UIControlStateNormal];
        //[_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn1.layer.cornerRadius = 3;
        _btn1.layer.masksToBounds = YES;
        [_btn1 addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.backgroundColor = [UIColor grayColor];
        [_btn2 setTitle:@"实名认证" forState:UIControlStateNormal];
        //[_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn2.layer.cornerRadius = 3;
        _btn2.layer.masksToBounds = YES;
        [_btn2 addTarget:self action:@selector(jumpRealNameController:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (void)doAction:(UIButton *)btn {
    NSLog(@"button");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    self.title = @"个人中心";
    //self.navigationController.navigationBarHidden = YES;
    [JDStatusBarNotification showWithStatus:@"根据资料的完善程度，会赠送您相应的积分" dismissAfter:3];
    [self show];
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
- (void)show {
    [self.view addSubview:self.label1];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@63);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label2];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label1.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label3];
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label2.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label4];
    [self.label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label3.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label5];
    [self.label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label4.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label6];
    [self.label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label5.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.width.equalTo(@55);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label7];
    [self.label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label6.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.width.equalTo(@55);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label8];
    [self.label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label7.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.width.equalTo(@55);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label9];
    [self.label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label8.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.width.equalTo(@55);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label10];
    [self.label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label9.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.width.equalTo(@70);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.label11];
    [self.label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label10.mas_bottom);
        make.left.equalTo(self.view).with.offset(5);
        make.width.equalTo(@70);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.field6];
    [self.field6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label6.mas_right);
        make.right.equalTo(self.view).with.offset(-3);
        make.top.equalTo(self.label5.mas_bottom);
        make.height.equalTo(@25);
    }];
    
    [self.view addSubview:self.field7];
    [self.field7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label7.mas_right);
        make.right.equalTo(self.view).with.offset(-3);
        make.height.equalTo(@25);
        make.top.equalTo(self.field6.mas_bottom);
    }];
    
    [self.view addSubview:self.field8];
    [self.field8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label8.mas_right);
        make.right.equalTo(self.view).with.offset(-3);
        make.height.equalTo(@25);
        make.top.equalTo(self.field7.mas_bottom);
    }];
    
    [self.view addSubview:self.field9];
    [self.field9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label9.mas_right);
        make.right.equalTo(self.view).with.offset(-3);
        make.height.equalTo(@25);
        make.top.equalTo(self.field8.mas_bottom);
    }];
    
    [self.view addSubview:self.field10];
    [self.field10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label10.mas_right);
        make.right.equalTo(self.view).with.offset(-3);
        make.height.equalTo(@25);
        make.top.equalTo(self.field9.mas_bottom);
    }];
    
    [self.view addSubview:self.field11];
    [self.field11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label11.mas_right);
        make.right.equalTo(self.view).with.offset(-3);
        make.height.equalTo(@25);
        make.top.equalTo(self.field10.mas_bottom);
    }];
    
    [self.view addSubview:self.btn1];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(3);
        make.top.equalTo(self.field11.mas_bottom).with.offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.view addSubview:self.btn2];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn1.mas_right).with.offset(10);
        make.top.equalTo(self.field11.mas_bottom).with.offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
}

#pragma mark - jumpRealNameController

- (void)jumpRealNameController:(UIButton *)button {
    LGHYHDRealNameViewController *vc = [[LGHYHDRealNameViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}


@end
