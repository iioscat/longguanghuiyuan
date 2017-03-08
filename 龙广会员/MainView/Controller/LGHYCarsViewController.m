//
//  LGHYCarsViewController.m
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYCarsViewController.h"
#import "Industry.h"
#import "MJRefresh.h"

@interface LGHYCarsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation LGHYCarsViewController

- (NSArray *)dataList {
    
    if (!_dataList) {
        
        _dataList = [Industry loadIndustryData];
    }
    return _dataList;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //行高固定时使用
        _tableView.rowHeight = 60;
        _tableView.backgroundColor = backColor;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tableView;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

//当滚动表格时，这个代理方法，一直调用
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell的复用机制
    
    static NSString * identifier = @"cellID";
    
    //从复用池里找对应的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        /*
         
         UITableViewCellStyleDefault  显示图片，显示辅助图片，显示一行文字
         UITableViewCellStyleValue1   显示图片，显示辅助图片，普通文字，描述文字，共占一排
         UITableViewCellStyleValue2   不显示图片，显示辅助图片，普通文字，描述文字，共占一排
         UITableViewCellStyleSubtitle 显示图片，显示辅助图片，普通文字，描述文字，共占两排
         
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    Industry * industry = self.dataList[indexPath.row];
    
    cell.textLabel.text = industry.name;
    
    cell.detailTextLabel.text = industry.state;
    
    cell.imageView.image = [UIImage imageNamed:industry.icon];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//设置行高方法,如果实现这个代理方法，rowHeight无效，这个主要用于设置可变cell高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    return 100;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"汽车消费类活动";
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    //上拉加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];

    [self.view addSubview:self.tableView];
    
    
}

#pragma mark - refresh
- (void)refresh {
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - loadMore

- (void)loadMore {
    [self.tableView.mj_footer endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
