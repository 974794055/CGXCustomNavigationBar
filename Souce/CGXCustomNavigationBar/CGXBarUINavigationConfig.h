//
//  CGXBarUINavigationConfig.h
//  CGXCustomNavigationBar
//
//  Created by charles on 2018/4/20.
//  Copyright © 2018年 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CGXBarUINavigationConfig : NSObject

+ (instancetype)shared;//

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@property(nonatomic, assign)CGFloat CGXBar_defaultFixSpace;//item距离两端的间距,默认为10
@property(nonatomic, assign)CGFloat CGXBar_fixedSpaceWidth;//iOS11之前调整间距,默认为-20,
@property(nonatomic, assign)BOOL CGXBar_disableFixSpace;//是否禁止使用修正,默认为NO

@end
