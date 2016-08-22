//
//  TSBanner.h
//  TSRotatingBanner
//
//  Created by apple2015 on 16/8/10.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^imageHandle)(NSInteger tag);
@interface TSBanner : UIView

@property(nonatomic,copy)imageHandle  block;

//展示本地图片
- (instancetype)initWithFrame:(CGRect)frame imageNames:(NSArray *)names ofCurrentPage:(NSInteger )index imageHandle:(imageHandle)myBlock;
//展示网络图片
- (instancetype)initWithFrame:(CGRect)frame imageURL:(NSArray *)urls ofCurrentPage:(NSInteger )index imageHandle:(imageHandle)myBlock;
@end
