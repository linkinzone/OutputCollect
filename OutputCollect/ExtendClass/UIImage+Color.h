//
//  UIImage+UIColor.h
//  JRDemo
//
//  Created by afro on 2017/3/29.
//  Copyright © 2017年 afro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+(UIImage*)imageWithColor:(UIColor *)color;
+(UIImage*)dashedLineImageWithColor:(UIColor*)color lineWidth:(CGFloat)lineWidth;
+ (UIImage*)dashedLineImageWithColor:(UIColor *)color size:(CGSize)size isHorizontal:(BOOL)isHorizontal;
@end
