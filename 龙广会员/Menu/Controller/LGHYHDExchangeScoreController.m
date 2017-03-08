//
//  LGHYHDExchangeScoreController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDExchangeScoreController.h"
#import "LGHYHDScoreButton.h"
#import "LGHYHDLoginViewController.h"

@interface LGHYHDExchangeScoreController ()

@property (nonatomic, strong)LGHYHDScoreButton *button;

@end

@implementation LGHYHDExchangeScoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
    self.button = [LGHYHDScoreButton buttonWithImage:@"03" title:@"Baby" textFont:17];
    self.button.backgroundColor = [UIColor grayColor];
    //[self.button buttonWithImage:@"03" title:@"Baby" textFont:17];
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [self.button addTarget:self action:@selector(jumpMain) forControlEvents:UIControlEventTouchUpOutside];
    self.title = @"积分兑换";
}

- (void)jumpMain {
    LGHYHDLoginViewController *vc = [[LGHYHDLoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
