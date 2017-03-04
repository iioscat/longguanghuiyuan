//
//  LGHYHDMainViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMainViewController.h"
#import "LGHYBackView.h"
#import "LGHYListView.h"
#import "MJRefresh.h"
#import "LGHYSecondCell.h"
#import "LGHYHeader.h"
#import "LGHYHeaderCell.h"
#import "LGHYThirdCell.h"
#import "LGHYForthCell.h"
#import "LGHYFifthCell.h"
#import "LGHYMessage.h"
#import "LGHYMessageCell.h"
#import "WeChat.h"
#import "LGHYCompileViewController.h"
#import "JDStatusBarNotification.h"
#import "JDStatusBarStyle.h"
#import "LGHYMessagesViewController.h"
#import "LGHYQianDaoViewController.h"
#import "LGHYCarsViewController.h"
#import "LGHYPersonalInformationController.h"
#import "ZFSettingViewController.h"
#import "LGHYSecond.h"
#import "LGHYHDActivityViewController.h"

static NSString * identifier = @"cellID";
@interface LGHYHDMainViewController ()<UITableViewDataSource, UITableViewDelegate, myTabVdelegate, headerCellDelegate,thirdCellDelegate, forthCellDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataList;
@property (nonatomic, strong)NSArray * viewControllers;
@property (nonatomic, strong)LGHYListView *tab;
@property (nonatomic, strong)LGHYBackView *backViewOfTab;
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)LGHYSecond *second;

@end

@implementation LGHYHDMainViewController

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [WeChat loadWeiChatData];
    }
    return _dataList;
}

- (UIView *)tab {
    if (!_tab) {
        _tab = [[LGHYListView alloc] init];
        _tab.backgroundColor = [UIColor whiteColor];
        _tab.layer.cornerRadius = 3;
        _tab.layer.masksToBounds = NO;
        _tab.layer.shadowColor = [UIColor blackColor].CGColor; //shadowColor阴影颜色
        _tab.layer.shadowOffset = CGSizeMake(4, -1); //shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        _tab.layer.shadowOpacity = 0.3; //阴影透明度，默认0
        _tab.layer.shadowRadius = 4;
    }
    return _tab;
}

