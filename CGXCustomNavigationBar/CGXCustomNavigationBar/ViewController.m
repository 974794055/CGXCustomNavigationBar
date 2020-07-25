//
//  ViewController.m
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/4/11.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "ViewController.h"

#import "UIBarButtonItem+CGXBarButtonItemCreate.h"
#import "UIViewController+CGXBarButtonBase.h"

#import "MainViewController.h"

#import "UIBarButtonItem+CGXBarButtonItem.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLeftBarImage:[UIImage imageNamed:@"ArrowLeft"] Block:^(UIButton *sender) {
        NSLog(@"图片---%@" , sender);
    }];
//    [self addLeftBarMoreImage:@[[UIImage imageNamed:@"CartAdd"],[UIImage imageNamed:@"CartAdd"],[UIImage imageNamed:@"CartAdd"]] Block:^(UIButton *sender) {
//        NSLog(@"图片---%@" , sender);
//    }];
//    [self addLeftBarTitle:@"哈哈" Block:^(UIButton *btn) {
//        NSLog(@"文--字---%@--%ld" , btn,btn.tag);;
//    }];
//
//    [self addLeftBarMoreTitle:@[@"哈",@"哈",@"哈"] Block:^(UIButton *btn) {
//        NSLog(@"文--字---%@--%ld" , btn,btn.tag);;
//    }];
//    [self addLeftBarAllTitle:@"哈哈"  Image:[UIImage imageNamed:@"CartAdd"] Block:^(UIButton *btn) {
//        NSLog(@"文--字---%@--%ld" , btn,btn.tag);;
//    }];
    [self addLeftBarAllMoreTitle:@[@"哈",@"哈",@"哈"] Color:@[[UIColor blackColor],[UIColor blackColor],[UIColor blackColor]] Font:@[[UIFont systemFontOfSize:14],[UIFont systemFontOfSize:14],[UIFont systemFontOfSize:14]] Image:@[[UIImage imageNamed:@"ArrowLeft"],[UIImage imageNamed:@"ArrowLeft"],[UIImage imageNamed:@"ArrowLeft"]] Type:EdgeInsetsStyleTop Block:^(UIButton *btn) {
        NSLog(@"文--字---%@--%ld" , btn,(long)btn.tag);;
    }];

     __weak typeof(self) weakSelf = self;
    [self addRightBarImage:[UIImage imageNamed:@"ArrowLeft"] Block:^(UIButton *btn) {
        NSLog(@"图片---%@" , btn);
        MainViewController *vc = [[MainViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
//    [self addRightBarMoreImage:@[[UIImage imageNamed:@"CartAdd"],[UIImage imageNamed:@"CartAdd"],[UIImage imageNamed:@"CartAdd"]] Block:^(UIButton *btn) {
//        NSLog(@"图片---%@" , btn);
//    }];
//    [self addRightBarTitle:@"哈" Block:^(UIButton *btn) {
//         NSLog(@"图片---%@" , btn);
//    }];
//
//    [self addRightBarMoreTitle:@[@"筛选",@"排序"] Color:[UIColor orangeColor] Font:[UIFont systemFontOfSize:14] Block:^(UIButton *btn) {
//        NSLog(@"文--字---%@--%ld" , btn,btn.tag);;
//    }];
//
//    [self addRightBarAllTitle:@"哈哈" Image:[UIImage imageNamed:@"CartAdd"] Block:^(UIButton *btn) {
//         NSLog(@"文--字---%@--%ld" , btn,btn.tag);;
//    }];
    [self addRightBarAllMoreTitle:@[@"哈",@"哈",@"哈"] Color:@[[UIColor blackColor],[UIColor blackColor],[UIColor blackColor]] Font:@[[UIFont systemFontOfSize:14],[UIFont systemFontOfSize:14],[UIFont systemFontOfSize:14]] Image:@[[UIImage imageNamed:@"ArrowLeft"],[UIImage imageNamed:@"ArrowLeft"],[UIImage imageNamed:@"ArrowLeft"]] Type:EdgeInsetsStyleTop Block:^(UIButton *btn) {
        NSLog(@"文--字---%@--%ld" , btn,(long)btn.tag);;
    }];
    

//    [self setNavTitle:@"首页"];
    [self setNavTitle:@"首页" withColor:[UIColor redColor] Font:[UIFont systemFontOfSize:20]];

    [self setNavAttributedString:[[NSMutableAttributedString alloc] initWithString:@"哈哈哈哈"] Block:^(UIButton *btn) {
        NSLog(@"文--字---%@--%ld" , btn,(long)btn.tag);;
    }];
    
}
- (void)ssss
{
    
}

@end
