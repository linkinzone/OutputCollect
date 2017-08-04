//
//  BaseViewController.m
//  QZFinancial
//
//  Created by Yinjw on 2016/10/13.
//  Copyright © 2016年 Yinjw. All rights reserved.
//

#import "BaseScrollViewController.h"
#import "Macros.h"

@interface BaseScrollViewController ()

@end

@implementation BaseScrollViewController

- (UITableView *)baseTableView {
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _baseTableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_baseTableView];
    }
    return _baseTableView;
}

- (UIScrollView *)baseScrollView {
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] init];
        [self.view addSubview:_baseScrollView];
    }
    return _baseScrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)getNewData {
 
}

- (void)getMoreData {

}


@end
