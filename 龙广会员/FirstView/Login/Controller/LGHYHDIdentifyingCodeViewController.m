//
//  LGHYHDIdentifyingCodeViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/24.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDIdentifyingCodeViewController.h"

@interface LGHYHDIdentifyingCodeViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation LGHYHDIdentifyingCodeViewController

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"重新设置密码后，你可以用手机号+密码登录，请牢记";
    }
    return _label;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = backColor;
    self.title = @"重置密码";
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
