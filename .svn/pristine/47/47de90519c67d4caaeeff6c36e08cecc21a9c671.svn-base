//
//  BaseManger.m
//  武汉二部iOS基础框架
//
//  Created by 苏荷 on 15/9/23.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "BaseManger.h"
#import "GetInController.h"
#import "BaseNavigationController.h"

@implementation BaseManger

+ (void)chooseRootviewController
{
    GetInController *VC = [[GetInController alloc]init];
    VC.title = @"main";
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:VC];
    [[UIApplication sharedApplication].keyWindow setRootViewController:nav];
}

@end
