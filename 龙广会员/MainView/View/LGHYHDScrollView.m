//
//  LGHYHDScrollView.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/28.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDScrollView.h"
#import "SDCycleScrollView.h"

@interface LGHYHDScrollView ()

@property (nonatomic, strong) SDCycleScrollView *cycleView;

@end

@implementation LGHYHDScrollView

- (SDCycleScrollView *)cycleView {
    if (!_cycleView) {
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageNamesGroup:@[@"cor1",@"cor2",@"cor3"]];
        _cycleView.backgroundColor = [UIColor orangeColor];
    }
    return _cycleView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = backColor;
    [self addSubview:self.cycleView];
}



@end
