//
//  ViewController.m
//  OutputCollect
//
//  Created by afro on 2017/7/25.
//  Copyright © 2017年 afro. All rights reserved.
//

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "ViewController.h"
#import "iOS-Echarts.h"
#import "Masonry.h"

@interface ViewController ()
@property(nonatomic, strong)PYZoomEchartsView *kEchartView;
@end

@implementation ViewController

- (PYZoomEchartsView *)kEchartView {
    if (!_kEchartView) {
        _kEchartView = [[PYZoomEchartsView alloc] init];
        [self.view addSubview:_kEchartView];
    }
    return _kEchartView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"折线图";
    
    [self.kEchartView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
        make.height.equalTo(300);
    }];
    
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"宁晋电池产出比例各车间综合数据趋势图")
            .textStyle.fontSizeEqual(@16);
            title.xEqual(PYPositionCenter).yEqual(PYPositionTop);
            
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@90).yEqual(@50);
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                textStyle.fontSizeEqual(@8);
            }]);
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"156SK-PR2",@"156SK-PR硼",@"156SK-PR",@"156MK-RE",
                               @"156MK-C5-4BB",@"156MK-C6-5BB",@"156MK-JG-4BB",@"156MK-JG-5BB"]);
            legend.textStyle.fontSizeEqual(@8);
            legend.xEqual(PYPositionRight);
            legend.yEqual(PYPositionCenter);
            legend.orientEqual(PYOrientVertical);
            legend.itemWidthEqual(@10);
        }])
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@YES)
            .addDataArr(@[@"07-21",@"07-22",@"07-23",@"07-24"])
            .axisLine.lineStyle.widthEqual(@1.5);
            axis.splitLine.showEqual(NO);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue).boundaryGapEqual(@NO)
            .minEqual(@0.0)
            .maxEqual(@100.0)
            .splitNumberEqual(@4)
            .axisLabelEqual([PYAxisLabel initPYAxisLabelWithBlock:^(PYAxisLabel *axisLabel) {
                axisLabel.formatterEqual(@"{value} %");
            }])
            .axisLine.lineStyle.widthEqual(@1.5);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR2")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(96.79),@(84.66),@(85.30),@(92.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR硼")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(85.79),@(74.66),@(95.30),@(72.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(93.79),@(84.66),@(85.30),@(92.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-RE")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(70.79),@(94.66),@(75.30),@(82.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C5-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(92.79),@(84.66),@(95.30),@(92.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C6-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(95.79),@(94.66),@(95.30),@(82.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(88.79),@(94.66),@(85.30),@(72.36)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(91.79),@(74.66),@(85.30),@(92.36)]);
        }]);
    }];
    
    [self.kEchartView setOption:option];
    [self.kEchartView loadEcharts];
}



@end
