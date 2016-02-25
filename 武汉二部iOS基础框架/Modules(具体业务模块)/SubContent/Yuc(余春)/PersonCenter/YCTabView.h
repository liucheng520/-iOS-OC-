//
//  YCTabView.h
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCTabView;

@protocol YCTabViewDelegate <NSObject>

@optional
- (void)tabViewDidChanged:(YCTabView *)tabView selectIndex:(NSInteger)index;

@end

@interface YCTabView : UIView

@property (assign, readonly) NSInteger numberOfTab;
@property (nonatomic, assign) NSInteger selectedTab;
@property (strong, nonatomic, readonly) NSArray *buttons;
@property (weak, nonatomic) id <YCTabViewDelegate> delegate;
@property (strong, nonatomic) UIView *bottomLineView;

- (instancetype)initWithFrame:(CGRect)frame numberOfTab:(NSInteger)numberOfTab;

// call this method if need to update the hover when scrolling
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

/* image left and title right*/
- (void)setTabTitle:(NSString *)title tabImage:(UIImage *)image forTab:(NSUInteger)tab;
- (void)setTabTitle:(NSString *)title forTab:(NSUInteger)tab;

- (void)setHoverViewBackgroundColor:(UIColor *)hoverColor;
- (void)setHoverViewImage:(UIImage *)aImage;

- (void)setSeparteViewBackgroundColor:(UIColor *)sepColor;
- (void)setSeparteViewImage:(UIImage *)aImage;



@end
