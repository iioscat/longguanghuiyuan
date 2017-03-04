//
//  LGHYThirdCell.h
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol thirdCellDelegate <NSObject>

- (void)thirdCellBtnClick:(UITableViewCell *)cell;
- (void)thirdCellClick;

@end

@interface LGHYThirdCell : UITableViewCell

@property(assign,nonatomic)id<thirdCellDelegate>thirdCellBtnDelegate;
@property(assign,nonatomic)id<thirdCellDelegate>thirdCellClickDelegate;
@property(assign,nonatomic)CGFloat cellHeight;

@end
