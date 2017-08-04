//
//  UILabel+Font.m
//  QZFinancial
//
//  Created by afro on 2017/4/6.
//  Copyright © 2017年 qifadai. All rights reserved.
//

#import "UILabel+Font.h"

@implementation UILabel (Font)

+ (UILabel *)labelWithTextColor:(UIColor *)color fontSize:(CGFloat)fontSize text:(NSString *)text {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    
    return label;
}


-(CGRect)textHeight:(CGSize)frameSize
{
    CGRect realRect = [self.text boundingRectWithSize:CGSizeMake(frameSize.width, frameSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    return realRect;
}

+(CGRect)textHeightWithText:(NSString *)text size:(CGSize)frameSize font:(UIFont *)font
{
    CGRect realRect = [text boundingRectWithSize:CGSizeMake(frameSize.width, frameSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return realRect;
}

@end
