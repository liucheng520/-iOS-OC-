//
//  GetInController.m
//  武汉二部iOS基础框架
//
//  Created by 刘成 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "GetInController.h"
#import "GetInCell.h"

#import "FujController.h"
#import "LiuCController.h"
#import "LuGController.h"
#import "QuanHController.h"
#import "SBWController.h"
#import "SuYLController.h"
#import "WangXController.h"
#import "WuJController.h"
#import "YuCController.h"
#import "YuYController.h"

@interface GetInController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSArray *showData;

@end

@implementation GetInController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpShowGroup];
}

- (void)creatContentView
{
    UITableView *tableView = [[UITableView alloc]init];
    [tableView setBackgroundColor:DEF_COLOR(242, 242, 242)];
    tableView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
}

- (void)setUpShowGroup
{
    //刘成
    Member *liuC = [[Member alloc]init];
    liuC.iconUrl = @"activity_identitycell_icon";
    liuC.nickName = @"刘成";
    liuC.personality = @"简简单单就是福";
    liuC.destClass = [LiuCController class];
    
    Member *Syl = [[Member alloc]init];
    Syl.iconUrl = @"activity_identitycell_icon";
    Syl.nickName = @"苏叶丽";
    Syl.personality = @"简简单单就是福";
    Syl.destClass = [SuYLController class];
    
    Member *Wj = [[Member alloc]init];
    Wj.iconUrl = @"activity_identitycell_icon";
    Wj.nickName = @"吴婧";
    Wj.personality = @"简简单单就是福";
    Wj.destClass = [WuJController class];
    
    Member *yuC = [[Member alloc]init];
    yuC.iconUrl = @"YC_person_image";
    yuC.nickName = @"余春(Scott Yu)";
    yuC.personality = @"会偷懒的程序员。。。喜欢偷懒";
    yuC.destClass = [YuCController class];
    
    Member *YuY = [[Member alloc]init];
    YuY.iconUrl = @"code";
    YuY.nickName = @"余勇";
    YuY.personality = @"Hello,EveryOne";
    YuY.destClass = [YuYController class];
    
    Member *QuanH = [[Member alloc]init];
    QuanH.iconUrl = @"activity_identitycell_icon";
    QuanH.nickName = @"权海";
    QuanH.personality = @"简简单单就是福";
    QuanH.destClass = [QuanHController class];
    
    Member *Lug = [[Member alloc]init];
    Lug.iconUrl = @"activity_identitycell_icon";
    Lug.nickName = @"卢刚";
    Lug.personality = @"简简单单就是福";
    Lug.destClass = [LuGController class];
    
    Member *Fuj = [[Member alloc]init];
    Fuj.iconUrl = @"activity_identitycell_icon";
    Fuj.nickName = @"付敬";
    Fuj.personality = @"简简单单就是福";
    Fuj.destClass = [FujController class];
    
    Member *SiBW = [[Member alloc]init];
    SiBW.iconUrl = @"activity_identitycell_icon";
    SiBW.nickName = @"施博文";
    SiBW.personality = @"简简单单就是福";
    SiBW.destClass = [SBWController class];
    
    Member *WangX = [[Member alloc]init];
    WangX.iconUrl = @"activity_identitycell_icon";
    WangX.nickName = @"王享";
    WangX.personality = @"简简单单就是福";
    WangX.destClass = [WangXController class];
    
    self.showData = @[liuC,Syl,Wj,yuC,YuY,QuanH,Lug,Fuj,SiBW,WangX];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.showData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GetInCell *cell = [GetInCell cellWithTableView:tableView];
    cell.model = self.showData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Member *mem = self.showData[indexPath.row];
    BaseViewController *destCtrl = [[mem.destClass alloc]init];
    destCtrl.title = mem.nickName;
    [self.navigationController pushViewController:destCtrl animated:YES];
}

@end
