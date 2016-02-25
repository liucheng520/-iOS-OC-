//
//  PopupSelectView.h
//  武汉二部iOS基础框架
//
//  Created by yuy on 15/11/25.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//
/*
 * An example of using this class 
 //每行的默认高度 44，若要修改需要在PopupSelectView中同时修改cell的高度
 self.selectView=[[PopupSelectView alloc]initWithFrame:CGRectMake(0, 40, KScreenWidth/4, array1.count*44)  delegate:self scrollBounces:NO];
 self.selectView.selectArray = array1;
 self.selectView.hidden=YES;
 self.selectView.backgroundColor=rgba(240,240,240, 0.5);
 [self.view addSubview:self.selectView];
 */
#import <UIKit/UIKit.h>

#define TABLEVIEW_ROWHEIGHT             44.0f       // cell的高度
#define CELL_LINE_LEFT_DISTANCE         10          // cell分割线距左边的间距
#define CELL_LINE_RIGHT_DISTANCE        10          // cell分割线距右边的间距

@protocol PopupSelectViewDelegate <NSObject>
/**
 *
 *
 *  @param
 */
- (void)PopUpSelectClickWithIndex:(NSInteger)clickIndex;

@end
@interface PopupSelectView : UIView
@property (nonatomic,assign)id<PopupSelectViewDelegate> delegate;
@property(nonatomic,strong)UITableView    * tableView;
@property(nonatomic,strong)NSMutableArray * selectArray;
/**
 *
 *  @param delegate     代理
 *  @param bounces      是否可滑动
 */
- (id)initWithFrame:(CGRect)frame delegate:(id)delegate scrollBounces:(BOOL)bounces;
@end
