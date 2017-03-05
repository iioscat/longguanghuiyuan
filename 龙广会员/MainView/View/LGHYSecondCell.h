//
//  LGHYSecondCell.h
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGHYSecond.h"

//创建一个代理
@protocol myTabVdelegate <NSObject>

- (void)myTabVClick:(UITableViewCell *)cell;
- (void)secondCellBtn1Click:(UITableViewCell *)cell;


@end

@interface LGHYSecondCell : UITableViewCell

@property(assign,nonatomic)id<myTabVdelegate>delegate;
@property(assign,nonatomic)id<myTabVdelegate>secondCellBtn1Delegate;
@property(assign,nonatomic)CGFloat cellHeight;
@property(assign,nonatomic,getter=isClicked)BOOL clicked;
@property (nonatomic, strong)UIButton *btn1;

@end
