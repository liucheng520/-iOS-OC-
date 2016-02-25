//
//  YCSegmentViewController.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "YCSegmentViewController.h"

const void* _ARSEGMENTPAGE_CURRNTPAGE_SCROLLVIEWOFFSET = &_ARSEGMENTPAGE_CURRNTPAGE_SCROLLVIEWOFFSET;

@interface YCSegmentViewController ()

@property (nonatomic, assign) CGFloat segmentHeight;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *segmentView;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, assign) CGFloat segmentToInset;
@property (nonatomic, weak) YCSegmentChildViewController *currentDisplayController;
@property (nonatomic, strong) NSLayoutConstraint *headerHeightConstraint;

@end

@implementation YCSegmentViewController

-(instancetype)initWithControllers:(YCSegmentChildViewController *)controller, ...
{
    self = [super init];
    if (self) {
        NSAssert(controller != nil, @"the first controller must not be nil!");
        [self baseSetUp];
        YCSegmentChildViewController *eachController;
        va_list argumentList;
        if (controller)
        {
            [self.controllers addObject: controller];
            va_start(argumentList, controller);
            while ((eachController = va_arg(argumentList, id)))
            {
                [self.controllers addObject:eachController];
            }
            va_end(argumentList);
        }
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseSetUp];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self baseSetUp];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self.controllers count] == 0)
    {
        [self setSegmentViewControllers:[self dataForSegmentViewControllers]];
    }
    
    [self baseConfigs];
    [self baseLayoutViews];
}

#pragma mark - public methods

- (NSArray *)dataForSegmentViewControllers
{
    return [[NSArray alloc] init];
}

-(void)setSegmentViewControllers:(NSArray *)viewControllers;
{
    NSAssert([viewControllers count] != 0, @"the controllers must not be zero!!!");
    for(YCSegmentChildViewController *vc in viewControllers)
    {
        NSAssert([vc isKindOfClass:[YCSegmentChildViewController class]], @"The controllers must be subClass of YCSegmentViewController !!!");
    }
    [self.controllers removeAllObjects];
    [self.controllers addObjectsFromArray:viewControllers];
}

//头部的View展示
- (UIView *)topHeaderView
{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.headerHeight)];
}

- (UIView *)segementTabsView
{
    UIView *segmentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.000001f)];
    segmentView.backgroundColor = [UIColor clearColor];
    
    return segmentView;
}


-(void)baseSetUp
{
    self.headerHeight = 200;
    self.segmentHeight = 0;
    self.segmentToInset = 200;
    self.segmentMiniTopInset = 64;
    self.controllers = [NSMutableArray array];
}

-(void)baseConfigs
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    if ([self.view respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        self.view.preservesSuperviewLayoutMargins = YES;
    }
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.headerView = [self topHeaderView];
    self.headerHeight = CGRectGetHeight(self.headerView.frame);
    self.headerView.clipsToBounds = YES;
    [self.view addSubview:self.headerView];
    
    self.segmentView = [self segementTabsView];
    self.segmentHeight = CGRectGetHeight(self.segmentView.frame);
    [self.view addSubview:self.segmentView];
    
    YCSegmentChildViewController *controller = self.controllers[0];
    [controller willMoveToParentViewController:self];
    [self.view insertSubview:controller.view atIndex:0];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
    
    [self layoutControllerWithController:controller];
    [self addObserverForPageController:controller];
    
    self.currentDisplayController = self.controllers[0];
    
}

-(void)baseLayoutViews
{
    //header
    self.headerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.headerHeightConstraint = [NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:self.headerHeight];
    [self.headerView addConstraint:self.headerHeightConstraint];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    //segment
    self.segmentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.headerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self.segmentView addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:self.segmentHeight]];
}

-(void)layoutControllerWithController:(YCSegmentChildViewController *)pageController
{
    UIView *pageView = pageController.view;
    if ([pageView respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        pageView.preservesSuperviewLayoutMargins = YES;
    }
    pageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    
    UIScrollView *scrollView = [self scrollViewInPageController:pageController];
    if (scrollView) {
        scrollView.alwaysBounceVertical = NO;
        //        scrollView.bounces = NO;
        CGFloat topInset = self.headerHeight+self.segmentHeight;
        //fixed bootom tabbar inset
        CGFloat bottomInset = 0;
        if (self.tabBarController.tabBar.hidden == NO) {
            bottomInset = CGRectGetHeight(self.tabBarController.tabBar.bounds);
        }
        
        [scrollView setContentInset:UIEdgeInsetsMake(topInset, 0, bottomInset, 0)];
        
        NSLog(@"scrollview ContentInset:%@",NSStringFromUIEdgeInsets(scrollView.contentInset));
        NSLog(@"scrollView ContentOffset:%@",NSStringFromCGPoint(scrollView.contentOffset));
        //fixed first time don't show header view
        
        CGPoint offset = scrollView.contentOffset;
        if(!(offset.y > 0))
        {
            [scrollView setContentOffset:CGPointMake(0, -self.headerHeight - self.segmentHeight)];
        }
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    }else{
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.segmentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:-self.segmentHeight]];
    }
    
}

-(UIScrollView *)scrollViewInPageController:(YCSegmentChildViewController *)controller
{
    return [controller mainScrollViewForSegment];
}

#pragma mark - add / remove obsever for page scrollView

