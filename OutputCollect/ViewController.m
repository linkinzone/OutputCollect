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

@property(nonatomic, strong)UIScrollView *scrollView;

@property(nonatomic, strong)UIView *contentView;

// 产出比例
@property(nonatomic, strong)PYZoomEchartsView *capitalOutputRatioCTView;

// 产量
@property(nonatomic, strong)PYZoomEchartsView *outputCTView;

// 效率
@property(nonatomic, strong)PYZoomEchartsView *efficiencyCTView;

// 电性能
@property(nonatomic, strong)PYZoomEchartsView *electricalPropertyCTView;

@end

@implementation ViewController

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(0, 1500);
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (PYZoomEchartsView *)capitalOutputRatioCTView {
    if (!_capitalOutputRatioCTView) {
        _capitalOutputRatioCTView = [[PYZoomEchartsView alloc] init];
    }
    return _capitalOutputRatioCTView;
}

- (PYZoomEchartsView *)outputCTView {
    if (!_outputCTView) {
        _outputCTView = [[PYZoomEchartsView alloc] init];
    }
    return _outputCTView;
}

- (PYZoomEchartsView *)efficiencyCTView {
    if (!_efficiencyCTView) {
        _efficiencyCTView = [[PYZoomEchartsView alloc] init];
    }
    return _efficiencyCTView;
}

- (PYZoomEchartsView *)electricalPropertyCTView {
    if (!_electricalPropertyCTView) {
        _electricalPropertyCTView = [[PYZoomEchartsView alloc] init];
    }
    return _electricalPropertyCTView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self.capitalOutputRatioCTView setOption:[self setupCapitalOutputRatioOption]];
    [self.capitalOutputRatioCTView loadEcharts];
    
    [self.outputCTView setOption:[self setupOutputOption]];
    [self.outputCTView loadEcharts];
    
    [self.efficiencyCTView setOption:[self setupEfficiencyOption]];
    [self.efficiencyCTView loadEcharts];
    
    [self.electricalPropertyCTView setOption:[self setupElectricalPropertyOption]];
    [self.electricalPropertyCTView loadEcharts];
}

- (void)setupUI {
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.width.equalTo(self.view);
    }];
    
    self.contentView = [[UIView alloc] init];
    [self.scrollView addSubview:self.contentView];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.width.equalTo(self.scrollView);
    }];
    
    [self.contentView addSubview:self.capitalOutputRatioCTView];
    [self.capitalOutputRatioCTView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(64);
        make.left.right.width.equalTo(self.contentView);
        make.height.equalTo(300);
    }];
    
    [self.contentView addSubview:self.outputCTView];
    [self.outputCTView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.capitalOutputRatioCTView.bottom).offset(64);
        make.left.right.width.equalTo(self.contentView);
        make.height.equalTo(300);
    }];
    
    [self.contentView addSubview:self.efficiencyCTView];
    [self.efficiencyCTView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.outputCTView.bottom).offset(64);
        make.left.right.width.equalTo(self.contentView);
        make.height.equalTo(300);
    }];
    
    [self.contentView addSubview:self.electricalPropertyCTView];
    [self.electricalPropertyCTView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.efficiencyCTView.bottom).offset(64);
        make.left.right.width.bottom.equalTo(self.contentView);
        make.height.equalTo(300);
    }];
}

