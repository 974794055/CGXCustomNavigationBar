//
//  UIViewController+CGXBarButtonBase.m
//  CGXConfigBarButton
//
//  Created by 曹贵鑫 on 2017/11/13.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "UIViewController+CGXBarButtonBase.h"
#import <objc/runtime.h>
#import "UIButton+CGXBarButtonBlock.h"

#define CGXBarButtonHeight    44

@implementation UIViewController (CGXBarButtonBase)

- (UIColor *)barTitltColor
{
    UIColor *color = objc_getAssociatedObject(self, @selector(barTitltColor));
    return color?color:[UIColor blackColor];
}
- (void)setBarTitltColor:(UIColor *)barTitltColor
{
    objc_setAssociatedObject(self, @selector(barTitltColor), barTitltColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIFont *)barTitltFont
{
    UIFont *font = objc_getAssociatedObject(self, @selector(barTitltFont));
    return font?font:[UIFont systemFontOfSize:14];
}
- (void)setBarTitltFont:(UIFont *)barTitltFont
{
    objc_setAssociatedObject(self, @selector(barTitltFont), barTitltFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)barNavBackArrow
{
    UIImage *arrow = objc_getAssociatedObject(self, @selector(barNavBackArrow));
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"CGXCustomNavigationBar" ofType:@"bundle"];
    //找到对应images夹下的图片
    NSString *strImage = [[NSBundle bundleWithPath:strPath] pathForResource:@"CGXBarButtonLeftBlockArrow" ofType:@"png" inDirectory:@"images"];
    UIImage *ima = [UIImage imageWithContentsOfFile:strImage];
    
    return arrow?arrow:ima;
}
- (void)setBarNavBackArrow:(UIImage *)barNavBackArrow
{
    objc_setAssociatedObject(self, @selector(barNavBackArrow), barNavBackArrow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 导航条标题设置
 */
- (void)setNavTitle:(NSString *)title
{
    [self setNavTitle:title withColor:[self barTitltColor] Font:[UIFont systemFontOfSize:18]];
}
- (void)setNavTitle:(NSString *)title withColor:(UIColor *)color
{
    [self setNavTitle:title withColor:color Font:[UIFont systemFontOfSize:18]];
}
- (void)setNavTitle:(NSString *)title withColor:(UIColor *)color Font:(UIFont *)font
{
    [self setNavTitle:title withColor:color Font:font Block:nil];
}
- (void)setNavTitle:(NSString *)title withColor:(UIColor *)color Font:(UIFont *)font Block:(void (^)(UIButton *btn))block
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:title];
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:NSMakeRange(0, title.length)];
    [attributedStr addAttribute:NSFontAttributeName
                          value:font
                          range:NSMakeRange(0, title.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:4];
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, title.length)];
    [self setNavAttributedString:attributedStr Block:block];
}
- (void)setNavAttributedString:(NSMutableAttributedString *)attrited
{
    [self setNavAttributedString:attrited Block:nil];
}
- (void)setNavAttributedString:(NSMutableAttributedString *)attrited Block:(void (^)(UIButton *btn))block
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setAttributedTitle:attrited forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.numberOfLines = 0;
    [btn sizeToFit];
    [btn addTapBlock:^(UIButton * _Nonnull btn) {
        if (block) {
            block(btn);
        }
    }];
    self.navigationItem.titleView = btn;
}
- (void)bgColor;
{
    self.view.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
}
- (void)bgColor:(UIColor *)color;
{
    self.view.backgroundColor = color;
}
- (void)addNavBack
{
    __weak typeof(self) weakNavBackSelf = self;
    [self addLeftBarImage:self.barNavBackArrow Block:^(UIButton *btn) {
        [weakNavBackSelf.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)addNavBackWithTitle:(NSString *)title
{
    [self addNavBackWithTitle:title withColor:[self barTitltColor]];
}
- (void)addNavBackWithTitle:(NSString *)title withColor:(UIColor *)color
{
    [self addNavBackWithTitle:title withColor:color Font:self.barTitltFont];
}
- (void)addNavBackWithTitle:(NSString *)title withColor:(UIColor *)color Font:(UIFont *)font
{
    [self addNavBackWithImage:self.barNavBackArrow Title:title withColor:color Font:font];
}
- (void)addNavBackWithImage:(UIImage *)image Title:(NSString *)title withColor:(UIColor *)color Font:(UIFont *)font
{
    __weak typeof(self) weakNavBackSelf = self;
    [self addLeftBarAllTitle:title Color:color Font:font Image:image Type:EdgeInsetsStyleLeft Block:^(UIButton *btn) {
        [weakNavBackSelf.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)addLeftBarImage:(UIImage *)image Block:(void (^)(UIButton *btn))block
{
    [self addLeftBarMoreImage:@[image] Block:block];
}
- (void)addLeftBarMoreImage:(NSArray<UIImage *> *)imageArr Block:(void (^)(UIButton *btn))block
{
    [self addTypeBarMoreImage:imageArr IsLeft:YES Block:block];
}

- (void)addLeftBarTitle:(NSString *)title Block:(void (^)(UIButton *btn))block
{
    [self addLeftBarTitle:title Color:[self barTitltColor] Font:self.barTitltFont Block:block];
}
- (void)addLeftBarTitle:(NSString *)title Color:(UIColor *)color Font:(UIFont *)font Block:(void (^)(UIButton *btn))block
{
    [self addLeftBarMoreTitle:@[title] Color:color Font:font Block:block];
}
- (void)addLeftBarMoreTitle:(NSArray<NSString *> *)titleArr Block:(void (^)(UIButton *btn))block
{
    [self addLeftBarMoreTitle:titleArr Color:[self barTitltColor] Font:self.barTitltFont Block:block];
}
- (void)addLeftBarMoreTitle:(NSArray<NSString *> *)titleArr Color:(UIColor *)color Font:(UIFont *)font Block:(void (^)(UIButton *btn))block
{
    [self addTypeBarMoreTitle:titleArr Color:color Font:font IsLeft:YES Block:block];
}



- (void)addRightBarImage:(UIImage *)image Block:(void (^)(UIButton *btn))block
{
    [self addRightBarMoreImage:@[image] Block:block];
}
- (void)addRightBarMoreImage:(NSArray<UIImage *> *)imageArr Block:(void (^)(UIButton *btn))block
{
    [self addTypeBarMoreImage:imageArr IsLeft:NO Block:block];
}
- (void)addRightBarTitle:(NSString *)title Block:(void (^)(UIButton *btn))block
{
    [self addRightBarTitle:title Color:[self barTitltColor] Block:block];
}
- (void)addRightBarTitle:(NSString *)title Color:(UIColor *)color Block:(void (^)(UIButton *btn))block
{
    [self addRightBarTitle:title Color:[self barTitltColor] Font:self.barTitltFont Block:block];
}
- (void)addRightBarTitle:(NSString *)title Color:(UIColor *)color Font:(UIFont *)font Block:(void (^)(UIButton *btn))block
{
    [self addRightBarMoreTitle:@[title] Color:color Font:font Block:block];
}

- (void)addRightBarMoreTitle:(NSArray<NSString *> *)titleArr Block:(void (^)(UIButton *btn))block
{
    [self addRightBarMoreTitle:titleArr Color:[self barTitltColor] Block:block];
}
- (void)addRightBarMoreTitle:(NSArray<NSString *> *)titleArr Color:(UIColor *)color Block:(void (^)(UIButton *btn))block
{
    [self addRightBarMoreTitle:titleArr Color:color Font:self.barTitltFont Block:block];
}
- (void)addRightBarMoreTitle:(NSArray<NSString *> *)titleArr Color:(UIColor *)color Font:(UIFont *)font Block:(void (^)(UIButton *btn))block
{
    [self addTypeBarMoreTitle:titleArr Color:color Font:font IsLeft:NO Block:block];
}



- (void)addLeftBarAllTitle:(NSString *)title
                     Image:(UIImage *)image
                     Block:(void (^)(UIButton *btn))block
{
    [self addLeftBarAllTitle:title Color:[self barTitltColor] Font:self.barTitltFont Image:image Type:EdgeInsetsStyleTop Block:block];
}
- (void)addLeftBarAllTitle:(NSString *)title
                     Color:(UIColor *)color
                      Font:(UIFont *)font
                     Image:(UIImage *)image
                      Type:(CGXBarButtonViewEdgeInsetsStyle)type
                     Block:(void (^)(UIButton *btn))block
{
    [self addLeftBarAllMoreTitle:@[title] Color:@[color] Font:@[font] Image:@[image] Type:type Block:block];
}
- (void)addLeftBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                         Image:(NSArray<UIImage *> *)imageArr
                         Block:(void (^)(UIButton *btn))block
{
    NSMutableArray *colorArr = [NSMutableArray array];
    NSMutableArray *fontArr = [NSMutableArray array];
    
    for (int i = 0; i<titleArr.count; i++) {
        [colorArr addObject:[self barTitltColor]];
        [fontArr addObject:self.barTitltFont];
    }
    [self addLeftBarAllMoreTitle:titleArr Color:colorArr Font:fontArr Image:imageArr Type:EdgeInsetsStyleTop Block:block];
}
- (void)addLeftBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                         Color:(NSArray<UIColor *> *)colorArr
                          Font:(NSArray<UIFont *> *)fontArr
                         Image:(NSArray<UIImage *> *)imageArr
                          Type:(CGXBarButtonViewEdgeInsetsStyle)type
                         Block:(void (^)(UIButton *btn))block
{
    [self addTypeBarAllMoreTitle:titleArr Color:colorArr Font:fontArr Image:imageArr Type:type IsLeft:YES Block:block];
}


- (void)addRightBarAllTitle:(NSString *)title
                      Image:(UIImage *)image
                      Block:(void (^)(UIButton *btn))block
{
    [self addRightBarAllTitle:title Color:[self barTitltColor] Font:self.barTitltFont Image:image Type:EdgeInsetsStyleTop Block:block];
}
- (void)addRightBarAllTitle:(NSString *)title
                      Color:(UIColor *)color
                       Font:(UIFont *)font
                      Image:(UIImage *)image
                       Type:(CGXBarButtonViewEdgeInsetsStyle)type
                      Block:(void (^)(UIButton *btn))block
{
    [self addRightBarAllMoreTitle:@[title] Color:@[color] Font:@[font] Image:@[image] Type:type Block:block];
}
- (void)addRightBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                          Image:(NSArray<UIImage *> *)imageArr
                          Block:(void (^)(UIButton *btn))block
{
    NSMutableArray *colorArr = [NSMutableArray array];
    NSMutableArray *fontArr = [NSMutableArray array];
    
    for (int i = 0; i<titleArr.count; i++) {
        [colorArr addObject:[self barTitltColor]];
        [fontArr addObject:self.barTitltFont];
    }
    [self addRightBarAllMoreTitle:titleArr Color:colorArr Font:fontArr Image:imageArr Type:EdgeInsetsStyleTop Block:block];
}
- (void)addRightBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                          Color:(NSArray<UIColor *> *)colorArr
                           Font:(NSArray<UIFont *> *)fontArr
                          Image:(NSArray<UIImage *> *)imageArr
                           Type:(CGXBarButtonViewEdgeInsetsStyle)type
                          Block:(void (^)(UIButton *btn))block
{
    [self addTypeBarAllMoreTitle:titleArr Color:colorArr Font:fontArr Image:imageArr Type:type IsLeft:NO Block:block];
}
- (void)addTypeBarAllMoreTitle:(NSArray<NSString *> *)titleArr
                         Color:(NSArray<UIColor *> *)colorArr
                          Font:(NSArray<UIFont *> *)fontArr
                         Image:(NSArray<UIImage *> *)imageArr
                          Type:(CGXBarButtonViewEdgeInsetsStyle)type
                        IsLeft:(BOOL)isLeft
                         Block:(void (^)(UIButton *btn))block
{
    UIView *view = [[[UIView alloc] init] init];
    
    
    NSAssert((titleArr.count == imageArr.count), @"titleArr和imageArr数组个数要一致");
    NSAssert((titleArr.count == colorArr.count), @"titleArr和colorArr数组个数要一致");
    NSAssert((titleArr.count == fontArr.count), @"titleArr和fontArr数组个数要一致");
    NSAssert((colorArr.count == fontArr.count), @"colorArr和fontArr数组个数要一致");
    NSAssert((colorArr.count == imageArr.count), @"colorArr和imageArr数组个数要一致");
    NSAssert((fontArr.count == imageArr.count), @"fontArr和imageArr数组个数要一致");
    CGFloat width = 0;
    for (int i = 0; i<titleArr.count; i++) {
        NSString *title = titleArr[i];
        UIImage *image = imageArr[i];
        UIFont *font = fontArr[i];
        UIColor *color = colorArr[i];
        CGXBarButtonView *btnView = [self buttonViewTitle:title TitleFont:font TitleColor:color Image:image IsLeft:isLeft Type:BtnCategoryStyleAll EdgeInsetsStyleTop:type Tag:(10000+i) Block:block];
        [view addSubview:btnView];
        [btnView.superview setNeedsLayout];
        [btnView.superview layoutIfNeeded];
        if (btnView.frame.size.width>44) {
            btnView.frame = CGRectMake(width, 0, btnView.frame.size.width, CGXBarButtonHeight);
        } else{
            btnView.frame = CGRectMake(width, 0, CGXBarButtonHeight, CGXBarButtonHeight);
        }
        width = width+btnView.frame.size.width;
    }
    [self addNavigationItem:isLeft View:view Width:width];
}


- (void)addTypeBarMoreImage:(NSArray<UIImage *> *)imageArr IsLeft:(BOOL)isLeft Block:(void (^)(UIButton *btn))block
{
    UIView *view = [[[UIView alloc] init] init];
    CGFloat width = 0;
    for (int i = 0; i<imageArr.count; i++) {
        UIImage *image = imageArr[i];
        CGXBarButtonView *btnView = [self buttonViewTitle:@"" TitleFont:self.barTitltFont TitleColor:[self barTitltColor] Image:image IsLeft:isLeft Type:BtnCategoryStyleImage EdgeInsetsStyleTop:EdgeInsetsStyleTop Tag:(10000+i) Block:block];
        [view addSubview:btnView];
        [btnView.superview setNeedsLayout];
        [btnView.superview layoutIfNeeded];
        if (btnView.frame.size.width>44) {
            btnView.frame = CGRectMake(width, 0, btnView.frame.size.width, CGXBarButtonHeight);
        } else{
            btnView.frame = CGRectMake(width, 0, CGXBarButtonHeight, CGXBarButtonHeight);
        }
        width = width+ btnView.frame.size.width;
    }
    [self addNavigationItem:isLeft View:view Width:width];
}
- (void)addTypeBarMoreTitle:(NSArray<NSString *> *)titleArr Color:(UIColor *)color Font:(UIFont *)font IsLeft:(BOOL)isLeft Block:(void (^)(UIButton *btn))block
{
    UIView *view = [[[UIView alloc] init] init];
    CGFloat width = 0;
    for (int i = 0; i<titleArr.count; i++) {
        NSString *title = titleArr[i];
        CGXBarButtonView *btnView = [self buttonViewTitle:title TitleFont:font TitleColor:color Image:nil IsLeft:isLeft Type:BtnCategoryStyleTitle EdgeInsetsStyleTop:EdgeInsetsStyleTop Tag:(10000+i) Block:block];
        [view addSubview:btnView];
        [btnView.superview setNeedsLayout];
        [btnView.superview layoutIfNeeded];
        if (btnView.frame.size.width>44) {
            btnView.frame = CGRectMake(width, 0, btnView.frame.size.width, CGXBarButtonHeight);
        } else{
            btnView.frame = CGRectMake(width, 0, CGXBarButtonHeight, CGXBarButtonHeight);
        }
        width = width+ btnView.frame.size.width;
    }
    [self addNavigationItem:isLeft View:view Width:width];
}

- (void)addNavigationItem:(BOOL)isLeft View:(UIView *)view Width:(CGFloat)width
{
    view.frame = CGRectMake(0, 0, width, CGXBarButtonHeight);
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    }else{
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    }
}
- (CGXBarButtonView *)buttonViewTitle:(NSString *)title TitleFont:(UIFont *)titleFont TitleColor:(UIColor *)titleColor Image:(UIImage *)image IsLeft:(BOOL)isLeft Type:(CGXBarButtonViewBtnCategoryStyle)btnCategoryStyle EdgeInsetsStyleTop:(CGXBarButtonViewEdgeInsetsStyle)edgeInsetsStyleTop Tag:(NSInteger)tag Block:(void (^)(UIButton *btn))block
{
    CGXBarButtonView *btnView = [[CGXBarButtonView alloc] init];
    btnView.title = title;
    btnView.imageNormal = image;
    if (isLeft) {
        btnView.btnStyle = BtnStyleLeft;
    } else{
        btnView.btnStyle = BtnStyleRight;
    }
    btnView.titleFont = titleFont;
    btnView.titleColor = titleColor;
    btnView.btnCategoryStyle = btnCategoryStyle;
    btnView.edgeInsetsStyle = edgeInsetsStyleTop;
    btnView.selectblock  = block;
    btnView.btnTag = tag;
    return btnView;
}
@end

