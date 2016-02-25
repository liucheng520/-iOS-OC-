//
//  YCSegmentViewController.h
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

/**说明：
     1、使用该类的子类，并重写相对应的方法
     2、作为该类的childViewController 必须都是YCSegmentChildViewController及其子类
 */


#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "YCSegmentChildViewController.h"

@interface YCSegmentViewController : BaseViewController

@property (nonatomic, assign) CGFloat segmentMiniTopInset;  /**<选项卡离顶部的最小距离*/
@property (nonatomic, weak, readonly) YCSegmentChildViewController *currentDisplayController; /**<当前显示的控制器*/
@property (nonatomic, strong, readonly) UIView *headerView;
@property (nonatomic, assign) NSUInteger selectedIndex;

/* - initWithControllers: 
   - setSegmentViewControllers: 
   - dataForSegmentViewControllers
   以下三个方法设置数据，任选其一，优先级如下：
    initWithControllers: > setSegmentViewControllers > dataForSegmentViewControllers
 */

-(instancetype)initWithControllers:(YCSegmentChildViewController *)controller,... NS_REQUIRES_NIL_TERMINATION;

-(void)setSegmentViewControllers:(NSArray *)viewControllers;

#pragma mark - SubClass Override Method
- (NSArray *)dataForSegmentViewControllers;  /**<数据源，如果没有调用初始化方法和set方法，则子类需要重写该方法  options*/

- (UIView *)segementTabsView; /**<选项卡View,子类需要重写  required*/

- (UIView *)topHeaderView;  /**<顶部的视图,子类需要重写  required*/

- (void)didSegmentTopInsetChanged:(CGFloat)value;   /**<滑动的时候子viewcontroller与顶部的距离变化，子类可单独处理 optional*/

@end
