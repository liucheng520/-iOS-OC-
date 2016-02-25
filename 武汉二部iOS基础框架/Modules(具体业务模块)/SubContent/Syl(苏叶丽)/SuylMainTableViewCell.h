//
//  SuylMainTableViewCell.h
//  武汉二部iOS基础框架
//
//  Created by suyl on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuylModel.h"

@interface SuylMainTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *creatTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *detailLabel;

@property(nonatomic,strong)SuylModel *model;

@end
