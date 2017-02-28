//
//  LGHYScrollViewController.m
//  龙广会员
//
//  Created by 王宏达 on 17/1/11.
//  Copyright © 2017年 王宏达. All rights reserved.
//

#import "LGHYScrollViewController.h"

@interface LGHYScrollViewController ()<UIScrollViewDelegate>
{
    NSInteger _index;
}
@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) UIPageControl * pageControl;

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation LGHYScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = self.view.bounds.size.width;
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 200)];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    //    scrollView.contentSize = CGSizeMake(width * 5, 300);
    //如果size值为0，默认是scroll.bounds的宽高
    
    scrollView.contentSize = CGSizeMake(width * 5, 0);
    
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    for (NSInteger i = 0; i < 5; i++) {
        
        NSString * imageName = [NSString stringWithFormat:@"0%ld.jpg",i+1];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * width, 0, width, 300);
        [scrollView addSubview:imageView];
    }
    
    
    //分页控件
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    //分页页数
    pageControl.numberOfPages = 5;
    //当前页数
    //copageControl.currentPage = 0;
    //如果仅有一页，隐藏pageControl
    pageControl.hidesForSinglePage = YES;
    //根据页数获取UIPageControl的大小
    CGSize pageControlSize = [pageControl sizeForNumberOfPages:5];
    
    pageControl.center = CGPointMake(width/2, 300 - (pageControlSize.height + 10)/2);
    pageControl.bounds = (CGRect){CGPointZero,pageControlSize};
    
    //设置未选中指示点的颜色
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    //设置当前指示点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    [pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventEditingChanged];
    
    //pageControl需加到scrollView的父视图上
    [self.view addSubview:pageControl];
    
    self.pageControl = pageControl;
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
    
    self.timer = timer;
    
    //马上开始
    [self.timer fire];
    
}

- (void)timeFire {
    
    
    if (_index == 5) {
        
        _index = 0;
        
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        //        [self.scrollView scrollRectToVisible:CGRectMake(0 , 0, self.scrollView.bounds.size.width, 300) animated:YES];
        
        
    } else {
        
        
        [self.scrollView setContentOffset:CGPointMake(_index * self.scrollView.bounds.size.width, 0) animated:YES];
        
    }
    
    _index ++;
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger currentIndex = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    self.pageControl.currentPage = currentIndex;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
    //停止
    [self.timer invalidate];
    
    self.timer = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
}

- (void)pageAction:(UIPageControl*)pageControl {
    NSInteger currentPage = pageControl.currentPage;
    
    [self.scrollView setContentOffset:CGPointMake((currentPage + 1) * self.scrollView.bounds.size.width, 0) animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
