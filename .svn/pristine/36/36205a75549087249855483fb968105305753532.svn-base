//
//  SuYLController.m
//  武汉二部iOS基础框架
//
//  Created by 苏荷 on 15/9/24.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "SuYLController.h"
#import "WebHeightViewController.h"
#import "SuylMainTableViewCell.h"
#import "SuylModel.h"

#define cellIdentifier @"cellIdentifier"

@interface SuYLController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray<SuylModel *> *dataSourceArray;
@end
@implementation SuYLController

-(void)viewDidLoad{
    
   
    [self initView];
}

-(void)initView{
    
    UITableView * tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , KScreenWidth, KScreenHeight)];
    tabView.backgroundColor = DEF_COLOR(236, 236, 236);
    tabView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tabView.rowHeight = UITableViewAutomaticDimension;
    tabView.estimatedRowHeight = 44.f;
    tabView.delegate = self;
    tabView.dataSource = self;
    self.tableView = tabView;
    [self.view addSubview:tabView];
    [tabView registerNib:[UINib nibWithNibName:@"SuylMainTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier];
    tabView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuylMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = 0;
    cell.model = [self.dataSourceArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row==0) {
//        //webView计算高度
//        WebHeightViewController *web = [[WebHeightViewController alloc] init];
//        [self.navigationController pushViewController:web animated:YES];
//    }
    SuylModel *selectModel = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    Class someClass = NSClassFromString(selectModel.viewController);
    
    if(someClass == nil)
    {
        NSLog(@"找不到当前类：%@",selectModel.viewController);
        return;
    }
    
    id viewController = [someClass alloc];
       [self.navigationController pushViewController:viewController animated:YES];
}

- (NSMutableArray<SuylModel *> *)dataSourceArray
{
    if(!_dataSourceArray)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ScottYu_MenueList" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        
        _dataSourceArray = (NSMutableArray<SuylModel *> *)[SuylModel objectArrayWithKeyValuesArray:data[@"SuylUI"]];
        
    }
    return _dataSourceArray;
}

@end