- (PYOption *)setupCapitalOutputRatioOption {
    
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {    // 设置标题
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"宁晋电池产出比例各车间综合数据趋势图")
            .textStyle.fontSizeEqual(@16);
            title.xEqual(PYPositionCenter).yEqual(PYPositionTop);
            
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {                // 设置网格
            grid.xEqual(@40).x2Equal(@90).yEqual(@50);
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) { // 设置提示
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                textStyle.fontSizeEqual(@8);
            }]);
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }])
            .yEqual(PYPositionBottom)
            .xEqual(PYPositionLeft)
            .itemGapEqual(@15);
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {      // 设置图例
            legend.dataEqual(@[@"156SK-PR2",@"156SK-PR硼",@"156SK-PR",@"156MK-RE",
                               @"156MK-C5-4BB",@"156MK-C6-5BB",@"156MK-JG-4BB",@"156MK-JG-5BB"]);
            legend.textStyle.fontSizeEqual(@8);
            legend.xEqual(PYPositionRight);
            legend.yEqual(PYPositionCenter);
            legend.orientEqual(PYOrientVertical);
            legend.itemWidthEqual(@10);
        }])
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {                 // 设置X轴
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@YES)
            .addDataArr(@[@"07-21",@"07-22",@"07-23",@"07-24"])
            .axisLine.lineStyle.widthEqual(@1.5);
            axis.splitLine.showEqual(NO);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {                 // 设置Y轴
            axis.typeEqual(PYAxisTypeValue).boundaryGapEqual(@NO)
            .minEqual(@0.0)
            .maxEqual(@100.0)
            .splitNumberEqual(@4)
            .axisLabelEqual([PYAxisLabel initPYAxisLabelWithBlock:^(PYAxisLabel *axisLabel) {
                axisLabel.formatterEqual(@"{value} %");
            }])
            .axisLine.lineStyle.widthEqual(@1.5);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {        // 设置数据内容
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
}

- (PYOption *)setupOutputOption {
    
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {    // 设置标题
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"宁晋电池产量汇总")
            .textStyle.fontSizeEqual(@16);
            title.xEqual(PYPositionCenter).yEqual(PYPositionTop);
            
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {                // 设置网格
            grid.xEqual(@60).x2Equal(@90).yEqual(@50);
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) { // 设置提示
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                textStyle.fontSizeEqual(@8);
            }]);
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }])
            .yEqual(PYPositionBottom)
            .xEqual(PYPositionLeft)
            .itemGapEqual(@15);
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {      // 设置图例
            legend.dataEqual(@[@"156SK-PR2",@"156SK-PR硼",@"156SK-PR",@"156MK-RE",
                               @"156MK-C5-4BB",@"156MK-C6-5BB",@"156MK-JG-4BB",@"156MK-JG-5BB"]);
            legend.textStyle.fontSizeEqual(@8);
            legend.xEqual(PYPositionRight);
            legend.yEqual(PYPositionCenter);
            legend.orientEqual(PYOrientVertical);
            legend.itemWidthEqual(@10);
        }])
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {                 // 设置X轴
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@YES)
            .addDataArr(@[@"07-21",@"07-22",@"07-23",@"07-24"])
            .axisLine.lineStyle.widthEqual(@1.5);
            axis.splitLine.showEqual(NO);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {                 // 设置Y轴
            axis.typeEqual(PYAxisTypeValue).boundaryGapEqual(@NO)
            .minEqual(@0)
            .maxEqual(@600000)
            .splitNumberEqual(@6)
            .axisLine.lineStyle.widthEqual(@1.5);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {        // 设置数据内容
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR2")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(130000),@(150000),@(300000),@(560000)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR硼")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(300000),@(200000),@(100000),@(130000)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(500000),@(300000),@(150000),@(222000)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-RE")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(207806),@(124234),@(394032),@(387462)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C5-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(324231),@(421334),@(523214),@(132452)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C6-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(133443),@(432232),@(234213),@(244323)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(543232),@(123424),@(80222),@(123342)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(302222),@(129939),@(535352),@(123456)]);
        }]);
    }];
}

