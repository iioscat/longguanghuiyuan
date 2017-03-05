//
//  LGHYHDActivityViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/28.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDActivityViewController.h"

@interface LGHYHDActivityViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation LGHYHDActivityViewController

- (UIButton *)button {
    if (!_button) {
        _button = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"分享" textFont:17];
        [_button addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"最新活动";
    self.view.backgroundColor = backColor;
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**  属性
 *  shareUrl: 点击跳转的链接,字符串格式（例如：http://cn.bing.com）
 *  shareTitle: 分享出去的标题
 *  shareText: 分享出去的内容描述
 *  shareImage: 分享出去的图片,字符串格式(json返回的图片地址)
 *  分享保存本地的图片，把方法中的（image：）nil 替换成［UIImage imageNamed:@"本地图片.png"］
 */




@end
