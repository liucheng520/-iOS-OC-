//
//  SuylMainTableViewCell.m
//  武汉二部iOS基础框架
//
//  Created by suyl on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "SuylMainTableViewCell.h"

@implementation SuylMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(SuylModel *)model
{
    self.titleLabel.text = model.title;
    self.creatTimeLabel.text = model.creatTime;
    self.detailLabel.text = model.describtion;
}

@end
