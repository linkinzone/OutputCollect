//
//  UILabel+Font.h
//  QZFinancial
//
//  Created by afro on 2017/4/6.
//  Copyright © 2017年 qifadai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Font)

+ (UILabel *)labelWithTextColor:(UIColor *)color fontSize:(CGFloat)fontSize text:(NSString *)text;

-(CGRect)textHeight:(CGSize)frameSize;
+(CGRect)textHeightWithText:(NSString*)text size:(CGSize)frameSize font:(UIFont*)font;

@end
