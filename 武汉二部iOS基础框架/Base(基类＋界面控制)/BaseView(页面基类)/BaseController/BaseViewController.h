//
//  BaseViewController.h
//  武汉二部iOS基础框架
//
//  Created by 刘成 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)creatContentView;

- (void)creatNavgationItem;

//设置导航栏透明
- (void)setNavigaitionBarTransparent;

//还原导航栏
- (void)resetNavigationBar;

//设置导航栏透明度
- (void)setNavigaitionBarWithAlphComponent:(CGFloat)alph;

@end
