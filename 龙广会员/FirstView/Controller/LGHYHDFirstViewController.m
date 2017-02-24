//
//  LGHYHDFirstViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDFirstViewController.h"
#import "LGHYHDFirstView.h"
#import "LGHYHDLoginViewController.h"
#import "LGHYHDRegisterViewController.h"
#import "LGHYHDRegisterViewController.h"
#import "LGHYHDVisitorsViewController.h"

@interface LGHYHDFirstViewController ()

@property (nonatomic, strong) LGHYHDFirstView *fistView;


@end

@implementation LGHYHDFirstViewController

#pragma mark - 懒加载
#pragma mark firstView
- (LGHYHDFirstView *)fistView {
    if (!_fistView) {
        _fistView = [[LGHYHDFirstView alloc] initWithFrame:HDBounds];
        _fistView.backgroundColor = backColor;
    }
    return _fistView;
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"龙广会员";
    self.view = self.fistView;
    //NSLog(@"%@", [self.fistView.dict objectForKey:self.fistView.model.imageName]);
    //NSLog(@"%@", [self.fistView.dict objectForKey:@"imageName"]);
    NSLog(@"%@", self.fistView.model);
    [self buttonAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma buttonAction
- (void)buttonAction {
    __weak __typeof__(self) weakSelf = self;
    [self.fistView addLoginButtonAction:^(UIButton *button) {
        LGHYHDLoginViewController *vc = [[LGHYHDLoginViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.fistView addRegisterButtonAction:^(UIButton *button) {
        LGHYHDRegisterViewController *vc1 = [[LGHYHDRegisterViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc1 animated:YES];
    }];
    [self.fistView addVisitorsButtonAction:^(UIButton *button) {
        LGHYHDVisitorsViewController *vc2 = [[LGHYHDVisitorsViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc2 animated:YES];
    }];
}

#pragma mark - 隐藏首页NavigationBar
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
@end
