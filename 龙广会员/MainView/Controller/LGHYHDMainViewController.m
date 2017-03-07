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
#import "LGHYHDManagementController.h"
#import "LGHYHDMyScoreController.h"
#import "LGHYHDExchangeScoreController.h"
#import "LGHYHDMyCardsController.h"
#import "LGHYHDCollectController.h"
#import "LGHYHDQuestionController.h"
#import "CYLHomeViewController.h"
#import "UIBarButtonItem+XMGExtension.h"

static NSString * identifier = @"cellID";
@interface LGHYHDMainViewController ()<UITableViewDataSource, UITableViewDelegate, myTabVdelegate, headerCellDelegate,thirdCellDelegate, forthCellDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataList;
@property (nonatomic, strong)NSArray * viewControllers;
@property (nonatomic, strong)LGHYListView *tab;
@property (nonatomic, strong)LGHYBackView *backViewOfTab;
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)LGHYSecond *second;
@property (nonatomic, assign)BOOL clicked;
@property (nonatomic, strong)LGHYSecondCell *secondCell;
@property (nonatomic, strong)NSIndexPath *indexPathForSecondCell;

@end

@implementation LGHYHDMainViewController

- (NSIndexPath *)indexPathForSecondCell {
    if (!_indexPathForSecondCell) {
        _indexPathForSecondCell = [[NSIndexPath alloc] init];
    }
    return _indexPathForSecondCell;
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
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
        
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backColor;
    self.title = @"龙广会员";
    self.navigationItem.leftBarButtonItem.customView.hidden = YES;
    self.navigationItem.rightBarButtonItems = @[
                                                [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(setting)]
                                                ];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    //上拉加载
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
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
    
    [self.tableView.mj_header endRefreshing];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }else {
        return 11;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        tableView.allowsSelection = NO;
        if (indexPath.row == 0) {
            LGHYHeaderCell *cellTest = [[LGHYHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.headerCellBtn1Delegate = self;
            cellTest.headerCellBtn2Delegate = self;
            cellTest.headerCellBtn3Delegate = self;
            cell = cellTest;
        }else if (indexPath.row == 1){
            LGHYSecondCell *cellTest = [[LGHYSecondCell alloc] init];
            cellTest.delegate = self;
            cellTest.secondCellBtn1Delegate = self;
            cell = cellTest;
            self.indexPathForSecondCell = indexPath;
        }else if (indexPath.row == 2) {
            LGHYThirdCell *cellTest = [tableView dequeueReusableCellWithIdentifier:identifier];
            cellTest = [[LGHYThirdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.thirdCellBtnDelegate = self;
            cellTest.thirdCellClickDelegate = self;
            cell = cellTest;
        }else {
            LGHYForthCell *cellTest = [tableView dequeueReusableCellWithIdentifier:identifier];
            cellTest = [[LGHYForthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cellTest.forthCellBtnDelegate = self;
            cell = cellTest;
        }
    }else {
        if(indexPath.row % 2 == 1) {
            cell.contentView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.allowsSelection = NO;
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
            tableView.allowsSelection = YES;
        }
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LGHYHeaderCell *cell = [[LGHYHeaderCell alloc] init];
            return cell.cellHeight;
        }else if (indexPath.row == 1) {
            LGHYSecondCell *cell = [[LGHYSecondCell alloc] init];
            if (self.clicked == NO) {
                return cell.cellHeight;
            }else {
                return cell.cellHeight + 50;
            }
        }else if (indexPath.row == 2){
            LGHYThirdCell *cell = [[LGHYThirdCell alloc] init];
            return cell.cellHeight;
        }else {
            LGHYForthCell *cell = [[LGHYForthCell alloc] init];
            return cell.cellHeight;
        }
    }else {
        if (indexPath.row % 2 == 1) {
            return 10;
        }else {
            return 40;
        }
    }

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)secondCellBtn1Click:(UITableViewCell *)cell {

    if (self.clicked == NO) {
        self.clicked = YES;
    }else {
        self.clicked = NO;
    }
    [self.tableView beginUpdates];
    //[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPathForSecondCell] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];

}

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
    
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width-20, 30.0)];
    
    if (section == 1) {
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //字体不透明
        //headerLabel.opaque =NO;
        headerLabel.textColor = [UIColor grayColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:18];
        headerLabel.frame = CGRectMake(10.0, 0.0, self.view.bounds.size.width-20, 30.0);
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.text =  @"活动列表";
        [customView addSubview:headerLabel];
    }
    
    //返回自定义好的效果
    return customView;
}
//设置高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat kMagrin = 0;
    if (section == 1) {
        kMagrin = 30;
    }
    return kMagrin;
}

//“编辑”button事件
- (void)myTabVClick:(UITableViewCell *)cell
{
    LGHYCompileViewController *vc = [[LGHYCompileViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)headerCellBtn1Click:(UITableViewCell *)cell {
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
    [self.tab addPersonInfoAction:^(UIButton *button) {
        LGHYPersonalInformationController *vc = [[LGHYPersonalInformationController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addManagementAction:^(UIButton *button) {
        LGHYHDManagementController *vc = [[LGHYHDManagementController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addMyScoreAction:^(UIButton *button) {
        LGHYHDMyScoreController *vc = [[LGHYHDMyScoreController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addExchangeScoreAction:^(UIButton *button) {
        LGHYHDExchangeScoreController *vc = [[LGHYHDExchangeScoreController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addMyCardsAction:^(UIButton *button) {
        LGHYHDMyCardsController *vc = [[LGHYHDMyCardsController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addCollectAction:^(UIButton *button) {
        LGHYHDCollectController *vc = [[LGHYHDCollectController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addQuestionAction:^(UIButton *button) {
        LGHYHDQuestionController *vc = [[LGHYHDQuestionController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.tab addMyMessageAction:^(UIButton *button) {
        LGHYMessagesViewController *vc = [[LGHYMessagesViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)setting {
    ZFSettingViewController *vc = [[ZFSettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
