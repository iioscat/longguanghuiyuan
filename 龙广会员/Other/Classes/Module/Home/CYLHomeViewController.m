//
//  CYLHomeViewController.m
//  CYLTabBarController
//
//  v1.10.0 Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2015 https://github.com/ChenYilong . All rights reserved.
//

#import "CYLHomeViewController.h"
#import "LGHYHDMangementCellModel.h"
#import "LGHYHDManagementCell.h"

@interface CYLHomeViewController ()

@property (nonatomic, strong) NSArray *dataList;

@end


@implementation CYLHomeViewController

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [LGHYHDMangementCellModel loadData];
    }
    return _dataList;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"以往报名"; //✅sets navigation bar title.The right way to set the title of the navigation
    self.tabBarItem.title = @"首页23333";   //❌sets tab bar title. Even the `tabBarItem.title` changed, this will be ignored in tabbar.
    //self.title = @"首页1";                //❌sets both of these. Do not do this‼️‼️This may cause something strange like this : http://i68.tinypic.com/282l3x4.jpg .
    [self.navigationController.tabBarItem setBadgeValue:@"3"];
}

#pragma mark - Methods

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ Controller Cell %@", self.tabBarItem.title, @(indexPath.row)]];
}

#pragma mark - Table view

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    LGHYHDManagementCell *cell = [LGHYHDManagementCell cellWithTableView:tableView];
    cell.managementCellModel = self.dataList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGHYHDMangementCellModel *model = self.dataList[indexPath.row];
    return model.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSNumber *badgeNumber = @(indexPath.row + 1);
    //self.navigationItem.title = [NSString stringWithFormat:@"以往报名(%@)", badgeNumber]; //sets navigation bar title.
    [self.navigationController.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%@", badgeNumber]];
}

@end
