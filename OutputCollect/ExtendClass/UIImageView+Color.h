//
//  UIImageView+UIColor.h
//  JRDemo
//
//  Created by afro on 2017/3/29.
//  Copyright © 2017年 afro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Color)

+ (UIImageView *)imageViewWithColor:(UIColor *)color;

+(UIImageView*)dashedLineImageViewWithColor:(UIColor*)color lineWidth:(CGFloat)lineWidth;

// color: 颜色，size: 虚线宽高，isHorizontal: 是否是横向
+ (UIImageView*)dashedLineImageViewWithColor:(UIColor *)color size:(CGSize)size isHorizontal:(BOOL)isHorizontal;
@end