- (UIView *)backViewOfTab {
    if (!_backViewOfTab) {
        _backViewOfTab = [[LGHYBackView alloc] init];
        _backViewOfTab.backgroundColor = [UIColor clearColor];
        
        
    }
    return _backViewOfTab;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
        
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //        _tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
    self.title = @"龙广会员";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    //上拉加载
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    [self.view addSubview:self.tableView];
    [self hideTab];
    [self addButtonActionOfListView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - refresh
- (void)refresh {
    for (int i = 0; i<10000; i++) {
        NSLog(@"下拉刷新");
    }
    [self.tableView.mj_header endRefreshing];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 2;
    }else {
        return 11;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LGHYHeaderCell *cellTest = [tableView dequeueReusableCellWithIdentifier:identifier];
            cellTest = [[LGHYHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.headerCellBtn1Delegate = self;
            cellTest.headerCellBtn2Delegate = self;
            cellTest.headerCellBtn3Delegate = self;
            cell = cellTest;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.rowHeight = cellTest.cellHeight;
            //cell.contentView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
        }else {
            LGHYSecondCell *cellTest = [tableView dequeueReusableCellWithIdentifier:identifier];
            cellTest = [[LGHYSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.delegate = self;
            cellTest.secondCellBtn1Delegate = self;
            cell = cellTest;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.rowHeight = cellTest.cellHeight;
            //cell.contentView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
            
        }
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            LGHYThirdCell *cellTest = [tableView dequeueReusableCellWithIdentifier:identifier];
            cellTest = [[LGHYThirdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.thirdCellBtnDelegate = self;
            cellTest.thirdCellClickDelegate = self;
            cell = cellTest;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.rowHeight = cellTest.cellHeight;
            //cell.contentView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
            
        }else {
            LGHYForthCell *cellTest = [tableView dequeueReusableCellWithIdentifier:identifier];
            cellTest = [[LGHYForthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.forthCellBtnDelegate = self;
            cell = cellTest;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.rowHeight = cellTest.cellHeight;
            //cell.contentView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
            
        }
    }else {
        if(indexPath.row % 2 == 1) {
            _tableView.rowHeight = 10;
            cell.contentView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
            _tableView.allowsSelection = NO;
        }else {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"汽车消费类活动";
                cell.imageView.image = [UIImage imageNamed:@"MoreGame"];
            }else if (indexPath.row == 2) {
                cell.textLabel.text = @"参观类活动";
                cell.imageView.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
            }else if (indexPath.row == 4) {
                cell.textLabel.text = @"节日类活动";
                cell.imageView.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
            }else if (indexPath.row == 6) {
                cell.textLabel.text = @"表演类活动";
                cell.imageView.image = [UIImage imageNamed:@"ff_IconQRCode"];
            }else if (indexPath.row == 8) {
                cell.textLabel.text = @"旅游类活动";
                cell.imageView.image = [UIImage imageNamed:@"ff_IconLocationService"];
            }else if (indexPath.row == 10) {
                cell.textLabel.text = @"收听类活动";
                cell.imageView.image = [UIImage imageNamed:@"barbuttonicon_Luckymoney"];
            }
            _tableView.rowHeight = 40;
            _tableView.allowsSelection = YES;
        }
        
    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 200;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        NSString * vcName = self.viewControllers[2][indexPath.row];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//头标题

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    //创建一个用于返回效果的UIView，用来承接文字或图片
    UIView* customView = [[UIView alloc] init];
    
    if (section == 2) {
        customView.frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width-20, 30.0);
        //customView.backgroundColor=[UIColor orangeColor];
        //自定义文字效果
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //headerLabel.backgroundColor = [UIColor redColor];
        //字体不透明
        //headerLabel.opaque =NO;
        headerLabel.textColor = [UIColor grayColor];
        //
        //headerLabel.highlightedTextColor = [UIColor blackColor];
        //字体效果
        headerLabel.font = [UIFont boldSystemFontOfSize:18];
        //设置label格式
        headerLabel.frame = CGRectMake(10.0, 0.0, self.view.bounds.size.width-20, 30.0);
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.text =  @"活动列表";
        //将自定义的内容添加到UIView上
        [customView addSubview:headerLabel];
    }
    
    //返回自定义好的效果
    return customView;
}
//设置高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat kMagrin = 0;
    if (section == 2) {
        kMagrin = 30;
    }
    return kMagrin;
}

- (void)secondCellBtn1Click:(UITableViewCell *)cell {
    
}

//“编辑”button事件
- (void)myTabVClick:(UITableViewCell *)cell
{
    NSIndexPath *index = [_tableView indexPathForCell:cell];
    
    NSLog(@"333===%ld",index.row);
    LGHYCompileViewController *vc = [[LGHYCompileViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    //[JDStatusBarNotification showProgress:0.5];
    [JDStatusBarNotification showWithStatus:@"根据资料的完善程度，会赠送您相应的积分" dismissAfter:3];
    
    
}
- (void)headerCellBtn1Click:(UITableViewCell *)cell {
    NSLog(@"233333");
    self.tab.hidden = NO;
    self.backViewOfTab.hidden = NO;
    self.backViewOfTab.btn.hidden = NO;
    [self.view addSubview:self.backViewOfTab];
    [self.backViewOfTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    [self.view addSubview:self.tab];
    [self.tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(120);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(400);
    }];
    
}

- (void)headerCellBtn2Click:(UITableViewCell *)cell {
    LGHYMessagesViewController *vc = [[LGHYMessagesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)headerCellBtn3Click:(UITableViewCell *)cell {
    //LGHYQianDaoViewController *vc = [[LGHYQianDaoViewController alloc] init];
    LGHYQianDaoViewController *vc = [[LGHYQianDaoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)thirdCellBtnClick:(UITableViewCell *)cell {
    LGHYCarsViewController *vc = [[LGHYCarsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)thirdCellClick {
    LGHYHDActivityViewController *vc1 = [[LGHYHDActivityViewController alloc] init];
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)forthCellBtnClick:(UITableViewCell *)cell {
    LGHYCarsViewController *vc = [[LGHYCarsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)hideTab {
    __weak __typeof__(self) weakSelf = self;
    [self.backViewOfTab addButtonAction:^(UIButton *button) {
        NSLog(@"呵呵呵");
        weakSelf.backViewOfTab.hidden = YES;
        weakSelf.tab.hidden = YES;
        weakSelf.backViewOfTab.btn.hidden = YES;
    }];
}

#pragma mark - addButtonActionOfListView
- (void)addButtonActionOfListView {
    __weak __typeof__(self) weakSelf = self;
    [self.tab addQianDaoAction:^(UIButton *button) {
        weakSelf.backViewOfTab.hidden = YES;
        weakSelf.tab.hidden = YES;
        weakSelf.backViewOfTab.btn.hidden = YES;
        LGHYQianDaoViewController *vc = [[LGHYQianDaoViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addSettingAction:^(UIButton *button) {
        ZFSettingViewController *vc = [[ZFSettingViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
}



@end
