//
//  BaseOutputController.h
//  OutputCollect
//
//  Created by afro on 2017/7/28.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "BaseScrollViewController.h"

@class PYOption;
@interface BaseOutputController : BaseScrollViewController
@property(nonatomic, strong)UIView *contentView;
- (PYOption *)setupOutputOption;
@end
