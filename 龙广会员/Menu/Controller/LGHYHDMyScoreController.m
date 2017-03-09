//
//  LGHYHDMyScoreController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMyScoreController.h"
#import "MJExtension.h"
#import "LGHYHDPost.h"
#import "LGHYHDMyScore_Model.h"
#import "LGHYHDMyScoreModel.h"

#define wid [UIScreen mainScreen].bounds.size.width

@interface LGHYHDMyScoreController ()<UITableViewDelegate, UITableViewDataSource, postDelegate>

@property (nonatomic, strong) UIButton *btn1, *btn2;

@property (nonatomic, strong) UIView *view1, *view2;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataLsit;

@property (nonatomic, strong) NSDictionary *dataDict;

@end

@implementation LGHYHDMyScoreController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view1.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tableView;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [LGHYHDButton buttonWithImage:@"BtnImage" title:@"历史积分" textFont:17];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btn1DoAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [LGHYHDButton buttonWithImage:@"FollowBtnBg" title:@"积分规则" textFont:17];
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(btn2DoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = backColor;
    }
    return _view1;
}

- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = [UIColor redColor];
    }
    return _view2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
    self.title = @"我的积分";
    [self showBtn];
    [self showView2];
    [self showView1];
    [self post];
}

- (void)showBtn {
    [self.view addSubview:self.btn1];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.top.equalTo(@63);
        make.width.equalTo(@(wid/2));
        make.height.equalTo(@40);
    }];
    
    [self.view addSubview:self.btn2];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn1.mas_right).with.offset(0);
        make.top.equalTo(self.view).with.offset(63);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@40);
    }];
}

- (void)showView1 {
    
    [self.view addSubview:self.view1];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
    }];
    [self.view1 addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

- (void)showView2 {
    [self.view addSubview:self.view2];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
}

- (void)btn1DoAction:(UIButton *)btn {
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    
    self.view2.hidden = YES;
    self.view1.hidden = NO;
}

- (void)btn2DoAction:(UIButton *)btn {

    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    
    
    
    self.view1.hidden = YES;
    [self showView2];
    self.view2.hidden = NO;
}

NSInteger pageNo = 1;
- (void)post {
    LGHYHDPost *post = [[LGHYHDPost alloc] init];
    post.postDelegate = self;
    NSString *path = @"http://221.212.177.245/point/history";
    NSDictionary *dict = @{
                           @"pageNo":[NSString stringWithFormat:@"%li", pageNo],
                           @"pageSize":@"10"
                           };
    [post postWithUrl:path andDictionary:dict];
    pageNo++;
}

//+ (NSDictionary *)objectClassInArray{
//    return @{
//             @"statuses" : @"Status",
//             @"ads" : @"Ad"
//             };
//}

- (void)postJsonWithDataDict:(NSDictionary *)dict {
    NSLog(@"----------------");
    NSLog(@"%@", dict);
    LGHYHDMyScore_Model *model = [LGHYHDMyScore_Model mj_objectWithKeyValues:dict];
    //[model setValuesForKeysWithDictionary:dict];
    NSLog(@"%@", model.data);
//    for (LGHYHDMyScoreModel *scoreModel in model.data) {
//        
//        NSString *after_point = [NSString stringWithFormat:@"%li", scoreModel.after_point];
//        NSLog(@"%@", after_point);
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
