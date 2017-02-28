//
//  LGHYHDUpLoadingImage.m
//  龙广会员
//
//  Created by 王宏达 on 2017/2/25.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYHDUpLoadingImage.h"

@interface LGHYHDUpLoadingImage()<UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, strong)CIDetector *detector;
@property (nonatomic, strong) actionBlock jumpPhotoBlock;
@property (nonatomic, strong) actionBlock jumpPictureBlock;
@property (nonatomic, strong) actionBlock jumpLibraryBlock;
@property (nonatomic, strong) actionBlock jumpBlock;
@property (nonatomic, strong) actionBlock alertBlock;

@end

@implementation LGHYHDUpLoadingImage

#pragma mark - upLoadingImage
- (void)upLoadingImage:(UIButton *)button {
    NSLog(@"上传照片");
    self.detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //[self.navigationController presentViewController:picker animated:YES completion:nil];
    [self jumpAction];
}

#pragma mark - 上传图片
- (void)initHeadIcon
{
    self.headIcon.backgroundColor = [UIColor lightGrayColor];
    self.headIcon.layer.cornerRadius = 5;
    self.headIcon.clipsToBounds = YES;
    
}
- (void)createData
{
    //初始化pickerController
    _pickerController = [[UIImagePickerController alloc]init];
    _pickerController.view.backgroundColor = [UIColor orangeColor];
    _pickerController.delegate = self;
    _pickerController.allowsEditing = NO;
}

- (void)changeIconAction {
    NSLog(@"%s", __func__);
    self.alert = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"拍照");
    }];
    UIAlertAction *pictureAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"相册");
    }];
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"图库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"图库");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [self.alert addAction:cameraAction];
    [self.alert addAction:pictureAction];
    [self.alert addAction:libraryAction];
    [self.alert addAction:cancelAction];
    [self alertAction];
    [self test];
//    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册",@"图库", nil];
//    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {//相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            NSLog(@"支持相机");
            [self makePhoto];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请在设置-->隐私-->相机，中开启本应用的相机访问权限！！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"我知道了", nil];
            [alert show];
        }
    }else if (buttonIndex == 1){//相片
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            NSLog(@"支持相册");
            [self choosePicture];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请在设置-->隐私-->照片，中开启本应用的相机访问权限！！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"我知道了", nil];
            [alert show];
        }
    }else if (buttonIndex == 2){//图册
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            NSLog(@"支持图库");
            [self pictureLibrary];
            //            [self presentViewController:picker animated:YES completion:nil];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请在设置-->隐私-->照片，中开启本应用的相机访问权限！！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"我知道了", nil];
            [alert show];
        }
    }else if (buttonIndex == 3){
        
    }
    
}
//跳转到imagePicker里
- (void)makePhoto
{
    NSLog(@"%s", __func__);
    _pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //[self presentViewController:_pickerController animated:YES completion:nil];
    [self jumpPhotoAction];
}
//跳转到相册
- (void)choosePicture
{
    _pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //[self presentViewController:pickerController animated:YES completion:nil];
    [self jumpPictureAction];
}
//跳转图库
- (void)pictureLibrary
{
    _pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //[self presentViewController:pickerController animated:YES completion:nil];
    [self jumpLibraryAction];
}
//用户取消退出picker时候调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"%@",picker);
    [_pickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//用户选中图片之后的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"%s,info == %@",__func__,info);
    
    UIImage *userImage = [self fixOrientation:[info objectForKey:@"UIImagePickerControllerOriginalImage"]];
    
    userImage = [self scaleImage:userImage toScale:0.3];
    
    //保存图片
    //    [self saveImage:userImage name:@"某个特定标示"];
    
    [_pickerController dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    [self.headIcon setImage:userImage];
    self.headIcon.contentMode = UIViewContentModeScaleAspectFill;
    self.headIcon.clipsToBounds = YES;
    //照片上传
    //[self upDateHeadIcon:userImage];
}

//- (void)upDateHeadIcon:(UIImage *)photo
//{
//    //两种方式上传头像
//    /*方式一：使用NSData数据流传图片*/
//    NSString *imageURl = @"";
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
//    [manager POST:imageURl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//
//        [formData appendPartWithFileData:UIImageJPEGRepresentation(photo, 1.0) name:@"text" fileName:@"test.jpg" mimeType:@"image/jpg"];
//
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//    }];
//    /*方式二：使用Base64字符串传图片*/
//    NSData *data = UIImageJPEGRepresentation(photo, 1.0);
//
//    NSString *pictureDataString=[data base64Encoding];
//    NSDictionary * dic  = @{@"verbId":@"modifyUserInfo",@"deviceType":@"ios",@"userId":@"",@"photo":pictureDataString,@"mobileTel":@""};
//    [manager POST:@"" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if ([[responseObject objectForKey:@"flag"] intValue] == 0) {
//
//        }else{
//
//        }
//    }
//          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          }];
//}
////保存照片到沙盒路径(保存)
//- (void)saveImage:(UIImage *)image name:(NSString *)iconName
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//    //写入文件
//    NSString *icomImage = iconName;
//    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", icomImage]];
//    // 保存文件的名称
//    //    [[self getDataByImage:image] writeToFile:filePath atomically:YES];
//    [UIImagePNGRepresentation(image)writeToFile: filePath  atomically:YES];
//}
//缩放图片
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"%@",NSStringFromCGSize(scaledImage.size));
    return scaledImage;
}
//修正照片方向(手机转90度方向拍照)
- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

#pragma mark - Block

- (void)addJumpPhotoAction:(actionBlock)block {
    self.jumpPhotoBlock = block;
}

- (void)jumpPhotoAction {
    if (self.jumpPhotoBlock) {
        self.jumpPhotoBlock();
    }
}

- (void)addJumpPictureAction:(actionBlock)block {
    self.jumpPictureBlock = block;
}

- (void)jumpPictureAction {
    if (self.jumpPictureBlock) {
        self.jumpPictureBlock();
    }
}

- (void)addJumpLibraryAction:(actionBlock)block {
    self.jumpLibraryBlock = block;
}

- (void)jumpLibraryAction {
    if (self.jumpLibraryBlock) {
        self.jumpLibraryBlock();
    }
}

- (void)addJumpAction:(actionBlock)block {
    self.jumpBlock = block;
}

- (void)jumpAction {
    if (self.jumpBlock) {
        self.jumpBlock();
    }
}

- (void)addAlertAction:(actionBlock)block {
    self.alertBlock = block;
}

- (void)alertAction {
    NSLog(@"%s", __func__);
    NSLog(@"%@", self.alertBlock);
    if (self.alertBlock) {
        self.alertBlock();
    }
}

- (void)test {
    NSLog(@"%s", __func__);
}
@end
