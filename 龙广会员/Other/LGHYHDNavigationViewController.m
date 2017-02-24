//
//  LGHYHDNavigationViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDNavigationViewController.h"

//自定义NavigationViewController“返回”按钮
@interface LGHYHDNavigationViewController ()

@end

@implementation LGHYHDNavigationViewController

+ (void)initialize
{
    UIImage *bg = [UIImage imageNamed:@"navigationbarBackgroundWhite"];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    //    [bar setTintColor:[UIColor blackColor]];
    [bar setBackgroundImage:bg forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        button.bounds = CGRectMake(0, 0, 70, 30);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
