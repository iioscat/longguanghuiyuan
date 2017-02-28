//
//  LGHYPersonalInformationController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/16.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYPersonalInformationController.h"
#import "LGHYPersonalInformaticaView.h"
#import "LGHYCompileViewController.h"

@interface LGHYPersonalInformationController ()

@property (nonatomic, strong)UILabel *label1, *label2, *label3, *label4, *label5, *label6, *label7, *label8, *label9, *label10, *label11;
@property (nonatomic, strong)UIButton *btn1, *btn2;

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)LGHYPersonalInformaticaView *backView;
@end

@implementation LGHYPersonalInformationController

- (LGHYPersonalInformaticaView *)backView {
    if (!_backView) {
        _backView = [[LGHYPersonalInformaticaView alloc] init];
        _backView.backgroundColor = [UIColor lightGrayColor];
    }
    return _backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人资料";
    [self btn1AddCompileAction];
    [self.view addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - addCompileAction

- (void)btn1AddCompileAction {
    __weak __typeof__(self) weakSelf = self;
    [self.backView addCompileAction:^(UIButton *button) {
        LGHYCompileViewController *vc = [[LGHYCompileViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
}
@end
