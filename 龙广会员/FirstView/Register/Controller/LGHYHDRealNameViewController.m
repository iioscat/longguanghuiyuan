//
//  LGHYHDRealNameViewController.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/23.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDRealNameViewController.h"
#import "LGHYHDRealName.h"
#import "LGHYHDUpLoadingImage.h"

static NSString *identifier = @"cellID";

@interface LGHYHDRealNameViewController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *realNameTableView;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation LGHYHDRealNameViewController

- (LGHYHDUpLoadingImage *)upImage {
    if (!_upImage) {
        _upImage = [[LGHYHDUpLoadingImage alloc] init];
    }
    return _upImage;
}

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [LGHYHDRealName loadRealNameData];
    }
    return _dataList;
}

- (UITableView *)realNameTableView {
    if (!_realNameTableView) {
        _realNameTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        //_realNameTableView.sectionHeaderHeight = 10;
        _realNameTableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
        _realNameTableView.delegate = self;
        _realNameTableView.dataSource = self;
        _realNameTableView.allowsSelection = YES;
        _realNameTableView.backgroundColor = backColor;
        _realNameTableView.tableFooterView.frame = CGRectZero;
        _realNameTableView.tableFooterView.backgroundColor = [UIColor orangeColor];
    }
    return  _realNameTableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 4) {
         [self addActionBlock];
        NSLog(@"%s", __func__);
        LGHYHDUpLoadingImage *upLoadingImage = [[LGHYHDUpLoadingImage alloc] init];
        [upLoadingImage changeIconAction];
        [upLoadingImage createData];
    }else {
    NSString *vcName = self.viewControllers[indexPath.row];
    NSLog(@"%li", indexPath.section);
    UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"实名认证";
    self.viewControllers = @[@"LGHYHDNameOfRealViewController", @"LGHYHDNumberOfRealViewController", @"LGHYHDCountryOfRealViewController", @"LGHYHDSexOfRealViewController", @"LGHYHDUploadImageViewController"];
    [self.view addSubview:self.realNameTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%li", self.dataList.count);
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    LGHYHDRealName *realName = self.dataList[indexPath.row];
    cell.textLabel.text = realName.title;
    cell.detailTextLabel.text = realName.data;
    cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - addActionBlock
- (void)addActionBlock {
    NSLog(@"%s", __func__);
    __weak LGHYHDRealNameViewController *weakself = self;
    LGHYHDUpLoadingImage *ulImage = [[LGHYHDUpLoadingImage alloc] init];
    [ulImage addJumpPhotoAction:^{
        [weakself presentViewController:weakself.upImage.pickerController animated:YES completion:nil];
    }];
    [ulImage addJumpPictureAction:^{
        [weakself presentViewController:weakself.upImage.pickerController animated:YES completion:nil];
    }];
    [ulImage addJumpLibraryAction:^{
        [weakself presentViewController:weakself.upImage.pickerController animated:YES completion:nil];
    }];
    [ulImage addJumpAction:^{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = weakself;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [weakself.navigationController presentViewController:picker animated:YES completion:nil];
    }];
    [ulImage addAlertAction:^{
         NSLog(@"%s", __func__);
        [weakself presentViewController:weakself.upImage.alert animated:YES completion:nil];
    }];
}

@end
