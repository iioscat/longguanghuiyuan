//
//  LGHYQianDaoViewController.m
//  龙广会员
//
//  Created by 王宏达 on 17/2/10.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYQianDaoViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "QRCodeReaderViewController.h"
#import "LGAlertView.h"
#import "MCAudioInputQueue.h"
#import "AVAudioPlayer+PCM.h"
#import <AVFoundation/AVAudioSession.h>
#import "LGHYHDNavigationViewController.h"
#import "AFNetworking.h"

#define wid [UIScreen mainScreen].bounds.size.width
static const NSTimeInterval bufferDuration = 0.2;

@interface LGHYQianDaoViewController ()<QRCodeReaderDelegate, LGAlertViewDelegate, MCAudioInputQueueDelegate>
{
    @private
    AudioStreamBasicDescription _format;
    BOOL _inited;
    
    MCAudioInputQueue *_recorder;
    BOOL _started;
    
    NSMutableData *_data;
    AVAudioPlayer *_player;
        
}
@property (nonatomic, strong)UIButton *btn1;
@property (nonatomic, strong)UIButton *btn2;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UILabel *labelOfView1;
@property (nonatomic, strong)UILabel *labelOfView2;

@property (nonatomic, strong)UIButton *btn1OfView2;
@property (nonatomic, strong)UIButton *btn2OfView2;
@property (nonatomic, strong)UIButton *btn3OfView2;
@property (nonatomic, strong)UIButton *btn4OfView2;

@property (nonatomic, strong)UIButton *btn1OfView1;
@property (nonatomic, strong)UIButton *btn2OfView1;

@end

@implementation LGHYQianDaoViewController

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.backgroundColor = [UIColor grayColor];
        [_btn1 setTitle:@"活动签到" forState:UIControlStateNormal];
        //[_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btn1DoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.backgroundColor = [UIColor grayColor];
        [_btn2 setTitle:@"节目签到" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn2 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(btn2DoAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        //_view1.backgroundColor = [UIColor orangeColor];
    }
    return _view1;
}

- (UILabel *)labelOfView1 {
    if (!_labelOfView1) {
        _labelOfView1 = [[UILabel alloc] init];
        //_labelOfView1.backgroundColor = [UIColor grayColor];
        _labelOfView1.text = @"活动签到";
        _labelOfView1.font = [UIFont boldSystemFontOfSize:25];
        _labelOfView1.textAlignment = NSTextAlignmentCenter;
        _labelOfView1.textColor = [UIColor grayColor];
    }
    return _labelOfView1;
}

- (UILabel *)labelOfView2 {
    if (!_labelOfView2) {
        _labelOfView2 = [[UILabel alloc] init];
        _labelOfView2.text = @"节目签到";
        _labelOfView2.textAlignment = NSTextAlignmentCenter;
        _labelOfView2.textColor = [UIColor grayColor];
        _labelOfView2.font = [UIFont boldSystemFontOfSize:25];
        //_labelOfView2.backgroundColor = [UIColor redColor];
    }
    return _labelOfView2;
}

- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] init];
        //_view2.backgroundColor = [UIColor redColor];
    }
    return _view2;
}

