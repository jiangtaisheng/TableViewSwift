//
//  TSBanner.m
//  TSRotatingBanner
//
//  Created by apple2015 on 16/8/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "TSBanner.h"
#import "UIImageView+WebCache.h"
@interface TSBanner () <UIScrollViewDelegate>
{
    UIScrollView    *_scrollView;
    UIPageControl   *_pageControl;
    
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImageView;
    NSArray *_imageNames; // 图片的url
    NSArray *_imageurls; // 图片的url
    NSTimer *_timer;
    CGSize _size; // Banner的大小
    NSInteger _curIndex; // 当前下标
}


@end
@implementation TSBanner

- (instancetype)initWithFrame:(CGRect)frame imageNames:(NSArray *)names ofCurrentPage:(NSInteger )index  imageHandle:(imageHandle)myBlock
{
    if (self=[super initWithFrame:frame]) {
        
        self.block=myBlock;
        _size = frame.size;
        _imageNames = names;
        _curIndex = index;
        // 创建UIScrollView
        [self instanceScrollView];
        
        // 创建UIPageContol
        [self instancePageControl];
    
        // 创建图片
        [self instanceImageViews];
        
        // 创建定时器
        [self instanceTimer];

        
    }
    

    return self;
}


- (instancetype)initWithFrame:(CGRect)frame imageURL:(NSArray *)urls ofCurrentPage:(NSInteger )index  imageHandle:(imageHandle)myBlock{
    if (self=[super initWithFrame:frame]) {
        
        self.block=myBlock;
        _size = frame.size;
        _imageurls = urls;
        _curIndex = index;
        // 创建UIScrollView
        [self instanceScrollView];
        
        // 创建UIPageContol
        [self instancePageControl];
        
        // 创建图片
        [self instanceImageViews];
        
        // 创建定时器
        [self instanceTimer];
        
        
    }
    
    
    return self;
}


- (void)instanceTimer
{
    // 开启定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
}
/**
 创建UIPageContol
 */
- (void)instancePageControl
{
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _size.height-30, _size.width, 30)];
    
    _pageControl.numberOfPages = _imageNames.count==0?_imageurls.count:_imageNames.count;
    
    _pageControl.enabled = NO;
    
    [self addSubview:_pageControl];
}

/**
 创建UIScrollView
 */
- (void)instanceScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    
    // 只有3屏
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width * 3, _scrollView.bounds.size.height);
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
    _scrollView.bounces = NO;
    
    [self addSubview:_scrollView];
    
    // 手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageHandle)];
    
    [_scrollView addGestureRecognizer:tap];
}


/**
 创建图片
 */
- (void)instanceImageViews
{
    for (int i = 0; i < 3; i++)
    {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.bounds.size.width * i, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        imageV.contentMode = UIViewContentModeScaleAspectFit;

        [_scrollView addSubview:imageV];
        
        if (_imageNames.count>0) {
            // 左边的图片
            if (0 == i)
            {
                NSInteger index = _curIndex>=1? _curIndex-1:_imageNames.count-1;
                imageV.image = [UIImage imageNamed:[_imageNames objectAtIndex:index]];
                _leftImageView = imageV;
            }
            // 中间的图片
            else if (1 == i)
            {
                imageV.image = [UIImage imageNamed:[_imageNames objectAtIndex:_curIndex]];
                _centerImageView = imageV;
            }
            // 右边的图片
            else
            {
                NSInteger index = _curIndex<_imageurls.count-1? _curIndex+1:0;
                imageV.image = [UIImage imageNamed:[_imageNames objectAtIndex:index]];
                _rightImageView = imageV;
            }

        }else if (_imageurls.count>0){
        
            // 左边的图片
            if (0 == i)
            {
                NSInteger index = _curIndex>=1? _curIndex-1:_imageurls.count-1;
                [imageV sd_setImageWithURL:[NSURL URLWithString:[_imageurls objectAtIndex:index]] placeholderImage:[UIImage imageNamed:@"1"]];
                _leftImageView = imageV;
            }
            // 中间的图片
            else if (1 == i)
            {
                [imageV sd_setImageWithURL:[NSURL URLWithString:[_imageurls  objectAtIndex:_curIndex]] placeholderImage:[UIImage imageNamed:@"1"]];
                _centerImageView = imageV;
            }
            // 右边的图片
            else
            {
                NSInteger index = _curIndex<_imageurls.count-1? _curIndex+1:0;
                [imageV sd_setImageWithURL:[NSURL URLWithString:[_imageurls objectAtIndex:index]] placeholderImage:[UIImage imageNamed:@"1"]];
                _rightImageView = imageV;
            }

        
        }
        
 
    }
    
    // 设置偏移，偏移到中间那张图
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width, 0) animated:NO];
}

/**
 自动滚屏
 */
- (void)autoScroll
{
    // 让scrollView显示在第下一个位置
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*2, 0) animated:YES];
    
    [self reloadImage];
}

/**
 刷新图片
 */
- (void)reloadImage
{
    CGFloat offsetX = _scrollView.contentOffset.x;    
    NSInteger  count=0;
    if (_imageNames.count>0) {
        count=_imageNames.count;
    }else if (_imageurls.count>0){
        count=_imageurls.count;
    }
    
    // 右边在滑动
    if (offsetX > _size.width)
    {
        _curIndex = (_curIndex + 1) % count;
    }
    // 左边在滑动
    else if (offsetX < _size.width)
    {
        _curIndex = (_curIndex + count - 1) % count;
    }
    
    // 左边的图片下标
    NSInteger leftCount = (_curIndex + count - 1) % count;
    
    // 右边的图片下标
    NSInteger rightCount = (_curIndex + 1) % count;
    
    if (_imageNames.count>0) {
        _leftImageView.image = [UIImage imageNamed:_imageNames[leftCount]];
        
        _centerImageView.image = [UIImage imageNamed:_imageNames[_curIndex]];
        
        _rightImageView.image = [UIImage imageNamed:_imageNames[rightCount]];

    }else if (_imageurls.count>0){
    
    
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageurls[leftCount]] placeholderImage:[UIImage imageNamed:@"1"]];

        [_centerImageView sd_setImageWithURL:[NSURL URLWithString:_imageurls[_curIndex]] placeholderImage:[UIImage imageNamed:@"1"]];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageurls[rightCount]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    }
 
}


- (void)imageHandle
{

    if (self.block) {
        
        self.block(_curIndex);
    }
    

}

// 调整scrollView位置
- (void)changePosition
{
    // 交换ImgageView的位置
    [self reloadImage];
    
    _pageControl.currentPage = _curIndex;
    
    // 让scrollView始终显示在第1个位置
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width, 0) animated:NO];
}

#pragma mark - UIScrollView的代理

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self changePosition];
    // 重新启动定时器
    [self instanceTimer];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 销毁定时器
    [_timer invalidate];
    
}

// 当代码 自动滚动到想要的位置  设置setContentOffset时调用，手势滑动不会调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self changePosition];
}

@end
