//
//  Fab2OutputController.m
//  OutputCollect
//
//  Created by afro on 2017/7/28.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "Fab2OutputController.h"
#import "Macros.h"
#import "iOS-Echarts.h"

@interface Fab2OutputController ()

// 产量
@property(nonatomic, strong)PYZoomEchartsView *outputCTView;

@end

@implementation Fab2OutputController

- (PYZoomEchartsView *)outputCTView {
    if (!_outputCTView) {
        _outputCTView = [[PYZoomEchartsView alloc] init];
    }
    return _outputCTView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产量";
    
    [self setupOutputOption];
    
}

- (void)setupUI {
   
    [super setupUI];
    [self.contentView addSubview:self.outputCTView];
    [self.outputCTView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(250);
    }];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.outputCTView).offset(1500);
    }];
    [self.outputCTView setOption:[self setupOutputOption]];
    [self.outputCTView loadEcharts];
}

@end
