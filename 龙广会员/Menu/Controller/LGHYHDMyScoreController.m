//
//  LGHYHDMyScoreController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMyScoreController.h"
#import "MJExtension.h"
#import "LGHYHDMyScore_Model.h"
#import "LGHYHDMyScoreModel.h"
#import "AFHTTPSessionManager.h"
#import "LGHYHDMyScoreTableViewCell.h"
#import "LGHYHDRule_Model.h"

#define wid [UIScreen mainScreen].bounds.size.width

@interface LGHYHDMyScoreController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *btn1, *btn2;

@property (nonatomic, strong) UIView *view1, *view2;

@property (nonatomic, strong) UILabel *labelOfScrollView, *scoreInformationLabel;

@property (nonatomic, strong) UITableView *tableView, *tableView1;

@property (nonatomic, strong) NSArray *dataLsit;

@property (nonatomic, strong) NSDictionary *dataDict;

@property (nonatomic, strong) NSMutableArray *dataListArray, *ruleListArray;

/** 请求管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

@end

@implementation LGHYHDMyScoreController

- (UILabel *)scoreInformationLabel {
    if (!_scoreInformationLabel) {
        _scoreInformationLabel = [[UILabel alloc] init];
        _scoreInformationLabel.numberOfLines = 0;
    }
    return _scoreInformationLabel;
}

- (UILabel *)labelOfScrollView {
    if (!_labelOfScrollView) {
        _labelOfScrollView = [[UILabel alloc] init];
        _labelOfScrollView.backgroundColor = [UIColor redColor];
        _labelOfScrollView.numberOfLines = 0;
    }
    return _labelOfScrollView;
}

- (NSMutableArray *)ruleListArray {
    if (!_ruleListArray) {
        _ruleListArray = [NSMutableArray array];
    }
    return _ruleListArray;
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (NSMutableArray *)dataListArray {
    if (!_dataListArray) {
        _dataListArray = [NSMutableArray array];
    }
    return _dataListArray;
}

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
        _view2.backgroundColor = backColor;
    }
    return _view2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
    self.title = @"我的积分";
    [self showBtn];
    [self showView2];
    [self showView1];

    [self loadTags];
    [self loadRule];
    [self loadScoreInformation];
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
    [self.view2 addSubview:self.labelOfScrollView];
    [self.labelOfScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self.view2 addSubview:self.scoreInformationLabel];
    [self.scoreInformationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(self.labelOfScrollView.mas_bottom);
        make.right.mas_equalTo(0);
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

static NSInteger pageNo = 1;
# pragma mark- 专门加载标签数据
- (void)loadTags
{
    // 弹框
    //    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD show];
    
    // 加载标签数据
    // 请求参数
    NSString *path = @"http://221.212.177.245/point/history";
    NSDictionary *dict = @{
                               @"pageNo":@"1",
                               @"pageSize":@"10"
                               };
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 发送请求
    __weak typeof(self)weakself = self;
    [self.manager POST:path parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (responseObject == nil) {
//            // 关闭弹框
//            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
//            return;
//        }
        NSMutableArray *dataDict = [NSMutableArray array];
        dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        LGHYHDMyScore_Model *model = [LGHYHDMyScore_Model mj_objectWithKeyValues:dataDict];
        for (NSDictionary *dict in model.data) {
            LGHYHDMyScoreModel *scoreModel = [[LGHYHDMyScoreModel alloc] init];
            [scoreModel setValuesForKeysWithDictionary:dict];
            [self.dataListArray addObject:scoreModel];
        }
        [weakself.tableView reloadData];
        
        [SVProgressHUD dismiss];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 如果是取消了任务，就不算请求失败，就直接返回
        if (error.code == NSURLErrorCancelled) return;
        
        if (error.code == NSURLErrorTimedOut) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试！"];
        } else {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        }

    }];
    pageNo++;
}

- (void)loadRule {
    NSString *path = @"http://221.212.177.245/point/rule";
    NSDictionary *dict = @{
                           };
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 发送请求
    __weak typeof(self)weakself = self;
    [self.manager POST:path parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject == nil) {
                    // 关闭弹框
                    [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
                    return;
                }
        NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSMutableArray *dataDict = [NSMutableArray array];
        dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", dataDict);
        LGHYHDRule_Model *model = [LGHYHDRule_Model mj_objectWithKeyValues:dataDict];
        NSLog(@"%@", model.data);
        self.labelOfScrollView.text = [NSString stringWithFormat:@"积分规则：\n%@", dataString];
//        for (NSDictionary *dict in model.data) {
//            LGHYHDMyScoreModel *scoreModel = [[LGHYHDMyScoreModel alloc] init];
//            [scoreModel setValuesForKeysWithDictionary:dict];
//            [self.dataListArray addObject:scoreModel];
//        }
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 如果是取消了任务，就不算请求失败，就直接返回
        if (error.code == NSURLErrorCancelled) return;
        
        if (error.code == NSURLErrorTimedOut) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试！"];
        } else {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        }
        
    }];
}

- (void)loadScoreInformation {
    NSString *path = @"http://221.212.177.245/point/information";
    NSDictionary *dict = @{
                           };
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 发送请求
    __weak typeof(self)weakself = self;
    [self.manager POST:path parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject == nil) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
            return;
        }
        NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSMutableArray *dataDict = [NSMutableArray array];
        dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", dataDict);
        LGHYHDRule_Model *model = [LGHYHDRule_Model mj_objectWithKeyValues:dataDict];
        NSLog(@"%@", model.data);
        self.scoreInformationLabel.text = [NSString stringWithFormat:@"积分信息：\n%@", dataString];
        //        for (NSDictionary *dict in model.data) {
        //            LGHYHDMyScoreModel *scoreModel = [[LGHYHDMyScoreModel alloc] init];
        //            [scoreModel setValuesForKeysWithDictionary:dict];
        //            [self.dataListArray addObject:scoreModel];
        //        }
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 如果是取消了任务，就不算请求失败，就直接返回
        if (error.code == NSURLErrorCancelled) return;
        
        if (error.code == NSURLErrorTimedOut) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试！"];
        } else {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        }
        
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataListArray.count;
}
  
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellID";
    LGHYHDMyScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LGHYHDMyScoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.myScoreModel = self.dataListArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGHYHDMyScoreModel *model = self.dataListArray[indexPath.row];
    return model.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
