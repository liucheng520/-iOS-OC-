//
//  BaseTabViewCell.m
//  武汉二部iOS基础框架
//
//  Created by 刘成 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "BaseTabViewCell.h"

@implementation BaseTabViewCell

+ (BaseTabViewCell *)cellWithTableView:(UITableView *)tableview
{
    NSString *identifier = NSStringFromClass([self class]);
    BaseTabViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatSubviews];
    }
    return self;
}

- (void)creatSubviews
{
    UIImageView *line = [[UIImageView alloc]init];
    [line setBackgroundColor:rgba(150, 150, 150, 0.3)];
    [self.contentView addSubview:line];
    self.line = line;
}

@end
