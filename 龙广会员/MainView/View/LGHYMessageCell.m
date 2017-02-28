//
//  LGHYMessageCell.m
//  龙广会员
//
//  Created by 王宏达 on 17/1/17.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYMessageCell.h"

static NSInteger kMagrin = 10;

@interface LGHYMessageCell ()

//头像
@property (nonatomic, strong) UIImageView * iconView;
//姓名
@property (nonatomic, strong) UILabel * nameLabel;
//消息
@property (nonatomic, strong) UILabel * descLabel;
//时间
@property (nonatomic, strong) UILabel * timeLabel;


@end

@implementation LGHYMessageCell

- (void)setMessge:(LGHYMessage *)messge {
    
    _messge = messge;
    
    self.iconView.image = [UIImage imageNamed:messge.image];
    self.nameLabel.text = messge.name;
    self.descLabel.text = messge.message;
    self.timeLabel.text = messge.time;
}


- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        _iconView.clipsToBounds = YES;
    }
    return _iconView;
}
- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UILabel *)descLabel {
    
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.font = [UIFont systemFontOfSize:15];
    }
    return _descLabel;
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _timeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.timeLabel];
    }
    
    return self;
}

//layoutSubviews(布局子视图)当执行addsubview

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    
    CGFloat height = self.bounds.size.height;
    
    self.iconView.frame = CGRectMake(kMagrin, kMagrin, height - 2 * kMagrin, height - 2 * kMagrin);
    
    self.nameLabel.frame = CGRectMake(2 * kMagrin + CGRectGetWidth(self.iconView.frame), CGRectGetMinY(self.iconView.frame), 200, 20);
    
    self.descLabel.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame) + kMagrin, width - 3 * kMagrin - CGRectGetWidth(self.iconView.frame), 20);
    
    self.timeLabel.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + kMagrin, CGRectGetMinY(self.nameLabel.frame), width - 2 * kMagrin - CGRectGetMaxX(self.nameLabel.frame), 20);
}


- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
