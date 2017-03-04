//
//  LGHYForthCell.h
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol forthCellDelegate <NSObject>

- (void)forthCellBtnClick:(UITableViewCell *)cell;

@end

@interface LGHYForthCell : UITableViewCell

@property(assign,nonatomic)id<forthCellDelegate>forthCellBtnDelegate;
@property(assign,nonatomic)CGFloat cellHeight;
@end
