//
//  BaseViewController.m
//  武汉二部iOS基础框架
//
//  Created by 刘成 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBar+Awesome.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:DEF_COLOR(250, 250, 250)];
    [self creatContentView];
    [self creatNavgationItem];
}

- (void)creatNavgationItem
{}

- (void)creatContentView
{}


- (void)setNavigaitionBarTransparent
{
     [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0]];
}

- (void)resetNavigationBar
{
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor whiteColor]];
}

- (void)setNavigaitionBarWithAlphComponent:(CGFloat)alph
{
    [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:alph]];
    
    if(alph < 1)
    {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    else
    {
        [self.navigationController.navigationBar setShadowImage:nil];
    }
}

@end
