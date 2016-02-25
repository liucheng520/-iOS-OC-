//
//  SegmentExampleViewController.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "SegmentExampleViewController.h"
#import "SGEaxpleTableViewViewController.h"

#define kFloatLimit 200

@interface SegmentExampleViewController ()<YCTabViewDelegate>

@property (nonatomic, strong) YCTabView *segmentTabView;

@property (nonatomic, strong) UILabel *headerLable;

@end

@implementation SegmentExampleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigaitionBarTransparent];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self resetNavigationBar];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)creatNavgationItem
{
    self.navigationItem.titleView = self.headerLable;
    self.headerLable.hidden = YES;
}

//2、返回子视图的controller对象数组
- (NSArray *)dataForSegmentViewControllers
{
    SGEaxpleTableViewViewController *tab1 = [[SGEaxpleTableViewViewController alloc] initWthBackGroundColor:[UIColor greenColor] showText:@"tableView111111111"];
    
    SGEaxpleTableViewViewController *tab2 = [[SGEaxpleTableViewViewController alloc] initWthBackGroundColor:[UIColor greenColor] showText:@"tableView222222222"];
    
    SGEaxpleTableViewViewController *tab3 = [[SGEaxpleTableViewViewController alloc] initWthBackGroundColor:[UIColor greenColor] showText:@"tableView3333333333"];
    
    return @[tab1,tab2,tab3];
    
}

//重写父类的头部
- (UIView *)topHeaderView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,KScreenWidth, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView setImage:[UIImage imageNamed:@"adsImage1"]];
    
    return imageView;
}


- (UIView *)segementTabsView
{
    return  self.segmentTabView;
}


- (void)didSegmentTopInsetChanged:(CGFloat)value
{
    self.headerLable.hidden = NO;
    if(value >= kFloatLimit)
    {
        [self setNavigaitionBarWithAlphComponent:0.0];
      
         self.navigationItem.titleView.alpha = 0.0;
    }
    else
    {
        CGFloat alph = 1 - (value - 64)/kFloatLimit;
        [self setNavigaitionBarWithAlphComponent:alph];
        
        if(alph > 0.5)
        {
            self.navigationItem.titleView.alpha = alph * 2;
        }
    }
}

#pragma makr - YCTabViewDelegate
- (void)tabViewDidChanged:(YCTabView *)tabView selectIndex:(NSInteger)index
{
    self.selectedIndex = index;
}


#pragma mark - UIFactory
- (YCTabView *)segmentTabView
{
    if(!_segmentTabView)
    {
        _segmentTabView = [[YCTabView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44) numberOfTab:3];
        [_segmentTabView setTabTitle:@"选项1" forTab:0];
        [_segmentTabView setTabTitle:@"选项2" forTab:1];
        [_segmentTabView setTabTitle:@"选项3" forTab:2];
        
        [_segmentTabView setSeparteViewBackgroundColor:[UIColor lightGrayColor]];
        [_segmentTabView setHoverViewBackgroundColor:[UIColor orangeColor]];
        _segmentTabView.delegate = self;
    }
    return _segmentTabView;
}


- (UILabel *)headerLable
{
    if(!_headerLable)
    {
        _headerLable = [[UILabel alloc] init];
        _headerLable.textColor = [UIColor blackColor];
        _headerLable.textAlignment = NSTextAlignmentCenter;
        _headerLable.font = [UIFont systemFontOfSize:20];
        _headerLable.text = @"个人中心";
        [_headerLable sizeToFit];
    }
    return _headerLable;
}

@end
