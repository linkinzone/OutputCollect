//
//  UIImage+UIColor.m
//  JRDemo
//
//  Created by afro on 2017/3/29.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)dashedLineImageWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth
{
    UIImage *image = [[UIImage alloc] init];
    CGSize size = CGSizeMake(lineWidth, 1);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    CGContextRef ctRef = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(ctRef, kCGLineCapRound);
    CGContextSetLineWidth(ctRef, size.height);    //线宽
    CGContextSetAllowsAntialiasing(ctRef, YES);
    CGContextSetStrokeColorWithColor(ctRef, color.CGColor);
    CGFloat lengths[2] = {3};
    CGContextSetLineDash(ctRef, 0, lengths, 1);         //画虚线
    CGContextMoveToPoint(ctRef, 0.0, 0.0);              //开始画线
    CGContextAddLineToPoint(ctRef, size.width, 0.0);
    CGContextStrokePath(ctRef);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

+ (UIImage*)dashedLineImageWithColor:(UIColor *)color size:(CGSize)size isHorizontal:(BOOL)isHorizontal {
    UIImage *image = [[UIImage alloc] init];
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context,1);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    if (isHorizontal) {
        CGFloat lengths[] = {6,3};
        CGContextSetLineDash(context, 0, lengths,2);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, size.width, 0.0);
    } else {
        CGFloat lengths[] = {15,15};
        CGContextSetLineDash(context, 0, lengths,2);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0,size.height);
    }
    CGContextStrokePath(context);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}
@end
