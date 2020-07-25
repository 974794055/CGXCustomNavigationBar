//
//  UIViewController+CGXBarButtonBase.m
//  UINavigation-CGXBarFixSpace
//
//  Created by 曹贵鑫 on 2017/11/13.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "UINavigationBar+CGXBarFixSpace.h"
#import "CGXBarUINavigationConfig.h"
#import "NSObject+CGXBarRuntime.h"

#ifndef CGXBar_deviceVersion
#define CGXBar_deviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#endif

@implementation UINavigationBar (CGXBarFixSpace)

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethodWithOriginSel:@selector(layoutSubviews)
                                     swizzledSel:@selector(CGXBar_layoutSubviews)];
    });
}

-(void)CGXBar_layoutSubviews{
    [self CGXBar_layoutSubviews];
    if (CGXBar_deviceVersion >= 11 && ![CGXBarUINavigationConfig shared].CGXBar_disableFixSpace) {//需要调节
        CGFloat space = [CGXBarUINavigationConfig shared].CGXBar_defaultFixSpace;
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsMake(0, space, 0, space);//可修正iOS11之后的偏移
                break;
            }
        }
    }
}

@end
