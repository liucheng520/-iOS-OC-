//
//  BaseTabViewCell.h
//  武汉二部iOS基础框架
//
//  Created by 刘成 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabViewCell : UITableViewCell

//实例方法创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableview;

//cell上子控件创建方法
- (void)creatSubviews;

@property (nonatomic,weak) UIImageView *line;

@end