- (UIButton *)btn1OfView2 {
    if (!_btn1OfView2) {
        _btn1OfView2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1OfView2 setTitle:@"录音签到" forState:UIControlStateNormal];
        [_btn1OfView2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn1OfView2.layer.cornerRadius = 5.0f;
        _btn1OfView2.layer.masksToBounds = YES;
        //[_btn1OfView2 addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btn1OfView2 addTarget:self action:@selector(startOrStop:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1OfView2;
}

- (UIButton *)btn2OfView2 {
    if (!_btn2OfView2) {
        _btn2OfView2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2OfView2 setTitle:@"结束录音" forState:UIControlStateNormal];
        [_btn2OfView2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn2OfView2.layer.cornerRadius = 5.0f;
        _btn2OfView2.layer.masksToBounds = YES;
        [_btn2OfView2 addTarget:self action:@selector(stopCH1Recording:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn2OfView2;
}

- (UIButton *)btn3OfView2 {
    if (!_btn3OfView2) {
        _btn3OfView2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn3OfView2 setTitle:@"开始播放" forState:UIControlStateNormal];
        [_btn3OfView2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn3OfView2.layer.cornerRadius = 5.0f;
        _btn3OfView2.layer.masksToBounds = YES;
        [_btn3OfView2 addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn3OfView2;
}

- (UIButton *)btn4OfView2 {
    if (!_btn4OfView2) {
        _btn4OfView2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn4OfView2 setTitle:@"结束播放" forState:UIControlStateNormal];
        [_btn4OfView2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn4OfView2.layer.cornerRadius = 5.0f;
        _btn4OfView2.layer.masksToBounds = YES;
        [_btn4OfView2 addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn4OfView2;
}

#pragma mark - btn1OfView1
- (UIButton *)btn1OfView1 {
    if (!_btn1OfView1) {
        _btn1OfView1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1OfView1 setTitle:@"活动码签到" forState:UIControlStateNormal];
        [_btn1OfView1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn1OfView1.layer.cornerRadius = 5.0f;
        _btn1OfView1.layer.masksToBounds = YES;
        [_btn1OfView1 addTarget:self action:@selector(numberAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1OfView1;
}

- (UIButton *)btn2OfView1 {
    if (!_btn2OfView1) {
        _btn2OfView1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2OfView1 setTitle:@"扫描二维码签到" forState:UIControlStateNormal];
        [_btn2OfView1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
        _btn2OfView1.layer.cornerRadius = 5.0f;
        _btn2OfView1.layer.masksToBounds = YES;
        [_btn2OfView1 addTarget:self action:@selector(scanAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2OfView1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"签到";
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    [self showBtn];
    [self showView2];
    [self showView1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doAction:(UIButton *)btn {
    NSLog(@"test");
}

- (void)showBtn {
    [self.view addSubview:self.btn1];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.top.equalTo(@63);
        make.width.equalTo(@(wid/2));
        make.height.equalTo(@40);
    }];
    
    [self.view addSubview:self.btn2];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn1.mas_right).with.offset(0);
        make.top.equalTo(self.view).with.offset(63);
        make.right.equalTo(self.view).with.offset(0);
        make.height.equalTo(@40);
    }];
    
}

- (void)showView1 {
    
    [self.view addSubview:self.view1];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
    }];
    [self.view1 addSubview:self.labelOfView1];
    [self.labelOfView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view1).with.offset(0);
        make.top.equalTo(self.view1).with.offset(2);
        make.width.equalTo(@(wid));
    }];
    
    [self.view1 addSubview:self.btn1OfView1];
    [self.btn1OfView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelOfView1.mas_bottom).with.offset(5);
        make.left.equalTo(self.view1).with.offset(5);
        make.right.equalTo(self.view1).with.offset(-5);
        make.height.equalTo(@44);
    }];
    
    [self.view1 addSubview:self.btn2OfView1];
    [self.btn2OfView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1OfView1.mas_bottom).with.offset(20);
        make.left.equalTo(self.view1).with.offset(5);
        make.right.equalTo(self.view1).with.offset(-5);
        make.height.equalTo(@44);
    }];


}

- (void)showView2 {
    [self.view addSubview:self.view2];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:[[LGHYHDNavigationViewController alloc] initWithRootViewController:vc]];
}

- (void)btn1DoAction:(UIButton *)btn {
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];

    self.view2.hidden = YES;
    self.view1.hidden = NO;
}

- (void)btn2DoAction:(UIButton *)btn {
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"BtnImage.jpg"] forState:UIControlStateNormal];
    [self.view2 addSubview:self.labelOfView2];
    [self.labelOfView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom).with.offset(2);
        make.width.equalTo(@(wid));
        make.height.equalTo(@30);
    }];
    
    [self.view2 addSubview:self.btn1OfView2];
    [self.btn1OfView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelOfView2.mas_bottom).with.offset(5);
        make.left.equalTo(self.view2).with.offset(5);
        make.right.equalTo(self.view2).with.offset(-5);
        make.height.equalTo(@44);
    }];
    
    [self.view2 addSubview:self.btn2OfView2];
    [self.btn2OfView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1OfView2.mas_bottom).with.offset(20);
        make.left.equalTo(self.view2).with.offset(5);
        make.right.equalTo(self.view2).with.offset(-5);
        make.height.equalTo(@35);
    }];
    
    [self.view2 addSubview:self.btn3OfView2];
    [self.btn3OfView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn2OfView2.mas_bottom).with.offset(20);
        make.left.equalTo(self.view2).with.offset(5);
        make.right.equalTo(self.view2).with.offset(-5);
        make.height.equalTo(@35);
    }];
    
    [self.view2 addSubview:self.btn4OfView2];
    [self.btn4OfView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn3OfView2.mas_bottom).with.offset(20);
        make.left.equalTo(self.view2).with.offset(5);
        make.right.equalTo(self.view2).with.offset(-5);
        make.height.equalTo(@35);
    }];
    
    self.view1.hidden = YES;
    [self showView2];
    self.view2.hidden = NO;
}

#pragma mark - scanAction

- (IBAction)scanAction:(id)sender
{
    QRCodeReaderViewController *reader = [QRCodeReaderViewController new];
    reader.modalPresentationStyle = UIModalPresentationFormSheet;
    reader.delegate = self;
    
    __weak typeof (self) wSelf = self;
    [reader setCompletionWithBlock:^(NSString *resultAsString) {
        [wSelf.navigationController popViewControllerAnimated:YES];
        [[[UIAlertView alloc] initWithTitle:@"" message:resultAsString delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil] show];
    }];
    
//     [self presentViewController:reader animated:YES completion:NULL];
    [self.navigationController pushViewController:reader animated:YES];
}

