//
//  YCTabView.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "YCTabView.h"

@interface YCTabView()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic,assign) CGFloat tabWidth;
@property (strong, nonatomic) UIImageView *hoverView;
@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) NSMutableArray *sepViews;
@property (assign, nonatomic) CGFloat sepHeiht;

@end

@implementation YCTabView

- (instancetype)initWithFrame:(CGRect)frame numberOfTab:(NSInteger)numberOfTab {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpSubViewsWithNumberOfTab:numberOfTab];
    }
    return self;
}

- (void)setUpSubViewsWithNumberOfTab:(NSInteger)numberOfTab
{
    self.backgroundColor = [UIColor whiteColor];
    
    _numberOfTab = numberOfTab;
    _selectedTab = 1;
    _sepHeiht = self.frame.size.height * 2/3;
    _tabWidth = (self.frame.size.width / numberOfTab);
    _tabWidth = MAX(_tabWidth, (int)(self.frame.size.width / 3.5));
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.scrollEnabled = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(_tabWidth * numberOfTab, _scrollView.contentSize.height);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:_numberOfTab];
    self.sepViews = [[NSMutableArray alloc]init];
    
    for (int i=0;i<_numberOfTab;i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake( i * ceil(_tabWidth), 0, ceil(_tabWidth), self.frame.size.height );
        btn.tag = (i + 1);
        btn.selected = (btn.tag == _selectedTab);
        [btn setTitleColor:DEF_COLOR(117, 105, 119) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [btn addTarget:self action:@selector(onTabButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView addSubview:btn];
        [tmp addObject:btn];
        
        if(i < numberOfTab - 1)   //中间的分隔线
        {
            UIImageView *sepView = [[UIImageView alloc]initWithFrame:CGRectMake((i + 1) * ceil(_tabWidth), (self.frame.size.height - _sepHeiht)/2, 1, _sepHeiht)];
            sepView.backgroundColor = [UIColor darkGrayColor];
            [_scrollView addSubview:sepView];
            [self.sepViews addObject:sepView];
        }
        
    }
    _buttons = [NSArray arrayWithArray:tmp];
    
    //底部的线
    self.bottomLineView.frame = CGRectMake(0, self.frame.size.height - 1, _scrollView.contentSize.width, 1);
    [_scrollView addSubview:self.bottomLineView];
    
    // orange hover
    UIImageView *hover = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, _tabWidth, 2)];
    //        hover.image = [UIImage imageNamed:@"common_hover"];
    hover.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    [_scrollView addSubview:hover];
    
    _hoverView = hover;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width/_numberOfTab;
    width = MAX(width, (int)(self.frame.size.width / 3.5));
    _sepHeiht = self.frame.size.height * 2/3;
    
    if (_tabWidth != width) {
        _tabWidth = width;
        
        // relayout if width updated
        for (int i=0;i<_numberOfTab;i++) {
            UIButton *btn = (UIButton *)[self.buttons objectAtIndex:i];
            btn.frame = CGRectMake(i * ceil(_tabWidth), 0, ceil(_tabWidth), self.frame.size.height);
            
            
            if(i < _numberOfTab - 1)
            {
                UIImageView *imageView = (UIImageView *)[self.sepViews objectAtIndex:i];
                imageView.frame = CGRectMake((i + 1) * ceil(_tabWidth), (self.frame.size.height - _sepHeiht)/2, imageView.frame.size.width, _sepHeiht);
            }
            
        }
        
        CGRect hRect = self.hoverView.frame;
        hRect.origin.y = self.frame.size.height - hRect.size.height;
        hRect.size.width = ceil(_tabWidth);
        self.hoverView.frame = hRect;
        
        self.scrollView.contentSize = CGSizeMake(_tabWidth * _numberOfTab, _scrollView.contentSize.height);
        
        hRect = self.bottomLineView.frame;
        hRect.size.width = self.scrollView.contentSize.width;
        self.bottomLineView.frame = hRect;
    }
}

