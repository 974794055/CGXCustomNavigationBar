//
//  MainViewController.m
//  CGXCustomNavigationBar
//
//  Created by MacMini-1 on 2019/4/17.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "MainViewController.h"
#import "UIBarButtonItem+CGXBarButtonItemCreate.h"
#import "UIViewController+CGXBarButtonBase.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor whiteColor];
    
    [self addNavBack];
    
    [self addNavBackWithTitle:@"返回" withColor:[UIColor redColor]];
    
    [self addNavBackWithTitle:@"返回" withColor:[UIColor redColor] Font:[UIFont systemFontOfSize:30]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
