//
//  OutputController.m
//  OutputCollect
//
//  Created by afro on 2017/7/28.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "OutputController.h"
#import "NavMenuBarView.h"
#import "Macros.h"

#import "Fab2OutputController.h"
#import "Fab3OutputController.h"
#import "Fab4OutputController.h"
#import "Fab5OutputController.h"
#import "Fab6OutputController.h"

@interface OutputController ()<UIScrollViewDelegate>
@property(nonatomic, strong)NavMenuBarView *menuBarView;
@property(nonatomic, strong)Fab2OutputController *fab2outputVC;
@property(nonatomic, strong)Fab3OutputController *fab3outputVC;
@property(nonatomic, strong)Fab4OutputController *fab4outputVC;
@property(nonatomic, strong)Fab5OutputController *fab5outputVC;
@property(nonatomic, strong)Fab6OutputController *fab6outputVC;
@property(nonatomic, strong)UIViewController *selectController;
@end

@implementation OutputController

- (NavMenuBarView *)menuBarView {
    if (!_menuBarView) {
        NSArray *titleArray = @[@"Fab2",@"Fab3",@"Fab4",@"Fab5",@"Fab6"];
        _menuBarView = [[NavMenuBarView alloc] initWithTitles:titleArray frame:CGRectMake(0, 0, kScreenWidth, 44)];
    }
    return _menuBarView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavagationBar];
    
    [self customActions];
}

- (void)setupUI {
    
    self.baseScrollView.delegate = self;
    self.baseScrollView.pagingEnabled = YES;
    self.baseScrollView.showsHorizontalScrollIndicator = NO;
    self.baseScrollView.bounces = NO;
    self.baseScrollView.backgroundColor = kViewBackColor;
    self.baseScrollView.contentSize = CGSizeMake(0, 0);
    [self.baseScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _fab2outputVC = [[Fab2OutputController alloc] init];
    _fab3outputVC = [[Fab3OutputController alloc] init];
    _fab4outputVC = [[Fab4OutputController alloc] init];
    _fab5outputVC = [[Fab5OutputController alloc] init];
    _fab6outputVC = [[Fab6OutputController alloc] init];
    
    [self addChildViewController:_fab2outputVC];
    [self addChildViewController:_fab3outputVC];
    [self addChildViewController:_fab4outputVC];
    [self addChildViewController:_fab5outputVC];
    [self addChildViewController:_fab6outputVC];
    
    if (self.childViewControllers.count > 0) {
        for (int i = 0; i < self.childViewControllers.count; i++) {
            self.selectController = self.childViewControllers[i];
            self.selectController.view.frame = CGRectMake(i * kScreenWidth, 0, 0, 0);
            [self.baseScrollView addSubview:self.selectController.view];
        }
        self.baseScrollView.contentSize = CGSizeMake(self.childViewControllers.count * kScreenWidth, 0);
    }
}

- (void)setupNavagationBar {
    // 移除导航栏左右两侧的按钮,titleView 贴边显示
    UIBarButtonItem *spaceBarBtn = [[UIBarButtonItem alloc] initWithCustomView:[[UIButton alloc] init]];;
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil action:nil];
    spaceItem.width = -26;
    self.navigationItem.leftBarButtonItems = @[spaceItem,spaceBarBtn];
    self.navigationItem.rightBarButtonItems = @[spaceItem,spaceBarBtn];
    self.navigationItem.titleView = self.menuBarView;
}

#pragma mark - customActions
- (void)customActions {
    kWeakSelf(self)
    self.menuBarView.titleClickBlock = ^(NSUInteger index) {
        [weakself.baseScrollView setContentOffset:CGPointMake(index * kScreenWidth, 0) animated:NO];
    };
}

#pragma mark - delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger index = (scrollView.contentOffset.x + 0.5 * kScreenWidth)/kScreenWidth;
    [self.menuBarView updateIndicatorPosition:index];
}
@end
