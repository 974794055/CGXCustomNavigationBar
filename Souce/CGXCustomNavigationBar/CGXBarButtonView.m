//
//  CGXBarButtonView.m
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/4/16.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXBarButtonView.h"
#import "UIButton+CGXBarButtonBlock.h"
#import "UIButton+CGXBarButtonImageTitleSpace.h"
@interface CGXBarButtonView ()



@property (nonatomic,strong) UIButton *btn;

@property (nonatomic , assign,readwrite) CGFloat width;

@property (nonatomic , assign) CGFloat space;//图文间距
@end

@implementation CGXBarButtonView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
         [self InitializeView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitializeView];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.btn setTitleColor:self.titleColor forState:UIControlStateNormal];
    [self.btn.titleLabel setFont:self.titleFont];
    switch (self.btnCategoryStyle) {
        case BtnCategoryStyleAll:
        {
            [self.btn setImage:self.imageNormal forState:UIControlStateNormal];
            [self.btn setTitle:self.title forState:UIControlStateNormal];
            
            switch (self.edgeInsetsStyle) {
                case EdgeInsetsStyleTop:
                {
                    [self.btn layoutButtonWithEdgeInsetsStyle:CGXBarButtonEdgeInsetsStyleTop imageTitleSpace:self.space];
                }
                    break;
                case EdgeInsetsStyleBottom:
                {
                    [self.btn layoutButtonWithEdgeInsetsStyle:CGXBarButtonEdgeInsetsStyleBottom imageTitleSpace:self.space];
                }
                    break;
                case EdgeInsetsStyleLeft:
                {
                    [self.btn layoutButtonWithEdgeInsetsStyle:CGXBarButtonEdgeInsetsStyleLeft imageTitleSpace:self.space];
                }
                    break;
                case EdgeInsetsStyleRight:
                {
                    [self.btn layoutButtonWithEdgeInsetsStyle:CGXBarButtonEdgeInsetsStyleRight imageTitleSpace:self.space];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case BtnCategoryStyleTitle:
        {
            [self.btn setTitle:self.title forState:UIControlStateNormal];
            
            if (self.btnStyle == BtnStyleLeft) {
                self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                self.btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            }else if (self.btnStyle == BtnStyleRight){
                self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
                self.btn.titleLabel.textAlignment = NSTextAlignmentRight;
            } else{
                self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                self.btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            }
        }
            break;
        case BtnCategoryStyleImage:
        {
            [self.btn setImage:self.imageNormal forState:UIControlStateNormal];
            if (self.btnStyle == BtnStyleLeft) {
                self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                self.btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            }else if (self.btnStyle == BtnStyleRight){
                self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
                self.btn.titleLabel.textAlignment = NSTextAlignmentRight;
            } else{
                self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                self.btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            }
        }
            break;
        default:
            break;
    }
    
    [self.btn sizeToFit];
    CGRect frame = self.bounds;
    if (self.edgeInsetsStyle == EdgeInsetsStyleBottom || self.edgeInsetsStyle == EdgeInsetsStyleTop) {
        frame.size.width = CGRectGetWidth(self.btn.frame);
    } else{
        frame.size.width = CGRectGetWidth(self.btn.frame)+self.space;
    }
    self.btn.frame = frame;
    self.bounds = frame;
}
- (void)setBtnTag:(NSInteger)btnTag
{
    _btnTag  = btnTag;
    self.btn.tag  = self.btnTag;
}
- (void)InitializeView
{
    self.btnStyle = BtnStyleLeft;
    _btnCategoryStyle = BtnCategoryStyleImage;
    self.edgeInsetsStyle = EdgeInsetsStyleTop;
    self.titleColor= [UIColor blackColor];
    self.titleFont = [UIFont systemFontOfSize:14];
    self.space = 5;
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.tag  = self.btnTag;
    [self addSubview:self.btn];
    self.btn.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    __weak typeof(self) weakSelf = self;
    [self.btn addTapBlock:^(UIButton * _Nonnull btn) {
        if (weakSelf.selectblock) {
            weakSelf.selectblock(weakSelf.btn);
        }
    }];
    [self.btn setTitleColor:self.titleColor forState:UIControlStateNormal];
    [self.btn.titleLabel setFont:self.titleFont];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
