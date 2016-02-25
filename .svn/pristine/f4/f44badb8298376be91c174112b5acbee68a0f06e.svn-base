//
//  AdsPageExampleViewController.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/18.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "AdsPageExampleViewController.h"
#import "AdsPageView.h"

@interface AdsPageExampleViewController ()<UITableViewDataSource,UITableViewDelegate,AdsPageViewDelegate>

@property (nonatomic, strong) AdsPageView *localAdsPageView;   /**<本地图片轮播*/
@property (nonatomic, strong) AdsPageView *netWorkAdsPageView;  /**<网络图片轮播*/


@property (nonatomic, strong) UITableView *adsTableView;

@end

@implementation AdsPageExampleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)creatNavgationItem
{
    self.navigationItem.title = self.model.title;
}

- (void)creatContentView
{
    [self.view addSubview:self.adsTableView];
}


#pragma mark - AdsPageViewDelegate
- (void)adsPageView:(AdsPageView *)pageView clickPageIndex:(NSInteger)index
{
    if(pageView == _localAdsPageView)
    {
        NSLog(@"本地轮播第%@张",@(index));
    }
    if(pageView == _netWorkAdsPageView)
    {
       NSLog(@"网络轮播第%@张",@(index));
    }
}

#pragma mark - UITableView Delegate DataSouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [UILabel new];
    [headerLabel setFrame:CGRectMake(0, 0, KScreenWidth, 20)];
    headerLabel.textAlignment = NSTextAlignmentCenter;
 
    headerLabel.text = (section == 0)? @"本地图片轮播":@"网络图片轮播";
    
    return headerLabel;
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adsPageViewCell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adsPageViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //放这里可以重用
        AdsPageView *adspageView = [[AdsPageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
        adspageView.tag = 1000;
        [cell.contentView addSubview:adspageView];
    }
    if(indexPath.section == 0)   //本地
    {
        self.localAdsPageView = (AdsPageView *)[cell viewWithTag:1000];
        self.localAdsPageView.delegate = self;
        [self.localAdsPageView startAdsWithImages:[self localImages] timerInterval:2.0f];
    }
    else       //网络
    {
        self.netWorkAdsPageView = (AdsPageView *)[cell viewWithTag:1000];
        self.netWorkAdsPageView.delegate = self;
        [self.netWorkAdsPageView startAdsWithImages:[self netWorkImages] timerInterval:2.0f placeholderImage:[UIImage imageNamed:@"default_ads"]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - UIFactory
- (UITableView *)adsTableView
{
    if(!_adsTableView)
    {
        _adsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)   style:UITableViewStyleGrouped];
        _adsTableView.delegate = self;
        _adsTableView.dataSource = self;
    }
    return _adsTableView;
}

- (NSArray *)localImages
{
    return @[@"adsImage1",@"adsImage2",@"adsImage3"];
}


- (NSArray *)netWorkImages
{
    return @[
             @"http://img3.tuniucdn.com/u/mainpic/index/201507/tnbb_sy.jpg",
             @"http://img4.tuniucdn.com/u/mainpic/index/201508/RAV41.jpg",
             @"http://img4.tuniucdn.com/u/mainpic/index/201508/816hyr1.jpg"
             ];
}

@end
