//
//  UIViewController+CGXBarButtonBase.h
//  CGXConfigBarButton
//
//  Created by 曹贵鑫 on 2017/11/13.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXBarUINavigationConfig.h"
#import "CGXBarButtonView.h"
#import "UIBarButtonItem+CGXBarButtonItemCreate.h"
@interface UIViewController (CGXBarButtonBase)

/**
 默认黑色
 */
@property (nonatomic, strong) UIColor *barTitltColor;
/**
 默认14
 */
@property (nonatomic, assign) UIFont *barTitltFont;


@property (nonatomic, strong) UIImage *barNavBackArrow;

/**
 导航条标题设置 font： 18    color： [UIColor blackColor]
 */
- (void)setNavTitle:(NSString *)title;
- (void)setNavTitle:(NSString *)title
          withColor:(UIColor *)color;
- (void)setNavTitle:(NSString *)title
          withColor:(UIColor *)color
               Font:(UIFont *)font;
- (void)setNavTitle:(NSString *)title
          withColor:(UIColor *)color
               Font:(UIFont *)font
              Block:(void (^)(UIButton *btn))block;
- (void)setNavAttributedString:(NSMutableAttributedString *)attrited;
- (void)setNavAttributedString:(NSMutableAttributedString *)attrited
                         Block:(void (^)(UIButton *btn))block;


- (void)bgColor; //默认[UIColor colorWithWhite:0.93 alpha:1]; 
- (void)bgColor:(UIColor *)color;
//返回控制器
- (void)addNavBack;
- (void)addNavBackWithTitle:(NSString *)title;
- (void)addNavBackWithTitle:(NSString *)title
                  withColor:(UIColor *)color;
- (void)addNavBackWithTitle:(NSString *)title
                  withColor:(UIColor *)color
                       Font:(UIFont *)font;
- (void)addNavBackWithImage:(UIImage *)image
                      Title:(NSString *)title
                  withColor:(UIColor *)color
                       Font:(UIFont *)font;


#pragma mark -- 左侧按钮
/*
  左侧按钮  只有图片
 */

- (void)addLeftBarImage:(UIImage *)image
                  Block:(void (^)(UIButton *btn))block;
- (void)addLeftBarMoreImage:(NSArray<UIImage *> *)imageArr
                      Block:(void (^)(UIButton *btn))block;
/*
 左侧按钮  只有文字
 */
- (void)addLeftBarTitle:(NSString *)title
                  Block:(void (^)(UIButton *btn))block;
- (void)addLeftBarTitle:(NSString *)title
                  Color:(UIColor *)color
                   Font:(UIFont *)font
                  Block:(void (^)(UIButton *btn))block;


- (void)addLeftBarMoreTitle:(NSArray<NSString *> *)titleArr
                      Block:(void (^)(UIButton *btn))block;
- (void)addLeftBarMoreTitle:(NSArray<NSString *> *)titleArr
                      Color:(UIColor *)color
                       Font:(UIFont *)font
                      Block:(void (^)(UIButton *btn))block;


#pragma mark -- 右侧侧按钮
/*
 左侧按钮  只有图片
 */

- (void)addRightBarImage:(UIImage *)image
                   Block:(void (^)(UIButton *btn))block;
- (void)addRightBarMoreImage:(NSArray<UIImage *> *)imageArr
                       Block:(void (^)(UIButton *btn))block;
/*
 左侧按钮  只有文字
 */
- (void)addRightBarTitle:(NSString *)title
                        Block:(void (^)(UIButton *btn))block;
- (void)addRightBarTitle:(NSString *)title
                        Color:(UIColor *)color
                        Block:(void (^)(UIButton *btn))block;

- (void)addRightBarTitle:(NSString *)title
                        Color:(UIColor *)color
                         Font:(UIFont *)font
                        Block:(void (^)(UIButton *btn))block;


- (void)addRightBarMoreTitle:(NSArray<NSString *> *)titleArr
                            Block:(void (^)(UIButton *btn))block;

- (void)addRightBarMoreTitle:(NSArray<NSString *> *)titleArr
                            Color:(UIColor *)color
                            Block:(void (^)(UIButton *btn))block;

- (void)addRightBarMoreTitle:(NSArray<NSString *> *)titleArr
                            Color:(UIColor *)color Font:(UIFont *)font
                            Block:(void (^)(UIButton *btn))block;


#pragma mark -- 图文按钮
- (void)addLeftBarAllTitle:(NSString *)title
                               Image:(UIImage *)image
                         Block:(void (^)(UIButton *btn))block;

- (void)addLeftBarAllTitle:(NSString *)title
                               Color:(UIColor *)color
                                Font:(UIFont *)font
                               Image:(UIImage *)image
                                Type:(CGXBarButtonViewEdgeInsetsStyle)type
                         Block:(void (^)(UIButton *btn))block;


- (void)addLeftBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                                   Image:(NSArray<UIImage *> *)imageArr
                             Block:(void (^)(UIButton *btn))block;

- (void)addLeftBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                                   Color:(NSArray<UIColor *> *)colorArr
                                    Font:(NSArray<UIFont *> *)fontArr
                                   Image:(NSArray<UIImage *> *)imageArr
                                    Type:(CGXBarButtonViewEdgeInsetsStyle)type
                             Block:(void (^)(UIButton *btn))block;


- (void)addRightBarAllTitle:(NSString *)title
                               Image:(UIImage *)image
                         Block:(void (^)(UIButton *btn))block;

- (void)addRightBarAllTitle:(NSString *)title
                               Color:(UIColor *)color
                                Font:(UIFont *)font
                               Image:(UIImage *)image
                                Type:(CGXBarButtonViewEdgeInsetsStyle)type
                         Block:(void (^)(UIButton *btn))block;


- (void)addRightBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                                   Image:(NSArray<UIImage *> *)imageArr
                             Block:(void (^)(UIButton *btn))block;

- (void)addRightBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                                   Color:(NSArray<UIColor *> *)colorArr
                                    Font:(NSArray<UIFont *> *)fontArr
                                   Image:(NSArray<UIImage *> *)imageArr
                                    Type:(CGXBarButtonViewEdgeInsetsStyle)type
                             Block:(void (^)(UIButton *btn))block;




@end
