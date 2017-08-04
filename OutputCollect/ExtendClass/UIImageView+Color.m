//
//  UIImageView+UIColor.m
//  JRDemo
//
//  Created by afro on 2017/3/29.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "UIImageView+Color.h"
#import "UIImage+Color.h"

@implementation UIImageView (Color)

+ (UIImageView *)imageViewWithColor:(UIColor *)color {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageWithColor:color];
    return imageView;
}

+(UIImageView*)dashedLineImageViewWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth
{
    UIImageView* imageView = [[UIImageView alloc] init];
    //    imageView.image = [UIImage dashedLineImageWithColor:color lineWidth:lineWidth];
    imageView.image = [UIImage dashedLineImageWithColor:color size:CGSizeMake(lineWidth, 1) isHorizontal:YES];
    return imageView;
}

+(UIImageView*)dashedLineImageViewWithColor:(UIColor *)color size:(CGSize)size isHorizontal:(BOOL)isHorizontal
{
    UIImageView* imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage dashedLineImageWithColor:color size:size isHorizontal:isHorizontal];
    return imageView;
}
@end
