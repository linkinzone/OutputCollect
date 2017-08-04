//
//  InvestNavTitleView.m
//  QZFinancial
//
//  Created by afro on 2017/4/12.
//  Copyright © 2017年 qifadai. All rights reserved.
//

#import "NavMenuBarView.h"
#import "Macros.h"
#import "UILabel+Font.h"
#import "UIImageView+Color.h"

#define indicatorViewHeight 2

@interface NavMenuBarView ()

@property(nonatomic, strong)UIImageView *indicatorView;
@property(nonatomic, assign)CGFloat menuItemWidth;
@property(nonatomic, strong)NSMutableArray *titleLabelArray;
@property(nonatomic, strong)UILabel *selectLabel;
@property(nonatomic, assign)CGFloat indicatorWidth;
@property(nonatomic, strong)UIImageView *bottomLineView;
@property(nonatomic, assign)BOOL isOnNavgationBar;
@end

@implementation NavMenuBarView

#pragma mark - 懒加载
- (UIImageView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [UIImageView imageViewWithColor:kThemeColor];
        [self addSubview:_indicatorView];
    }
    return _indicatorView;
}

- (UIImageView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIImageView imageViewWithColor:kLineColor];
        [self addSubview:_bottomLineView];
    }
    return _bottomLineView;
}

- (NSMutableArray *)titleLabelArray {
    if (!_titleLabelArray) {
        _titleLabelArray = [NSMutableArray array];
    }
    return _titleLabelArray;
}

#pragma mark - 构造函数
- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _titles = titles;
        self.frame = frame;
        self.menuItemWidth = kScreenWidth / titles.count;
        self.indicatorWidth = self.menuItemWidth - 20;
        [self addTitles];
    }
    return self;
}

#pragma mark - 构建UI
- (void)addTitles {
    
    // 标题
    for (int i = 0; i < self.titles.count; i++) {
        UILabel *titleLabel = [UILabel labelWithTextColor:kMenuLabelColor fontSize:14 text:self.titles[i]];
        titleLabel.frame = CGRectMake(i * self.menuItemWidth, 0, self.menuItemWidth, self.frame.size.height);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.tag = i;
        if (i == 0) {
            titleLabel.textColor = kThemeColor;
        }
        titleLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        [titleLabel addGestureRecognizer:tapGes];
        [self.titleLabelArray addObject:titleLabel];
        [self addSubview:titleLabel];
    }
    
    // 指示器
    CGFloat x = self.menuItemWidth * 0.5 - self.indicatorWidth * 0.5;
    CGFloat y = self.frame.size.height - indicatorViewHeight + 1;
    self.bottomLineView.frame = CGRectMake(0, self.frame.size.height, kScreenWidth, 1);
    self.indicatorView.frame = CGRectMake(x, y, self.indicatorWidth, indicatorViewHeight);
    
}

#pragma mark - 标题选中事件
- (void)titleClick:(UIGestureRecognizer *)tapGes {
    NSUInteger index = tapGes.view.tag;
    [self updateIndicatorPosition:index];
    
    if (_titleClickBlock) {
        _titleClickBlock(index);
    }
}

#pragma mark - 更新指示器位置
- (void)updateIndicatorPosition:(NSInteger)index {

    _selectLabel = self.titleLabelArray[index];
    _selectLabel.textColor = kThemeColor;
    
    for (UILabel *tempLabel in self.titleLabelArray) {
        if (tempLabel != _selectLabel) {
            tempLabel.textColor = kMenuLabelColor;
        }
    }
    
    [UIView animateWithDuration:0.2 delay:0.05 usingSpringWithDamping:0.5 initialSpringVelocity:25 options:UIViewAnimationOptionTransitionNone animations:^{
        
        self.indicatorView.center = CGPointMake(_selectLabel.center.x, self.frame.size.height - indicatorViewHeight + 2);
        
    } completion:nil];
    
}
@end
