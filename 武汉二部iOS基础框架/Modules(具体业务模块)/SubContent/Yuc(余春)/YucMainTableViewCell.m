//
//  YucMainTableViewCell.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/18.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "YucMainTableViewCell.h"
#import "NSString+EMAdditions.h"

@implementation YucMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setCellValuesWithData:(YuCModel *)model
{
    self.titleLabel.text = model.title;
    self.creatTimeLabel.text = model.creatTime;
    self.detailLabel.attributedText = model.describtion.attributedString;
}


@end
