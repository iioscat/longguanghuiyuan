//
//  LGHYHDManagementCell.h
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGHYHDMangementCellModel;

@interface LGHYHDManagementCell : UITableViewCell

@property (nonatomic, strong) LGHYHDMangementCellModel *managementCellModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
