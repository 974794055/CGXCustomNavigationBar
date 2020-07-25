//
//  UIBarButtonItem+CGXConfigBarButtonItemCreate.m
//  CGXConfigBarButton
//
//  Created by 曹贵鑫 on 2017/11/13.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "UIBarButtonItem+CGXBarButtonItemCreate.h"
#import <objc/runtime.h>
#import "UIButton+CGXBarButtonImageTitleSpace.h"
#import "UIButton+CGXBarButtonBlock.h"
@interface UIBarButtonItem()

@property (nonatomic , copy) CGXBarButtonItemSelectBlock selectBlock;

@end

@implementation UIBarButtonItem (CGXBarButtonItemCreate)


+(UIBarButtonItem *)itemWithImage:(UIImage *)image
                           Target:(CGXBarButtonItemSelectBlock)selectBlock
{
    return [self itemWithImage:image Target:selectBlock];
}
+(UIBarButtonItem *)itemWithImage:(UIImage *)image
                  imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                           Target:(CGXBarButtonItemSelectBlock)selectBlock
{
    return [self itemWithImage:image imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) ItemSize:CGSizeMake(44, 44) Target:selectBlock];
}
+(UIBarButtonItem *)itemWithImage:(UIImage *)image
                  imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                         ItemSize:(CGSize)size
                           Target:(CGXBarButtonItemSelectBlock)selectBlock
{
    UIButton *button = [self itemBtnImage:image imageEdgeInsets:imageEdgeInsets Title:nil font:[UIFont systemFontOfSize:14 ] titleColor:[UIColor blackColor] titleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) ItemSize:size Target:selectBlock];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+(UIBarButtonItem *)itemWithTitle:(NSString *)title
                           Target:(CGXBarButtonItemSelectBlock)selectBlock
{
    return [self itemWithTitle:title font:[UIFont systemFontOfSize:14] titleColor:[UIColor blackColor] titleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) ItemSize:CGSizeMake(44, 44) Target:selectBlock];
}


+(UIBarButtonItem *)itemWithTitle:(NSString *)title
                             font:(UIFont *)font
                       titleColor:(UIColor *)titleColor
                  titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                         ItemSize:(CGSize)size
                           Target:(CGXBarButtonItemSelectBlock)selectBlock
{
   UIButton *button = [self itemBtnImage:nil imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) Title:title font:font titleColor:titleColor titleEdgeInsets:titleEdgeInsets ItemSize:size Target:selectBlock];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (UIButton *)itemBtnImage:(UIImage *)image
           imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                     Title:(NSString *)title
                      font:(UIFont *)font
                titleColor:(UIColor *)titleColor
           titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                  ItemSize:(CGSize)size
                    Target:(CGXBarButtonItemSelectBlock)selectBlock
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTapBlock:^(UIButton * _Nonnull btn) {
        if (selectBlock) {
            selectBlock(btn);
        }
    }];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = font?font:nil;
        [button setTitleColor:titleColor?titleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:titleColor?titleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        button.titleEdgeInsets = titleEdgeInsets;
    }
    if (image) {
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateHighlighted];
        button.imageEdgeInsets = imageEdgeInsets;
    }
    button.backgroundColor = [UIColor orangeColor];
    button.bounds = CGRectMake(0, 0, size.width, size.height);
    return button;
}
@end
