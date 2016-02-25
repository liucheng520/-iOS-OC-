//
//  YCImagePagesViewController.h
//  俄官方的方式提供撒
//
//  Created by Scott on 15/12/25.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCImageViewController.h"
#import "ZoomTransition.h"

@class YCPhotosPageViewController;

@protocol PhotosPageViewDelegate <NSObject>

@optional
//for 单个Section（单层次）的委托
- (void)PhotosPageViewControlller:(YCPhotosPageViewController *)photosVC didChangedBackIndex:(NSInteger)index;

//多个Section(多层次)的委托
- (void)PhotosPageViewControlller:(YCPhotosPageViewController *)photosVC didChangedBackIndexPath:(NSIndexPath *)indexPath;

@end



@interface YCPhotosPageViewController : UIViewController<ZoomTransitionProtocol>

@property (nonatomic,weak) id<PhotosPageViewDelegate> delegate;

@property (nonatomic, assign) BOOL needsShowToolBar;   //default is NO

- (instancetype)initWithPhotos:(NSArray *)photos currentIndex:(NSInteger)curIndex;


@end
