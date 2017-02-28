//
//  LGHYFifthCell.m
//  龙广会员
//
//  Created by 王宏达 on 17/2/9.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYFifthCell.h"
#import "Masonry.h"
#import "LGHYMessage.h"
#import "LGHYMessageCell.h"
#import "WeChat.h"

#define wid [UIScreen mainScreen].bounds.size.width

@interface LGHYFifthCell()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UILabel *label;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) NSArray * viewControllers;

@end

@implementation LGHYFifthCell

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionHeaderHeight = 10;
        _tableView.sectionFooterHeight = 0;
        _tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
        /*
         
         UITableViewCellSeparatorStyleNone 没有线
         UITableViewCellSeparatorStyleSingleLine  单行线
         UITableViewCellSeparatorStyleSingleLineEtched  被石化的单行线
         
         */
        //线的风格
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        //_tableView.separatorColor = [UIColor redColor];
        //线的内边距
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
    }
    return _tableView;
}

- (NSArray *)dataList {
    
    if (!_dataList) {
        _dataList = [LGHYMessage loadMessageData];
    }
    return _dataList;
}

-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"活动列表";
        _label.textColor = [UIColor grayColor];
        _label.font = [UIFont boldSystemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
        //_label.backgroundColor = [UIColor redColor];
    }
    return _label;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
        NSArray * array = [WeChat loadWeiChatData];
        self.dataList = array;
        [self.contentView addSubview:self.tableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.width.equalTo(@(wid - 240));
        make.left.equalTo(@120);
        make.height.equalTo(@16);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).width.offset(2);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@340);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataList[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    WeChat * wechat = self.dataList[indexPath.section][indexPath.row];
    
    cell.textLabel.text = wechat.title;
    
    //    cell.textLabel.textColor = [UIColor redColor];
    
    //    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.imageView.image = [UIImage imageNamed:wechat.icon];
    
    /*
     
     UITableViewCellSelectionStyleNone, //没有点中效果
     UITableViewCellSelectionStyleBlue, ==
     UITableViewCellSelectionStyleGray, ==
     UITableViewCellSelectionStyleDefault NS_ENUM_AVAILABLE_IOS(7_0)
     
     */
    
    //选中风格
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    //设置cell右端图标
    /*
     UITableViewCellAccessoryDisclosureIndicator 尖角号
     UITableViewCellAccessoryDetailDisclosureButton 圆圈感叹号加尖角号
     UITableViewCellAccessoryCheckmark 对号
     UITableViewCellAccessoryDetailButton 圆圈感叹号
     */
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    if (indexPath.section == 1 && indexPath.row == 1) {
    //        //自定义右空间
    //        cell.accessoryView = [[UISwitch alloc] init];
    //
    //    }
    
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    UIView * v = [[UIView alloc] init];
//    v.backgroundColor = [UIColor greenColor];
//    return v;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//
//    UIView * v = [[UIView alloc] init];
//    v.backgroundColor = [UIColor redColor];
//    return v;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //NSString * vcName = self.viewControllers[indexPath.section][indexPath.row];
    
    //UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
    //[self.navigationController pushViewController:vc animated:YES];
    
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
