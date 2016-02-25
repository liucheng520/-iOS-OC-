//
//  TabExampleViewController.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/20.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "TabExampleViewController.h"
#import "YCTabView.h"
#import "SGEaxpleTableViewViewController.h"

@interface TabExampleViewController () <YCTabViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) YCTabView *tabView;
@property (nonatomic, strong) UIScrollView *mainsScrollView;

@property (nonatomic, strong) NSMutableArray *controllers;

@end

@implementation TabExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //初始化 并设置frame 以及 有几个选项卡，一屏最多显示3个，超过3个可以滑动显示
    self.tabView = [[YCTabView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, 44) numberOfTab:4];
    
    //设置选中时的地步滑动块（颜色 或 图片 二选一）
    [self.tabView setHoverViewBackgroundColor:[UIColor orangeColor]];
//    [self.tabView setHoverViewImage:[UIImage imageNamed:@"XXXXXXX"]];
    
    //设置选项卡间的分隔线 （颜色 或 图片 二选一）
    [self.tabView setSeparteViewBackgroundColor:[UIColor lightGrayColor]];
//    [self.tabView setSeparteViewImage:[UIImage imageNamed:@"XXXXXXXX"]];
    
    //设置每个选项卡的显示内容，支持图片(右) + 文字(左) 也可以是单独的文字 也可以混合使用
    [self.tabView setTabTitle:@"第一个" forTab:0];
    [self.tabView setTabTitle:@"第二个" tabImage:[UIImage imageNamed:@"tabView_image"] forTab:1];
    [self.tabView setTabTitle:@"第三个" forTab:2];
    [self.tabView setTabTitle:@"第四个" tabImage:[UIImage imageNamed:@"tabView_image"] forTab:3];
    
    //遵守Delegate协议
    self.tabView.delegate = self;
    [self.view addSubview:self.tabView];
    
    self.mainsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tabView.frame), KScreenWidth, KScreenHeight - CGRectGetMaxY(self.tabView.frame))];
    self.mainsScrollView.pagingEnabled = YES;
    self.mainsScrollView.delegate = self;
    
    NSArray *colorArray = [NSArray arrayWithObjects:[UIColor greenColor],[UIColor redColor],[UIColor blueColor],[UIColor yellowColor], nil];
    
    for(NSInteger i = 0; i < 4; i++)
    {
        SGEaxpleTableViewViewController *tabController = [[SGEaxpleTableViewViewController alloc] initWthBackGroundColor:colorArray[i] showText:[NSString stringWithFormat:@"第%@页%@%@%@",@(i),@(i),@(i),@(i)]];
        tabController.view.frame = CGRectMake(i * KScreenWidth, 0, KScreenWidth, self.mainsScrollView.frame.size.height);
        
        [self.controllers addObject:tabController];
        [self.mainsScrollView addSubview:tabController.view];
        
    }
    
    self.mainsScrollView.contentSize = CGSizeMake(4 * KScreenWidth, self.mainsScrollView.frame.size.height);
    
    
    [self.view addSubview:self.mainsScrollView];
    
}

- (void)creatNavgationItem
{
    self.navigationItem.title = self.model.title;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //将scrollView的滑动 传递到选项卡控件,以使底部条对实时的滑动做出反应
    if(scrollView == _mainsScrollView)
    {
        [self.tabView scrollViewDidScroll:scrollView];
    }
}


#pragma mark - YCTabViewDelegate
- (void)tabViewDidChanged:(YCTabView *)tabView selectIndex:(NSInteger)index
{
    [self.mainsScrollView setContentOffset:CGPointMake(index * KScreenWidth, 0) animated:YES];
}


#pragma mark - lazy 
- (NSMutableArray *)controllers
{
    if(!_controllers)
    {
        _controllers = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return _controllers;
}

@end
