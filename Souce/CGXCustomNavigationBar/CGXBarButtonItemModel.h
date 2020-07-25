//
//  CGXBarButtonItemModel.h
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/7/4.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CGXBarButtonItemModel : NSObject

/*   默认相同 */
@property (nonatomic , strong) NSString *itemNormalTitle;
@property (nonatomic , strong) NSString *itemSelectTitle;
@property (nonatomic , strong) NSString *itemHighlightedTitle;

/*   默认相同 */
@property (nonatomic , strong) UIImage *itemNormalImage;
@property (nonatomic , strong) UIImage *itemSelectImage;
@property (nonatomic , strong) UIImage *itemHighlightedImage;

/*   默认黑色 [UIColor blackColor] */
@property (nonatomic , strong) UIColor *itemNormalColor;
@property (nonatomic , strong) UIColor *itemSelectColor;
@property (nonatomic , strong) UIColor *itemHighlightedColor;

/*   默认14 [UIFont systemFontOfSize:14] */
@property (nonatomic , strong) UIFont *itemNormalFont;
@property (nonatomic , strong) UIFont *itemSelectFont;
@property (nonatomic , strong) UIFont *itemHighlightedFont;

@end

NS_ASSUME_NONNULL_END
