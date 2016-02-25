//
//  SGEaxpleTableViewViewController.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/19.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "SGEaxpleTableViewViewController.h"

@interface SGEaxpleTableViewViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *exTableView;

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) NSString *showText;

@end

@implementation SGEaxpleTableViewViewController

- (instancetype)initWthBackGroundColor:(UIColor *)bgColor showText:(NSString *)text
{
    self = [super init];
    if(self)
    {
        self.bgColor = bgColor;
        self.showText = text;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.exTableView.backgroundColor = self.bgColor;
    
    [self.view addSubview:self.exTableView];
    
}

#pragma mark - Override
- (UIScrollView *)mainScrollViewForSegment
{
    return self.exTableView;
}

#pragma  mark - UITableView Delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = self.bgColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.showText;
    
    return cell;
}


#pragma mark - UIFactory
- (UITableView *)exTableView
{
    if(!_exTableView)
    {
        _exTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
//        _exTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _exTableView.delegate = self;
        _exTableView.dataSource = self;
        [_exTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _exTableView;
}

@end
