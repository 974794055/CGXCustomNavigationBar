//
//  UIBarButtonItem+CGXConfigBarButtonItemCreate.h
//  CGXConfigBarButton
//
//  Created by 曹贵鑫 on 2017/11/13.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>


//点击按钮事件
typedef void(^CGXBarButtonItemSelectBlock)(UIButton *sender);

@interface UIBarButtonItem (CGXBarButtonItemCreate)


/*******    根据图片生成UIBarButtonItem  ********/
/**
 @param selectBlock 按钮点击对象
 @param image image 默认图片
 @return 生成的UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithImage:(UIImage *)image
                           Target:(CGXBarButtonItemSelectBlock)selectBlock;
/**
 @param selectBlock 按钮点击对象
 @param image image 默认图片
 @return 生成的UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithImage:(UIImage *)image
                imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                           Target:(CGXBarButtonItemSelectBlock)selectBlock;

/**
 @param selectBlock 按钮点击对象
 @param image image 默认图片
 @return 生成的UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithImage:(UIImage *)image
                  imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                         ItemSize:(CGSize)size
                           Target:(CGXBarButtonItemSelectBlock)selectBlock;


/**
 根据文字生成UIBarButtonItem
 
 @param selectBlock 按钮点击对象
 @param title title
 */
+(UIBarButtonItem *)itemWithTitle:(NSString *)title
                           Target:(CGXBarButtonItemSelectBlock)selectBlock;
/**
 根据文字生成UIBarButtonItem

 @param title title
 @param font font
 @param titleColor 字体颜色
 @param titleEdgeInsets 文字偏移
 @return 生成的UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithTitle:(NSString *)title
                             font:(UIFont *)font
                       titleColor:(UIColor *)titleColor
                  titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                         ItemSize:(CGSize)size
                           Target:(CGXBarButtonItemSelectBlock)selectBlock;
@end
