//
//  LGHYHDMyScoreTableViewCell.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDMyScoreTableViewCell.h"
#import "LGHYHDMyScoreModel.h"

/**
 *  积分历史信息
 *  before_point  修改前积分
 *  after_point    修改后积分
 *  create_time   修改时间
 *  uid          系统用户id
 *  reason        修改原因
 *  userName          系统用户名字
 case class Pointhistory(before_point: Int, after_point: Int, create_time: String, uid: Int, reason: String, userName: String)
 */

@interface LGHYHDMyScoreTableViewCell ()

@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *before_pointLabel;
@property (nonatomic, strong) UILabel *after_pointLabel;
@property (nonatomic, strong) UILabel *create_timeLabel;
@property (nonatomic, strong) UILabel *reasonLabel;

@end

@implementation LGHYHDMyScoreTableViewCell

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
    }
    return _userNameLabel;
}

- (UILabel *)before_pointLabel {
    if (!_before_pointLabel) {
        _before_pointLabel = [[UILabel alloc] init];
    }
    return _before_pointLabel;
}

- (UILabel *)after_pointLabel {
    if (!_after_pointLabel) {
        _after_pointLabel  = [[UILabel alloc] init];
    }
    return _after_pointLabel;
}

- (UILabel *)create_timeLabel {
    if (!_create_timeLabel) {
        _create_timeLabel = [[UILabel alloc] init];
    }
    return _create_timeLabel;
}

- (UILabel *)reasonLabel {
    if (!_reasonLabel) {
        _reasonLabel = [[UILabel alloc] init];
    }
    return _reasonLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.userNameLabel];
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        [self addSubview:self.before_pointLabel];
        [self.before_pointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.equalTo(self.userNameLabel.mas_bottom);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        [self addSubview:self.after_pointLabel];
        [self.after_pointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.equalTo(self.before_pointLabel.mas_bottom);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        [self addSubview:self.create_timeLabel];
        [self.create_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.equalTo(self.after_pointLabel.mas_bottom);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        [self addSubview:self.reasonLabel];
        [self.reasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.equalTo(self.create_timeLabel.mas_bottom);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        
    }
    return self;
}

- (void)setMyScoreModel:(LGHYHDMyScoreModel *)myScoreModel {
    _myScoreModel = myScoreModel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
