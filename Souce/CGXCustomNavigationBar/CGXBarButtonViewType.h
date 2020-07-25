//
//  CGXBarButtonViewType.h
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/4/16.
//  Copyright © 2019 CGX. All rights reserved.
//

#ifndef CGXBarButtonViewType_h
#define CGXBarButtonViewType_h


typedef NS_ENUM(NSUInteger, CGXBarButtonViewBtnStyle)
{
    BtnStyleLeft,
    BtnStyleRight
};

typedef NS_ENUM(NSUInteger, CGXBarButtonViewBtnCategoryStyle)
{
    BtnCategoryStyleTitle,
    BtnCategoryStyleImage,
    BtnCategoryStyleAll
};

typedef NS_ENUM(NSUInteger, CGXBarButtonViewEdgeInsetsStyle)
{
    EdgeInsetsStyleTop,// image在上，label在下
    EdgeInsetsStyleLeft,// image在左，label在右
    EdgeInsetsStyleBottom, // image在下，label在上
    EdgeInsetsStyleRight // image在右，label在左
};

#endif /* CGXBarButtonViewType_h */
