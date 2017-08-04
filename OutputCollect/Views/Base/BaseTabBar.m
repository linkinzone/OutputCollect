//
//  BaseTabBar.m
//  JRDemo
//
//  Created by afro on 2017/3/29.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "BaseTabBar.h"
#import "UIImage+Color.h"
#import "UIImageView+Color.h"
#import "Macros.h"

@interface BaseTabBar()
@property(nonatomic, strong)UIImageView *indicatorView;
@property(nonatomic, strong)UIImageView *tabBarBtnBackgroundView;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@end

@implementation BaseTabBar

- (UIImageView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [UIImageView imageViewWithColor:[UIColor orangeColor]];
        [self addSubview:_indicatorView];
    }
    return _indicatorView;
}

- (UIImageView *)tabBarBtnBackgroundView {
    if (!_tabBarBtnBackgroundView) {
        _tabBarBtnBackgroundView = [UIImageView imageViewWithColor:[UIColor orangeColor]];
        _tabBarBtnBackgroundView.alpha = 0.3;
        [self addSubview:_tabBarBtnBackgroundView];
    }
    return _tabBarBtnBackgroundView;
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
         [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
         [self setShadowImage:[UIImage imageWithColor:kLineColor]];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // [self setupIndicatorFrame];
    // [self setupTabBarButtonsFrame];
}

- (void)setupIndicatorFrame {
    _width = self.bounds.size.width / self.items.count;
    _height = self.bounds.size.height;
    // self.indicatorView.frame = CGRectMake(0, 0, _width, 2);
    // self.tabBarBtnBackgroundView.frame = CGRectMake(0, 0, _width, _height);
}

- (void)setupTabBarButtonsFrame {
    int i = 0;
    for (UIControl *btn in self.subviews) {
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [btn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(i * _width, 0, _width, _height);
            btn.tag = i;
            i++;
        }
    }
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    [UIView animateWithDuration:0.2 delay:0.05 usingSpringWithDamping:0.5 initialSpringVelocity:25 options:UIViewAnimationOptionTransitionNone animations:^{
        // self.tabBarBtnBackgroundView.frame = tabBarButton.frame;
        // self.indicatorView.frame = CGRectMake(tabBarButton.tag * _width, 0, _width, 2);
    } completion:nil];
}
@end
