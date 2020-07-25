//
//  UIBarButtonItem+CGXBarButtonItem.m
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/7/4.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "UIBarButtonItem+CGXBarButtonItem.h"
#import <objc/runtime.h>
#import "UIButton+CGXBarButtonImageTitleSpace.h"
#import "UIButton+CGXBarButtonBlock.h"

@interface UIBarButtonItem()

@property (nonatomic , copy) CGXBarButtonItemSelectBlock selectBlock;

@end

@implementation UIBarButtonItem (CGXBarButtonItem)

+ (UIBarButtonItem *)itemBtnImage:(UIImage *)image
                    Target:(CGXBarButtonItemSelectBlock)selectBlock
{
    UIButton *button = [self itemBtnImage:nil imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) Title:@"" font:[UIFont systemFontOfSize:14] titleColor:[UIColor blackColor] titleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) ItemSize:CGSizeMake(44, 44) Target:selectBlock];
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
