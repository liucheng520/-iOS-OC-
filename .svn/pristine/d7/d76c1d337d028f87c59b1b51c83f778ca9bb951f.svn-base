//
//  AdsPageView.h
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/18.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdsPageView;

@protocol AdsPageViewDelegate <NSObject>

//代理实现点击相对应的广告页的响应方式
- (void)adsPageView:(AdsPageView *)pageView clickPageIndex:(NSInteger)index;

@end


@interface AdsPageView : UIView

@property(nonatomic, assign) BOOL                     bWebImage; //设置是否为网络图片 默认为NO (本地图片)
@property(nonatomic, weak) id<AdsPageViewDelegate>    delegate;

/**
 *  启动函数
 *
 *  @param imageArray 设置图片数组 如果图片数组为空或者数组的count为1，则轮播时间无效（不轮播）为0s
 *
 */
- (void)startAdsWithImages:(NSArray*)imageArray timerInterval:(NSTimeInterval)interval;

//用于加载网络图片
//带默认图片  bWebImage 默认为YES;
- (void)startAdsWithImages:(NSArray *)imageArray timerInterval:(NSTimeInterval)interval placeholderImage:(UIImage *)placeholderImage;



@end
