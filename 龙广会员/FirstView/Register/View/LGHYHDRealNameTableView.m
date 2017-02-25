//
//  LGHYHDRealNameTableView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRealNameTableView.h"
#import "LGHYHDRealName.h"


@interface LGHYHDRealNameTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation LGHYHDRealNameTableView

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [LGHYHDRealName loadRealNameData];
    }
    return _dataList;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cellID";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        LGHYHDRealName *realName = self.dataList[indexPath.section][indexPath.row];
        cell.textLabel.text = realName.title;
        cell.detailTextLabel.text = realName.data;
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.delegate = self;
    self.dataSource = self;
    self.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    self.backgroundColor = [UIColor orangeColor];
//    self.sectionHeaderHeight = 20;
//    self.sectionFooterHeight = 0;
//    self.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
}

@end
