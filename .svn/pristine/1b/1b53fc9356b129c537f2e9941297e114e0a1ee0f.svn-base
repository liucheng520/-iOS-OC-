//
//  CustomAlertView.m
//  武汉二部iOS基础框架
//
//  Created by yuy on 15/11/24.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "CustomAlertView.h"
#define ALERTVIEW_HEIGHT        (KScreenWidth-60)*7/10
#define ALERTVIEW_WIDTH         (KScreenWidth-60)
#define ALERTVIEW_CENTER_X      KScreenWidth/2
#define ALERTVIEW_CENTER_Y      KScreenHeight/2

@interface CustomAlertView()


@property (nonatomic,strong) UIView *alertView;

@property (nonatomic,strong) UIView *AlphaView;

@property(nonatomic,weak)NSString * titie;
@property(nonatomic,weak)NSString * titleImage;
@property(nonatomic,weak)NSString * message;
@property(nonatomic,assign)id  delegateName;
@property(nonatomic,strong)NSMutableArray * allButtonTitles;
@property(nonatomic,assign)int number;
@end

@implementation CustomAlertView
-(id)initWithTitle:(NSString *)title titleImage:(NSString *)titleImage message:(NSString *)message delegate:(id)delegate sureButtonTitle:(NSString *)sureButtonTitle
{
    self =  [super initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    if (self) {
        self.titie = title;
        self.titleImage = titleImage;
        self.delegate=delegate;
        self.message = message;
        self.allButtonTitles = [[NSMutableArray alloc]initWithObjects:sureButtonTitle, nil];
        self.number = (int)self.allButtonTitles.count;
        [self alertViewWithButtonNumber:1];
        self.alertView.userInteractionEnabled = YES;
        self.AlphaView.userInteractionEnabled = YES;
    }
    return self;
}

-(id)initWithTitle:(NSString *)title titleImage:(NSString *)titleImage message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
    self =  [super initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    if (self) {
        self.titie = title;
        self.titleImage = titleImage;
        self.delegate=delegate;
        self.message = message;
        self.allButtonTitles = [[NSMutableArray alloc]initWithObjects:cancelButtonTitle,otherButtonTitles, nil];
         self.number = (int)self.allButtonTitles.count;
        [self alertViewWithButtonNumber:2];
    }
    return self;
}
- (void)show
{
//    [[UIApplication sharedApplication].keyWindow addSubview:self.AlphaView];
//    [[UIApplication sharedApplication].keyWindow addSubview:self.alertView];
    [[[[UIApplication sharedApplication]delegate]window] addSubview:_AlphaView];
    [[[[UIApplication sharedApplication]delegate]window] addSubview:_alertView];
}

-(void)alertViewWithButtonNumber:(int)number
{
    _AlphaView  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    _AlphaView.backgroundColor=rgba(200, 200, 200, 0.5);
//    _AlphaView.alpha=0.5;
    
    UITapGestureRecognizer * cancleOther =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelGestureClick)];
    [_AlphaView addGestureRecognizer:cancleOther];
    
    _alertView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT)];
    _alertView.center=CGPointMake(ALERTVIEW_CENTER_X, ALERTVIEW_CENTER_Y);
        _alertView.backgroundColor=[UIColor whiteColor];
    _alertView.layer.cornerRadius=5;
    _alertView.clipsToBounds = YES;
    
    
    UIView * topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT*3/4)];
    topView.backgroundColor=DEF_COLOR(250, 242, 194);
    [_alertView addSubview:topView];
    
    UIButton * titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [titleButton setTitle:[NSString stringWithFormat:@" %@",self.titie] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:self.titleImage] forState:UIControlStateNormal];
    [titleButton setTitleColor:DEF_COLOR(121, 23, 29) forState:UIControlStateNormal];
    titleButton.adjustsImageWhenHighlighted = NO;
    titleButton.frame = CGRectMake(0, 0, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT*1/4);
    [topView addSubview:titleButton];

    //message set
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(20,ALERTVIEW_HEIGHT*0.7/4, ALERTVIEW_WIDTH-20, ALERTVIEW_HEIGHT*2/4)];
    label.numberOfLines = 0;
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=DEF_COLOR(77, 53, 59);
    label.font = [UIFont systemFontOfSize:18];
    label.text=self.message;
    [topView addSubview:label];
    
    UIView * bottomView=[[UIView alloc]initWithFrame:CGRectMake(0,ALERTVIEW_HEIGHT*3/4, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT*1/4)];
    bottomView.backgroundColor=DEF_COLOR(121, 23, 29);
    [_alertView addSubview:bottomView];
    
    for (int i=0; i<number; i++)
    {
        UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[self.allButtonTitles objectAtIndex:i] forState:UIControlStateNormal];
        button.backgroundColor=[UIColor clearColor];
         button.tag = i;
        if (i == 0)
        {
            if (number == 1)
            {
                button.frame=CGRectMake(0,0, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT*1/4);
            }
            else
            {
                button.frame = CGRectMake(i*ALERTVIEW_WIDTH/2,0, ALERTVIEW_WIDTH/2, ALERTVIEW_HEIGHT*1/4);
            }
        }
        else
        {
             button.frame = CGRectMake(i*ALERTVIEW_WIDTH/2,0, ALERTVIEW_WIDTH/2, ALERTVIEW_HEIGHT*1/4);
        }
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:button];
    }
    
}

#pragma mark---

//-(void)sureBtnClick:(UIButton *)sender
//{
//    [_alertView removeFromSuperview];
//    [_AlphaView removeFromSuperview];
//    [self removeFromSuperview];
//    if ([self.delegate respondsToSelector:@selector(customAlertViewWithButtonAtIndex:)]) {
//        [self.delegate customAlertViewWithButtonAtIndex:sender.tag];
//    }
//    
//}
#pragma mark---

- (void)buttonClick:(UIButton *)sender
{
    [_alertView removeFromSuperview];
    [_AlphaView removeFromSuperview];
     [self removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(customAlertViewWithButtonAtIndex:)]) {
        [self.delegate customAlertViewWithButtonAtIndex:sender.tag];
    }
    
}
- (void)cancelGestureClick
{
    if (self.number != 1)
    {
        [_alertView removeFromSuperview];
        [_AlphaView removeFromSuperview];
        [self removeFromSuperview];
        if ([self.delegate respondsToSelector:@selector(customAlertViewWithButtonAtIndex:)]) {
            [self.delegate customAlertViewWithButtonAtIndex:0];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