- (PYOption *)setupEfficiencyOption {
    
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {    // 设置标题
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"宁晋电池效率汇总")
            .textStyle.fontSizeEqual(@16);
            title.xEqual(PYPositionCenter).yEqual(PYPositionTop);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {                // 设置网格
            grid.xEqual(@40).x2Equal(@90).yEqual(@50);
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) { // 设置提示
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                textStyle.fontSizeEqual(@8);
            }]);
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }])
            .yEqual(PYPositionBottom)
            .xEqual(PYPositionLeft)
            .itemGapEqual(@15);
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {      // 设置图例
            legend.dataEqual(@[@"156SK-PR2",@"156SK-PR硼",@"156SK-PR",@"156MK-RE",
                               @"156MK-C5-4BB",@"156MK-C6-5BB",@"156MK-JG-4BB",@"156MK-JG-5BB"]);
            legend.textStyle.fontSizeEqual(@8);
            legend.xEqual(PYPositionRight);
            legend.yEqual(PYPositionCenter);
            legend.orientEqual(PYOrientVertical);
            legend.itemWidthEqual(@10);
        }])
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {                 // 设置X轴
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@YES)
            .addDataArr(@[@"07-21",@"07-22",@"07-23",@"07-24"])
            .axisLine.lineStyle.widthEqual(@1.5);
            axis.splitLine.showEqual(NO);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {                 // 设置Y轴
            axis.typeEqual(PYAxisTypeValue).boundaryGapEqual(@NO)
            .minEqual(@0)
            .maxEqual(@25)
            .splitNumberEqual(@5)
            .axisLabelEqual([PYAxisLabel initPYAxisLabelWithBlock:^(PYAxisLabel *axisLabel) {
                axisLabel.formatterEqual(@"{value} %");
            }])
            .axisLine.lineStyle.widthEqual(@1.5);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {        // 设置数据内容
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR2")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(21.12),@(19.23),@(23.43),@(18.23)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR硼")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(18.23),@(23.43),@(21.12),@(19.23)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(19.23),@(21.12),@(23.43),@(18.23)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-RE")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(23.43),@(19.23),@(18.23),@(21.12)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C5-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(18.23),@(21.12),@(23.43),@(19.23)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C6-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(19.23),@(18.23),@(21.12),@(23.43)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(21.12),@(23.43),@(18.23),@(19.23)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(23.43),@(19.23),@(21.12),@(18.23)]);
        }]);
    }];
}

- (PYOption *)setupElectricalPropertyOption {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"宁晋电性能效率分布")
            .textStyle.fontSizeEqual(@16);
            title.xEqual(PYPositionCenter).yEqual(PYPositionTop);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {                // 设置网格
            grid.xEqual(@40).x2Equal(@90).yEqual(@50);
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .axisPointerEqual([PYAxisPointer initPYAxisPointerWithBlock:^(PYAxisPointer *axisPoint) {
                axisPoint.showEqual(YES)
                .typeEqual(PYAxisPointerTypeCross)
                .lineStyleEqual([PYLineStyle initPYLineStyleWithBlock:^(PYLineStyle *lineStyle) {
                    lineStyle.typeEqual(PYLineStyleTypeDashed)
                    .widthEqual(@1);
                }]);
            }])
            .formatterEqual(@"(function(params){return params.seriesName + ':[' + params.value[0] + ',' + params.value[1] + ']'})");
        }])
        .calculableEqual(YES)
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {      // 设置图例
            legend.dataEqual(@[@"Fab5"]);
            legend.textStyle.fontSizeEqual(@8);
            legend.xEqual(PYPositionRight);
            legend.yEqual(PYPositionCenter);
            legend.orientEqual(PYOrientVertical);
            legend.itemWidthEqual(@10);
        }])
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue)
            .nameEqual(@"单位：(W)")
            .minEqual(@0)
            .maxEqual(@5)
            .splitNumberEqual(@5)
            .axisLine.lineStyle.widthEqual(@1.5);
            axis.splitLine.showEqual(NO);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue)
            .minEqual(@0)
            .maxEqual(@30)
            .splitNumberEqual(@6)
            .axisLabelEqual([PYAxisLabel initPYAxisLabelWithBlock:^(PYAxisLabel *axisLabel) {
                axisLabel.formatterEqual(@"{value} %");
            }])
            .axisLineEqual([PYAxisLine initPYAxisLineWithBlock:^(PYAxisLine *axisLine) {
                axisLine.lineStyleEqual([PYLineStyle initPYLineStyleWithBlock:^(PYLineStyle *lineStyle) {
                    lineStyle.colorEqual(PYRGBA(220, 20, 60, 1)).widthEqual(@1.5);
                }]);
            }]);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.smoothEqual(YES)
            .nameEqual(@"Fab5")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@[@(0.2),@(2)],@[@(0.4),@(3)],@[@(1.4),@(2)],@[@(2.7), @(5)],@[@(3.3), @(20)],@[@(4.1), @(15)],@[@(4.3), @(13)],@[@(4.5), @(12)],@[@(5), @(1)]]);
        }]);
    }];
}

@end