-(void)addObserverForPageController:(YCSegmentChildViewController  *)controller
{
    UIScrollView *scrollView = [self scrollViewInPageController:controller];
    if (scrollView != nil) {
        [scrollView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:&_ARSEGMENTPAGE_CURRNTPAGE_SCROLLVIEWOFFSET];
    }
}

-(void)removeObseverForPageController:(YCSegmentChildViewController *)controller
{
    UIScrollView *scrollView = [self scrollViewInPageController:controller];
    if (scrollView != nil) {
        @try {
            [scrollView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset))];
        }
        @catch (NSException *exception) {
            NSLog(@"exception is %@",exception);
        }
        @finally {
            
        }
    }
}

#pragma mark - obsever delegate methods

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == _ARSEGMENTPAGE_CURRNTPAGE_SCROLLVIEWOFFSET) {
//        NSLog(@"offset: %@\nheader: %f\nmini inset = %f", change, self.headerHeightConstraint.constant, self.segmentToInset);
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        CGFloat offsetY = offset.y;
        CGPoint oldOffset = [change[NSKeyValueChangeOldKey] CGPointValue];
        CGFloat oldOffsetY = oldOffset.y;
        CGFloat deltaOfOffsetY = offset.y - oldOffsetY;
        CGFloat offsetYWithSegment = offset.y + self.segmentHeight;
        
        if (deltaOfOffsetY > 0) {
            // 当滑动是向上滑动时
            // 跟随移动的偏移量进行变化
            // NOTE:直接相减有可能constant会变成负数，进而被系统强行移除，导致header悬停的位置错乱或者crash
            if (self.headerHeightConstraint.constant - deltaOfOffsetY <= 0) {
                self.headerHeightConstraint.constant = self.segmentMiniTopInset;
            } else {
                self.headerHeightConstraint.constant -= deltaOfOffsetY;
            }
            // 如果到达顶部固定区域，那么不继续滑动
            if (self.headerHeightConstraint.constant <= self.segmentMiniTopInset) {
                self.headerHeightConstraint.constant = self.segmentMiniTopInset;
            }
        } else {
            // 当向下滑动时
            // 如果列表已经滚动到屏幕上方
            // 那么保持顶部栏在顶部
            if (offsetY > 0) {
                if (self.headerHeightConstraint.constant <= self.segmentMiniTopInset) {
                    self.headerHeightConstraint.constant = self.segmentMiniTopInset;
                }
            } else {
                // 如果列表顶部已经进入屏幕
                // 如果顶部栏已经到达底部
                if (self.headerHeightConstraint.constant >= self.headerHeight) {
                    // 如果当前列表滚到了顶部栏的底部
                    // 那么顶部栏继续跟随变大，否这保持不变
                    if (-offsetYWithSegment > self.headerHeight) {
                        self.headerHeightConstraint.constant = -offsetYWithSegment;
                    } else {
                        self.headerHeightConstraint.constant = self.headerHeight;
                    }
                } else {
                    // 在顶部拦未到达底部的情况下
                    // 如果列表还没滚动到顶部栏底部，那么什么都不做
                    // 如果已经到达顶部栏底部，那么顶部栏跟随滚动
                    if (self.headerHeightConstraint.constant < -offsetYWithSegment) {
                        self.headerHeightConstraint.constant -= deltaOfOffsetY;
                    }
                }
            }
        }
        // 更新 `segmentToInset` 变量，让外部的 kvo 知道顶部栏位置的变化
        if(self.segmentToInset != self.headerHeightConstraint.constant)
        {
            self.segmentToInset = self.headerHeightConstraint.constant;
            [self didSegmentTopInsetChanged:self.segmentToInset];
        }
    }
}

//子类用于控制和变化的函数
- (void)didSegmentTopInsetChanged:(CGFloat)value
{
    /*.......subClass override........*/
}

#pragma mark - event methods
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    if(selectedIndex >= [self.controllers count])
    {
        NSLog(@"越界了，请检查您的controller与选项卡的个数是否一致？");
        return;
    }
    //remove obsever
    [self removeObseverForPageController:self.currentDisplayController];
    
    //add new controller
    YCSegmentChildViewController *controller = self.controllers[selectedIndex];
    
    [self.currentDisplayController willMoveToParentViewController:nil];
    [self.currentDisplayController.view removeFromSuperview];
    [self.currentDisplayController removeFromParentViewController];
    [self.currentDisplayController didMoveToParentViewController:nil];
    
    [controller willMoveToParentViewController:self];
    [self.view insertSubview:controller.view atIndex:0];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
    
    // reset current controller
    self.currentDisplayController = controller;
    //layout new controller
    [self layoutControllerWithController:controller];
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    
    //trigger to fixed header constraint
    UIScrollView *scrollView = [self scrollViewInPageController:controller];
    if (self.headerHeightConstraint.constant != self.headerHeight) {
        if (scrollView.contentOffset.y >= -(self.segmentHeight + self.headerHeight) && scrollView.contentOffset.y <= -self.segmentHeight) {
            [scrollView setContentOffset:CGPointMake(0, -self.segmentHeight - self.headerHeightConstraint.constant)];
        }
    }
    //add obsever
    [self addObserverForPageController:self.currentDisplayController];
}

#pragma mark - manage memory methods

-(void)dealloc
{
    [self removeObseverForPageController:self.currentDisplayController];
}


@end
