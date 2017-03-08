//
//  LGHYHDVisitorTableViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/8.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDVisitorTableViewController.h"
#import "LGHYHDMangementCellModel.h"
#import "LGHYHDManagementCell.h"

@interface LGHYHDVisitorTableViewController ()

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation LGHYHDVisitorTableViewController

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [LGHYHDMangementCellModel loadData];
    }
    return  _dataList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"参观类活动";

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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

@end
