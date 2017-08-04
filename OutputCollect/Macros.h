//
//  Macros.h
//  QZFinancial
//
//  Created by Yinjw on 2016/10/13.
//  Copyright © 2016年 Yinjw. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define MyLong unsigned long

#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

#define kWeakSelf(type)   __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 \
                                     green:arc4random_uniform(256)/255.0 \
                                      blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define kColorWithHex(rgbValue)                                             \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0    \
                    green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0       \
                     blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define SWITCH_VIEW(oldViewController, newViewController, showTabBar)   \
    do{                                                                 \
        BOOL originShow = [oldViewController hidesBottomBarWhenPushed]; \
        [oldViewController setHidesBottomBarWhenPushed:!showTabBar];    \
        [oldViewController.navigationController pushViewController:newViewController animated:YES]; \
        [oldViewController setHidesBottomBarWhenPushed:originShow];     \
      } while(0)

#define sharedManager(class)                        \
    {                                               \
        static class* sharedClass;                  \
        static dispatch_once_t predicate;           \
        dispatch_once(&predicate, ^{                \
                sharedClass = [[class alloc] init]; \
                [sharedClass initManager];          \
            });                                     \
        return sharedClass;                         \
    }

#ifdef DEBUG
    #define NSLog(...) NSLog(__VA_ARGS__)
#else
    #define NSLog(...)
#endif

#define MIN_RECOGNIZER_NUMBER 4

#define LABEL_COLOR @"#FF605c51"
#define SEPARATOR_COLOR @"#FFEAEAEA"
#define DASHED_SEPARATOR_COLOR @"#FFD3D3D3"
#define VIEW_BACK_COLOR @"#FFEFEFF4"
#define MASK_VIEW_COLOR @"#7F000000"

#define kHeaderViewHeight   44
#define kDefaultCellHeight  48
#define kLendingCellHeight  210
#define kTimeLineItemViewHeight 80
#define kLineColor kColorWithHex(0xeaeaea)
#define kSubLabelColor kColorWithHex(0xada99f)
#define kThemeColor kColorWithHex(0xff2b3d)
#define kLabelColor kColorWithHex(0x938f83)
#define kViewBackColor kColorWithHex(0xefeff4)
#define kMenuLabelColor kColorWithHex(0x605c51)
#define kDisableButtonColor kColorWithHex(0xf9592b)

#define kTouchIDForPayMent @"TOUCHIDFORPAYMENT"
#endif /* Macros_h */