#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - numberAction
- (void)numberAction:(UIButton *)button {
    LGAlertView *alertView = [[LGAlertView alloc] initWithTextFieldsAndTitle:@"输入活动码" message:nil numberOfTextFields:1 textFieldsSetupHandler:nil buttonTitles:@[@"确认"] cancelButtonTitle:@"取消" destructiveButtonTitle:nil delegate:nil];
    alertView.delegate = self;
    [alertView showAnimated];
}

- (void)alertView:(LGAlertView *)alertView buttonPressedWithTitle:(NSString *)title index:(NSUInteger)index {
    if (index == 0) {
        [self signInCode];
    }
}


- (void)signInCode {
    [SVProgressHUD show];
    AFHTTPSessionManager *sesszion = [AFHTTPSessionManager manager];
    sesszion.requestSerializer = [AFHTTPRequestSerializer serializer];
    sesszion.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = @"http://221.212.177.245/project/sign-in?code=10000";
    
    [sesszion GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataString);
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 如果是取消了任务，就不算请求失败，就直接返回
        if (error.code == NSURLErrorCancelled) return;
        
        if (error.code == NSURLErrorTimedOut) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试！"];
        } else {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        }

    }];
}

#pragma mark - init & dealloc
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self)
        {
            [self _commonInit];
        }
        return self;
    }
    
- (void)awakeFromNib
    {
        [super awakeFromNib];
        
        [self _commonInit];
    }
    
- (void)_commonInit
    {
        if (_inited)
        {
            return;
        }
        
        _inited = YES;
        
        _format.mFormatID = kAudioFormatLinearPCM;
        _format.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked;
        _format.mBitsPerChannel = 16;
        _format.mChannelsPerFrame = 2;
        _format.mBytesPerPacket = _format.mBytesPerFrame = (_format.mBitsPerChannel / 8) * _format.mChannelsPerFrame;
        _format.mFramesPerPacket = 1;
        _format.mSampleRate = 8000.0f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_interrupted:) name:AVAudioSessionInterruptionNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_interrupted:) name:AVAudioSessionRouteChangeNotification object:nil];
        
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
    }
    
- (void)dealloc
    {
        [_recorder stop];
        [_player stop];
        
        [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    
#pragma mark - ui actions
- (void)startOrStop:(UIButton *)button
    {
        if (_started)
        {
            [self _stopRecord];
        }
        else
        {
            [self _startRecord];
        }
    }
    
- (void)play:(UIButton *)btn
    {
        [self _play];
    }
    
- (void)_refreshUI
    {
        if (_started)
        {
            [self.btn1OfView2 setTitle:@"Stop" forState:UIControlStateNormal];
        }
        else
        {
            [self.btn1OfView2 setTitle:@"Start" forState:UIControlStateNormal];
        }
        
        self.btn3OfView2.enabled = !_started && _data.length > 0;
    }
    
#pragma mark - play
- (void)_play
    {
        [_player stop];
        _player = [[AVAudioPlayer alloc] initWithPcmData:_data pcmFormat:_format error:nil];
        [_player play];
    }
    
#pragma mark - record
- (void)_startRecord
    {
        if (_started)
        {
            return;
        }
        
        [_player stop];
        _started = YES;
        
        _data = [NSMutableData data];
        _recorder = [MCAudioInputQueue inputQueueWithFormat:_format bufferDuration:bufferDuration delegate:self];
        _recorder.meteringEnabled = YES;
        [_recorder start];
        
        [self _refreshUI];
    }
    
- (void)_stopRecord
    {
        if (!_started)
        {
            return;
        }
        
        _started = NO;
        
        [_recorder stop];
        _recorder = nil;
        
        [self _refreshUI];
    }
    
#pragma mark - interrupt
- (void)_interrupted:(NSNotification *)notification
    {
        [self _stopRecord];
        [_player stop];
    }
    
#pragma mark - inputqueue delegate
- (void)inputQueue:(MCAudioInputQueue *)inputQueue inputData:(NSData *)data numberOfPackets:(UInt32)numberOfPackets
    {
        if (data)
        {
            [_data appendData:data];
        }
        
        [inputQueue updateMeters];
        NSLog(@"channel 0 averagePower = %lf, peakPower = %lf",[inputQueue averagePowerForChannel:0],[inputQueue peakPowerForChannel:0]);
        NSLog(@"channel 1 averagePower = %lf, peakPower = %lf",[inputQueue averagePowerForChannel:1],[inputQueue peakPowerForChannel:1]);
        
        double duration = _data.length / _recorder.bufferSize * _recorder.bufferDuration;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *durationString = [NSString stringWithFormat:@"duration = %.1lfs",duration];
            //self.durationLabel.text = durationString;
        });
    }
    
- (void)inputQueue:(MCAudioInputQueue *)inputQueue errorOccur:(NSError *)error
    {
        [self _stopRecord];
    }



@end
