//
//  LGHYHDUpLoadingImage.h
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^actionBlock)();

@interface LGHYHDUpLoadingImage : NSObject

@property (nonatomic, strong)UIImageView *headIcon;
@property (nonatomic, strong)UIImagePickerController *pickerController;
@property (nonatomic, strong)UIAlertController *alert;

- (void)addJumpPhotoAction:(actionBlock)block;
- (void)addJumpPictureAction:(actionBlock)block;
- (void)addJumpLibraryAction:(actionBlock)block;
- (void)addJumpAction:(actionBlock)block;
- (void)addAlertAction:(actionBlock)block;

- (void)changeIconAction;
- (void)createData;
@end
