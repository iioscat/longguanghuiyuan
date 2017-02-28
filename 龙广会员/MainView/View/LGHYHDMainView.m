//
//  LGHYHDMainView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMainView.h"

@interface LGHYHDMainView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LGHYHDMainView

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cellID";
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    return cell;
}



@end