#pragma mark - Override

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled {
    [super setUserInteractionEnabled:userInteractionEnabled];
    
    if (userInteractionEnabled) {
        [self.maskView removeFromSuperview];
    } else {
        [self addSubview:self.maskView];
    }
}

#pragma mark - Hover view

#pragma  mark - setHover property
- (void)setHoverViewBackgroundColor:(UIColor *)hoverColor
{
    [self.hoverView setBackgroundColor:hoverColor];
}

- (void)setHoverViewImage:(UIImage *)aImage
{
    [self.hoverView setImage:aImage];
}

- (void)setSeparteViewBackgroundColor:(UIColor *)sepColor
{
    for (UIImageView *sep in self.sepViews)
    {
        [sep setBackgroundColor:sepColor];
    }
}

- (void)setSeparteViewImage:(UIImage *)aImage
{
    for(UIImageView *sep in self.sepViews)
    {
        [sep setImage:aImage];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGRect rect = self.hoverView.frame;
    rect.origin.x = (scrollView.contentOffset.x / _numberOfTab) * (self.scrollView.contentSize.width / scrollView.frame.size.width);
    self.hoverView.frame = rect;
    
    //    if (scrollView.isDragging) {
    int currentTab = ((int)(rect.origin.x)/(int)(rect.size.width - 1) + 1);
    if (currentTab != _selectedTab) {
        _selectedTab = currentTab;
        
        for (UIButton *btn in self.buttons) {
            if (btn.tag == _selectedTab) {
                btn.selected = YES;
            } else {
                btn.selected = NO;
            }
        }
    }
    //    }
    self.scrollView.contentOffset = CGPointMake(MAX(0, MIN(rect.origin.x/_numberOfTab, self.scrollView.contentSize.width - self.scrollView.frame.size.width)), 0);
}

- (void)setSelectedTab:(NSInteger)selectedTab
{
    if(_selectedTab != selectedTab)
    {
        _selectedTab = selectedTab;
        
        for (UIButton *btn in self.buttons) {
            //             [btn setSelected:(btn.tag == _selectedTab ? YES : NO)];
            if (btn.tag == _selectedTab) {
                [self onTabButtonTouchUp:btn];
            }
            
        }
    }
}

#pragma mark - UIButton Event

- (void)onTabButtonTouchUp:(UIButton *)button {
    if (button.selected) return;
    
    for (UIButton *btn in self.buttons) {
        if (btn == button) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
    CGRect rect = self.hoverView.frame;
    rect.origin.x = _tabWidth * (button.tag - 1);
    
    _selectedTab = (int)button.tag;
    if ([self.delegate respondsToSelector:@selector(tabViewDidChanged: selectIndex:)]) {
        [self.delegate tabViewDidChanged:self selectIndex:_selectedTab - 1];
    }
    
    [UIView animateWithDuration:0.3 animations:^() {
        self.hoverView.frame = rect;
    } completion:^(BOOL finished) {
    }];
}

- (void)setTabTitle:(NSString *)title tabImage:(UIImage *)image forTab:(NSUInteger)tab {
    if (self.numberOfTab > tab) {
        UIButton *btn = [self.buttons objectAtIndex:tab];
        
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setImage:image forState:UIControlStateNormal];
        
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    }
}

- (void)setTabTitle:(NSString *)title  forTab:(NSUInteger)tab {
    if (self.numberOfTab > tab) {
        UIButton *btn = [self.buttons objectAtIndex:tab];
        
        [btn setTitle:title forState:UIControlStateNormal];
        
    }
}

#pragma mark - Factory Method

- (UIView *)maskView {
    if (_maskView == nil) {
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = rgba(0, 0, 0, 0.5);
    }
    return _maskView;
}

- (UIView *)bottomLineView {
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLineView.backgroundColor = [UIColor lightGrayColor];
        _bottomLineView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    }
    return _bottomLineView;
}



@end
