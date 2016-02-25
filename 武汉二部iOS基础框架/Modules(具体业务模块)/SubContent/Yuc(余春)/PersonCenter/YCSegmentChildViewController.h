//
//  YCSegmentChildViewController.h
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface YCSegmentChildViewController : BaseViewController

- (UIScrollView *)mainScrollViewForSegment;   /**<子类需要实现，返回主ScrollView对象(或ScrollView的子类对象)*/

@end
