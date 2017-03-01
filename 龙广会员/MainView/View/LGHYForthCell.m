//
//  LGHYForthCell.m
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYForthCell.h"
#import "Masonry.h"
#import "LGHYMessage.h"
#import "SDCycleScrollView.h"

#define wid [UIScreen mainScreen].bounds.size.width

@interface LGHYForthCell()

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)SDCycleScrollView *scrollView;
@property (nonatomic, strong)UIButton *btn;
@property (nonatomic, strong)NSArray * headerList;
@property (nonatomic, strong)NSArray * dataList;



@end

@implementation LGHYForthCell

- (NSArray *)dataList {
    
    if (!_dataList) {
        _dataList = [LGHYMessage loadMessageData];
    }
    return _dataList;
}

-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"推荐活动";
        _label.textColor = [UIColor grayColor];
        _label.font = [UIFont boldSystemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
        //_label.backgroundColor = [UIColor redColor];
    }
    return _label;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_btn setTitle:@"更多活动>>" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnCheckAction:) forControlEvents:UIControlEventTouchUpInside];
        //_btn.backgroundColor = [UIColor redColor];
    }
    return _btn;
}

- (SDCycleScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, wid - 20, 161) imageNamesGroup:@[@"06news",@"07news",@"08news",@"09news"]];
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _scrollView.autoScrollTimeInterval = 3;
        _scrollView.titleLabelTextColor = [UIColor whiteColor];
        _scrollView.titlesGroup = @[@"11111111",@"2222222",@"3333333333",@"444444444",@"555555555"];
    }
    return _scrollView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.btn];
        [self.contentView addSubview:self.scrollView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@2);
        make.width.equalTo(@(wid - 240));
        make.left.equalTo(@120);
        make.height.equalTo(@16);
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
        make.width.equalTo(@90);
        make.height.equalTo(@16);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@(-10));
        make.top.equalTo(self.label.mas_bottom).with.offset(2);
        make.bottom.equalTo(self.btn.mas_top).with.offset(-2);
    }];
    
}
- (void)doAction:(UIButton *)btn {
    NSLog(@"更多活动>>");
    
}
- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)btnCheckAction:(UIButton *)sender {
    NSLog(@"测试");
    [self.forthCellBtnDelegate forthCellBtnClick:self];
}

@end
