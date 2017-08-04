//
//  BaseViewController.m
//  QZFinancial
//
//  Created by afro on 2017/4/7.
//  Copyright © 2017年 qifadai. All rights reserved.
//

#import "BaseViewController.h"
#import "Macros.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //自定义返回按钮图片
    UIImage *backIndicatorImage = [UIImage imageNamed:@"fanhui"];
    [backIndicatorImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = backIndicatorImage;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backIndicatorImage;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -200) forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:kMenuLabelColor}];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI {
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

@end
