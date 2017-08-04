//
//  InvestNavTitleView.h
//  QZFinancial
//
//  Created by afro on 2017/4/12.
//  Copyright © 2017年 qifadai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavMenuBarView : UIView
@property(nonatomic, copy)void(^titleClickBlock)(NSUInteger index);
@property(nonatomic, strong)NSArray *titles;
- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame;
- (void)updateIndicatorPosition:(NSInteger)index;
@end
