//
//  CGXBarButtonItemModel.m
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/7/4.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXBarButtonItemModel.h"

@implementation CGXBarButtonItemModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemNormalColor = [UIColor blackColor];
        self.itemSelectColor = [UIColor blackColor];
        self.itemHighlightedColor = [UIColor blackColor];
        
        self.itemNormalFont = [UIFont systemFontOfSize:14];
         self.itemSelectFont = [UIFont systemFontOfSize:14];
         self.itemHighlightedFont = [UIFont systemFontOfSize:14];
    }
    return self;
}
@end
