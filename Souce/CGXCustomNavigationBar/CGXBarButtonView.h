//
//  CGXBarButtonView.h
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/4/16.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXBarButtonViewType.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^CGXBarButtonViewSelectBlock)(UIButton *sender);

@interface CGXBarButtonView : UIView

@property (nonatomic , assign) CGXBarButtonViewBtnStyle btnStyle;

@property (nonatomic , assign) CGXBarButtonViewBtnCategoryStyle btnCategoryStyle;

@property (nonatomic , assign) CGXBarButtonViewEdgeInsetsStyle edgeInsetsStyle;

@property (nonatomic , copy) CGXBarButtonViewSelectBlock selectblock;
@property (nonatomic , copy) NSString *title;
@property (nonatomic , strong) UIColor *titleColor;
@property (nonatomic , strong) UIFont *titleFont;
@property (nonatomic , strong) UIImage *imageNormal;

@property (nonatomic , assign) NSInteger btnTag;


@end

NS_ASSUME_NONNULL_END
