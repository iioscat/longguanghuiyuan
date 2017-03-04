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
@property (nonatomic, strong)NSArray * imageDataList;



@end

@implementation LGHYForthCell

- (NSArray *)imageDataList {
    if (!_imageDataList) {
        _imageDataList = @[@"http://pic1.win4000.com/wallpaper/b/5864762f9b69e.jpg",
                           @"http://img17.3lian.com/d/file/201701/23/d6d7f549848efc04b605a73f9f982d85.jpg",
                           @"http://img17.3lian.com/d/file/201701/23/d6d7f549848efc04b605a73f9f982d85.jpg",
                           @"http://img17.3lian.com/d/file/201701/23/d6d7f549848efc04b605a73f9f982d85.jpg",
                           @"http://img17.3lian.com/d/file/201701/23/d6d7f549848efc04b605a73f9f982d85.jpg",
                           @"http://img17.3lian.com/d/file/201701/23/d6d7f549848efc04b605a73f9f982d85.jpg",
                           @"http://img17.3lian.com/d/file/201701/23/d6d7f549848efc04b605a73f9f982d85.jpg"
                           ];
    }
    return _imageDataList;
}

-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"推荐活动";
        _label.textColor = [UIColor grayColor];
        _label.font = [UIFont boldSystemFontOfSize:18];
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
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:self.imageDataList];
        //_scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _scrollView.showPageControl = YES;
        _scrollView.autoScrollTimeInterval = 3.;
        _scrollView.titleLabelTextColor = [UIColor whiteColor];
        _scrollView.titlesGroup = @[@"11111111",@"2222222",@"3333333333",@"444444444",@"555555555"];
    }
    return _scrollView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@2);
            make.width.equalTo(@(wid - 240));
            make.left.equalTo(@120);
            make.height.equalTo(@20);
        }];
        [self.contentView addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.equalTo(self.label.mas_bottom).with.offset(2);
            make.height.mas_equalTo(200);
        }];
        [self.contentView addSubview:self.btn];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.mas_bottom).with.offset(5);
            make.right.equalTo(@0);
            make.width.equalTo(@90);
            make.height.equalTo(@16);
        }];
        
        [self layoutIfNeeded];
        _cellHeight = CGRectGetMaxY(self.btn.frame);
    }
    return self;
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
