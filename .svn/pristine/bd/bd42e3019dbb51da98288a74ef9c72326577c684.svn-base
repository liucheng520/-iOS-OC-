//
//  YuYController.m
//  武汉二部iOS基础框架
//
//  Created by 苏荷 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "YuYController.h"
#import "YuYMainTableViewCell.h"
#import "YuYModel.h"

#define cellIdentifier @"cellIdentifier"

@interface YuYController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray<YuYModel *> *dataSourceArray;
@end
@implementation YuYController

-(void)viewDidLoad
{
    [self initView];
}

-(void)initView{
    
    UITableView * tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , KScreenWidth, KScreenHeight)];
    tabView.backgroundColor = DEF_COLOR(236, 236, 236);
    tabView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tabView.estimatedRowHeight = 44.f;
    tabView.rowHeight = UITableViewAutomaticDimension;
    tabView.delegate = self;
    tabView.dataSource = self;
    self.tableView = tabView;
    [self.view addSubview:tabView];
    [tabView registerNib:[UINib nibWithNibName:@"YuYMainTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier];
    tabView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YuYMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = 0;
    cell.model = [self.dataSourceArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YuYModel *selectModel = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    Class someClass = NSClassFromString(selectModel.viewController);
    
    if(someClass == nil)
    {
        NSLog(@"找不到当前类：%@",selectModel.viewController);
        return;
    }
    
    id viewController = [someClass alloc];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSMutableArray<YuYModel *> *)dataSourceArray
{
    if(!_dataSourceArray)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"YY_Menu_List" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        
        _dataSourceArray = (NSMutableArray<YuYModel *> *)[YuYModel objectArrayWithKeyValuesArray:data[@"YyUI"]];
        
    }
    return _dataSourceArray;
}

@end
