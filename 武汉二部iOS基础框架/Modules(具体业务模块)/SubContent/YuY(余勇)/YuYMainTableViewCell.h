//
//  YuYMainTableViewCell.h
//  武汉二部iOS基础框架
//
//  Created by yuy on 15/11/24.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YuYModel.h"
@interface YuYMainTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *creatTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *detailLabel;

@property(nonatomic,strong)YuYModel *model;
@end
