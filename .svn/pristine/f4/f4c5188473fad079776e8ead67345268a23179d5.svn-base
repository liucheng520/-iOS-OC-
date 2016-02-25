//
//  PopupSelectorViewController.m
//  武汉二部iOS基础框架
//
//  Created by yuy on 15/11/24.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "PopupSelectorViewController.h"
#import "SelectSegmentView.h"
#import "CustomAlertView.h"
#import "PopupSelectView.h"
@interface PopupSelectorViewController ()<SegmentSelectDelegate,CustomAlertViewDelegate,PopupSelectViewDelegate>
@property (nonatomic,strong) CustomAlertView *alertView;
@property (nonatomic,strong)PopupSelectView * selectView;
@end

@implementation PopupSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PopupSelector";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initSegmentView];
}

-(void)initSegmentView
{
   NSArray * array = [NSArray arrayWithObjects:@"行程计划",@"行程明细",@"预算明细",@"装备清单",@"线下活动",nil];
    NSMutableArray * array1 = [NSMutableArray arrayWithObjects:@"主题游",@"深度游",@"主题",@"深度", nil];
    
    SelectSegmentView * selectSegmentView=[[SelectSegmentView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 40) WithSelectNumber:array.count WithTitleArray:array WithFontSize:14];
    selectSegmentView.delegate=self;
    selectSegmentView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:selectSegmentView];
    
    //每行的默认高度 44，若要修改需要在PopupSelectView中同时修改cell的高度
    self.selectView=[[PopupSelectView alloc]initWithFrame:CGRectMake(0, 40, KScreenWidth/4, array1.count*44)  delegate:self scrollBounces:NO];
    self.selectView.selectArray = array1;
    self.selectView.hidden=YES;
    self.selectView.backgroundColor=rgba(240,240,240, 0.5);
    [self.view addSubview:self.selectView];
   
}

#pragma mark - 切换界面代理
-(void)selectBtnIndex:(long int)index
{
    NSLog(@"您当前点击的是索引为%ld的按钮",index);
    if (index < 4)
    {
        self.selectView.frame=CGRectMake(KScreenWidth*index/5, 40, KScreenWidth/4, self.selectView.selectArray.count*44);
    }
    else
    {
        self.selectView.frame=CGRectMake(KScreenWidth-KScreenWidth/self.selectView.selectArray.count, 40, KScreenWidth/4, self.selectView.selectArray.count*44);
    }
    self.selectView.hidden = NO;
    
}
#pragma mark -  自定义选择框代理
- (void)PopUpSelectClickWithIndex:(NSInteger)clickIndex
{
    self.selectView.hidden = YES;
    _alertView = [[CustomAlertView alloc]initWithTitle:@"提示" titleImage:@"jinggao" message:@"您输入的账号不正确" delegate:self sureButtonTitle:@"知道了" ];
    [_alertView show];
    //    _alertView = [[CustomAlertView alloc]initWithTitle:@"提示" titleImage:@"jinggao" message:@"您输入的账号不正确" delegate:self cancelButtonTitle:@"不想理你" otherButtonTitles:@"知道了" ];
    //    [_alertView show];
}
#pragma mark -  自定义弹出框代理
- (void)customAlertViewWithButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"click alertView index %ld",(long)buttonIndex);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.selectView.hidden = YES;
}

@end
