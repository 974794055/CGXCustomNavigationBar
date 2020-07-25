//
//  CGXBarUINavigationConfig.m
//  CGXCustomNavigationBar
//
//  Created by charles on 2018/4/20.
//  Copyright © 2018年 None. All rights reserved.
//

#import "CGXBarUINavigationConfig.h"

@implementation CGXBarUINavigationConfig

+ (instancetype)shared {
    static CGXBarUINavigationConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
    });
    return config;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        [self configBase];
    }
    return self;
}

-(void)configBase {
    self.CGXBar_defaultFixSpace = 10;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>11) {
        self.CGXBar_fixedSpaceWidth = -20;
    }else{
        self.CGXBar_fixedSpaceWidth = -10;
    }
    self.CGXBar_disableFixSpace = NO;
}

@end
