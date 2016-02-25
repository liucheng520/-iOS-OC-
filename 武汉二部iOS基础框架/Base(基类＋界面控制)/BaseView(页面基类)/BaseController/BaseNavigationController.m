//
//  BaseNavigationController.m
//  武汉二部iOS基础框架
//
//  Created by 刘成 on 15/9/23.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UINavigationBar+Awesome.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIPanGestureRecognizer *popRecognizer;

@end

@implementation BaseNavigationController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance lt_setBackgroundColor:[UIColor whiteColor]];
//    [appearance setShadowImage:[UIImage new]];
    [appearance.layer setMasksToBounds:YES];
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : rgba(226, 176, 70, 1) , NSFontAttributeName : [UIFont systemFontOfSize:20]}];
    
    // 让statusBarStyle一直为白色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    return self;
}
/**
 *  当导航控制器的view创建完毕就调用
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

/**
 *  当第一次使用这个类的时候调用1次
 */
+ (void)initialize
{
    // 设置UINavigationBarTheme的主
    [self setupNavigationBarTheme];
}

/**
 *  设置UINavigationBarTheme的主题
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    //改变导航条的背景颜色。
    
    //改变导航条上的标题的颜色和字体。
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: DEF_COLOR(80, 170, 164), NSForegroundColorAttributeName,[UIFont systemFontOfSize:18.0f], NSFontAttributeName,nil]];
    
    // 1.设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage resizeImage:@"login_input_bg"] forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage resizeImage:@"navigationLine"]];
    
    //    [navBar setTintColor:[UIColor whiteColor]];
    
    // 设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = DEF_COLOR(220, 33, 43);
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:17.0];
    [navBar setTitleTextAttributes:attrs];
    
    // 2.设置BarButtonItem的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置文字颜色
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = DEF_COLOR(220, 33, 43);
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14.0f];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
}

/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置文字属性
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame =  CGRectMake(0, 0, 30, 30);
        backButton.backgroundColor = [UIColor clearColor];
        [backButton setImage:[UIImage imageNamed:@"navigation_back"]  forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigation_back"]  forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.navigationItem.leftBarButtonItem = leftBarButton;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backButtonClick
{
    [self popViewControllerAnimated:YES];
}


@end
