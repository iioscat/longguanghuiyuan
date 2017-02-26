//
//  LGHYHDHeaderCell.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol headerCellDelegate <NSObject>

- (void)headerCellBtn1Click:(UITableViewCell *)cell;

- (void)headerCellBtn2Click:(UITableViewCell *)cell;

- (void)headerCellBtn3Click:(UITableViewCell *)cell;

@end
@interface LGHYHeaderCell : UITableViewCell

@property(assign,nonatomic)id<headerCellDelegate>headerCellBtn1Delegate;
@property(assign,nonatomic)id<headerCellDelegate>headerCellBtn2Delegate;
@property(assign,nonatomic)id<headerCellDelegate>headerCellBtn3Delegate;

@end
