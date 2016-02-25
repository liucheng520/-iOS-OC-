//
//  SelectSegmentView.h
//  ObjectiveDemo
//
//  Created by yuy on 15/8/13.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//  自定义的简单的segment

#import <UIKit/UIKit.h>

@protocol SegmentSelectDelegate <NSObject>
/**
 *  多个按钮之间切换的代理方法
 *
 *  @param index 按钮的索引值，开始值为1
 */
-(void)selectBtnIndex:(long int)index;

@end
@interface SelectSegmentView : UIView

@property (nonatomic,weak)id<SegmentSelectDelegate> delegate;

-(id)initWithFrame:(CGRect)frame WithSelectNumber:(NSInteger)number WithTitleArray:(NSArray *)titleArray WithFontSize:(int)fontSize;
@end
