//
//  LGHYHDManagementCell.m
//  龙广会员
//
//  Created by 王宏达 on 2017/3/7.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDManagementCell.h"
#import "LGHYHDMangementCellModel.h"

@interface LGHYHDManagementCell ()

@property (nonatomic, strong)UIImageView *pictureView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *desLabel;

@end

@implementation LGHYHDManagementCell

- (UIImageView *)pictureView {
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc] init];
    }
    return _pictureView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor orangeColor];
    }
    return _titleLabel;
}
- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
        _desLabel.numberOfLines = 0;
        _desLabel.backgroundColor = [UIColor purpleColor];
        _desLabel.font = [UIFont boldSystemFontOfSize:14];

    }
    return _desLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.pictureView];
        [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(40);
        }];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pictureView.mas_right).with.offset(10);
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        self.desLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 90;
        [self addSubview:self.desLabel];
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.left.equalTo(self.pictureView.mas_right).with.offset(10);
        }];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    NSString *identifier = @"cllID";
    LGHYHDManagementCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[LGHYHDManagementCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)setManagementCellModel:(LGHYHDMangementCellModel *)managementCellModel {
    _managementCellModel = managementCellModel;
    self.pictureView.image = [UIImage imageNamed:managementCellModel.icon];
    self.titleLabel.text = managementCellModel.name;
    self.desLabel.text = managementCellModel.state;
    [self layoutIfNeeded];
    CGSize size = [self.desLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width - 80, MAXFLOAT)];
    managementCellModel.cellHeight = CGRectGetMaxY(self.titleLabel.frame) + size.height + 20;

}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
