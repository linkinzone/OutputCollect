//
//  BaseViewController.h
//  QZFinancial
//
//  Created by Yinjw on 2016/10/13.
//  Copyright © 2016年 Yinjw. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseScrollViewController : BaseViewController

@property(nonatomic, strong)UITableView *baseTableView;
@property(nonatomic, strong)UIScrollView *baseScrollView;
@property(nonatomic, assign)BOOL refreshEnable;
@property(nonatomic, assign)BOOL scrollViewFooterRefreshEnable;
@property(nonatomic, copy)void(^getNewDataBlock)(void);
@property(nonatomic, copy)void(^getMoreDataBlock)(void);

@end
