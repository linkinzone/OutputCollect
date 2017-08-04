//
//  RootController.m
//  JRDemo
//
//  Created by afro on 2017/3/22.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "RootTabBarController.h"
#import "IndexController.h"
#import "OutputController.h"
#import "EfficiencyController.h"
#import "UserController.h"
#import "BaseTabBar.h"
#import "BaseNavigationController.h"
#import "Macros.h"

@interface RootTabBarController ()

@property(nonatomic, strong)IndexController *indexController;
@property(nonatomic, strong)OutputController *outputController;
@property(nonatomic, strong)EfficiencyController *efficiencyController;
@property(nonatomic, strong)UserController *userController;

@end

@implementation RootTabBarController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    BaseTabBar *tabBar = [[BaseTabBar alloc] initWithFrame:self.tabBar.frame];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    self.tabBar.tintColor = kColorWithHex(0xff2b3d);
    
    _indexController = [[IndexController alloc] init];
    _outputController = [[OutputController alloc] init];
    _efficiencyController = [[EfficiencyController alloc] init];
    _userController = [[UserController alloc] init];
    
    [self packagingNavgationController:_indexController title:@"首页" imageName:@"home" selectImageName:@"home-xuanzhong"];
    [self packagingNavgationController:_outputController title:@"产量" imageName:@"tz" selectImageName:@"touzi-xuanzhong"];
    [self packagingNavgationController:_efficiencyController title:@"效率" imageName:@"faxian" selectImageName:@"faxian-xuanzhong"];
    [self packagingNavgationController:_userController title:@"账户" imageName:@"zhanghu" selectImageName:@"zhanghu-xuanzhong"];
}

- (void)packagingNavgationController:(UIViewController *)viewController
                               title:(NSString *)title
                           imageName:(NSString *)imageName
                     selectImageName:(NSString *)selectImageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectImage];
    BaseNavigationController *navc = [[BaseNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navc];
}

@end
