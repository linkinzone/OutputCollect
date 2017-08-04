//
//  BaseOutputController.m
//  OutputCollect
//
//  Created by afro on 2017/7/28.
//  Copyright © 2017年 afro. All rights reserved.
//

#import "BaseOutputController.h"
#import "Macros.h"
#import "iOS-Echarts.h"

@interface BaseOutputController ()

@end

@implementation BaseOutputController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)setupUI {
    
    [self.baseScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.width.equalTo(self.view);
    }];
    
    self.contentView = [[UIView alloc] init];
    [self.baseScrollView addSubview:self.contentView];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.width.equalTo(self.baseScrollView);
    }];
}

- (PYOption *)setupOutputOption {
    
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {    // 设置标题
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"宁晋2车间电池产量汇总")
            .textStyle.fontSizeEqual(@16);
            title.xEqual(PYPositionCenter).yEqual(PYPositionTop);
            
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {                // 设置网格
            grid.xEqual(@60).x2Equal(@90);
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
            .paddingEqual(@10)
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
            .addDataArr(@[@"07-21",@"07-22",@"07-23",@"07-24",@"07-25",@"07-26",@"07-27"])
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
            .dataEqual(@[@(130000),@(150000),@(300000),@(560000),@(200000),@(100000),@(130000)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR硼")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(300000),@(200000),@(100000),@(130000),@(150000),@(300000),@(560000)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156SK-PR")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(500000),@(300000),@(150000),@(222000),@(124234),@(394032),@(387462)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-RE")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(207806),@(124234),@(394032),@(387462),@(300000),@(150000),@(222000)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C5-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(324231),@(421334),@(523214),@(132452),@(124234),@(394032),@(387462)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-C6-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(133443),@(432232),@(234213),@(244323),@(421334),@(523214),@(132452)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-4BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(543232),@(123424),@(80222),@(123342),@(129939),@(535352),@(123456)]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"总量")
            .nameEqual(@"156MK-JG-5BB")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(302222),@(129939),@(535352),@(123456),@(421334),@(523214),@(132452)]);
        }]);
    }];
}
@end
