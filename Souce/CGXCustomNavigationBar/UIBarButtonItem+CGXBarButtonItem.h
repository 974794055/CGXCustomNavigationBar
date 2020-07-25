//
//  UIBarButtonItem+CGXBarButtonItem.h
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/7/4.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//点击按钮事件
typedef void(^CGXBarButtonItemSelectBlock)(UIButton *sender);

@interface UIBarButtonItem (CGXBarButtonItem)

/*******    根据图片生成UIBarButtonItem  ********/
/**
 @param selectBlock 按钮点击对象
 @param image image 默认图片
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemBtnImage:(UIImage *)image
                           Target:(CGXBarButtonItemSelectBlock)selectBlock;

@end

NS_ASSUME_NONNULL_END
