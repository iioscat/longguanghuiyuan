//
//  LGHYHDManagementController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDManagementController.h"
#import "LGHYHDJijiangViewController.h"
#import "LGHYHDRemenViewController.h"
#import "LGHYHDLiebiaoViewController.h"
#import "CYLTabBarController.h"
#import "CYLTabBarControllerConfig.h"
#import "LGHYHDYiWangViewController.h"
#import "AppDelegate.h"
#import "WXTabBarController.h"

@interface LGHYHDManagementController ()<UIApplicationDelegate>

@end

@implementation LGHYHDManagementController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *app2 = (AppDelegate *)app.delegate;
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    app2.window.rootViewController = tabBarControllerConfig.tabBarController;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
