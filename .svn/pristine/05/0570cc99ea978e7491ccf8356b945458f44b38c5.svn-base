//
//  SelectSegmentView.m
//  ObjectiveDemo
//
//  Created by yuy on 15/8/13.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "SelectSegmentView.h"
#define DEF_COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define selectLineColor DEF_COLOR(236,161,30)  //定义被选中按钮和下划线的颜色
@implementation SelectSegmentView
{
    NSInteger         sumNumber;//总共有多少个点击按钮
    int         currentFontSize;
    NSMutableArray     *btnArray;
    //选择线
    UIImageView  *selectLine;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame WithSelectNumber:(NSInteger)number WithTitleArray:(NSArray *)titleArray WithFontSize:(int)fontSize
{
    self =  [super initWithFrame:frame];
    if (self) {
        sumNumber=number;
        currentFontSize=fontSize;
        btnArray=[[NSMutableArray alloc]initWithCapacity:0];
        [btnArray addObjectsFromArray:titleArray];
        [self initSelectBtnView];
        }
    return self;
}
-(void)initSelectBtnView
{
    //选中按钮是的选中线
    selectLine=[[UIImageView alloc]init];
       selectLine.backgroundColor=selectLineColor;
    [self addSubview:selectLine];

    //按钮设置
    for (int i=0; i<sumNumber; i++) {
        UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(i*(self.frame.size.width/sumNumber),0, self.frame.size.width/sumNumber, self.frame.size.height);
        button.titleLabel.font=[UIFont systemFontOfSize:currentFontSize];
        [button setTitle:[btnArray objectAtIndex:i] forState:UIControlStateNormal];
        if (i==0)
        {
            [button setTitleColor:selectLineColor forState:UIControlStateNormal];
            selectLine.frame=CGRectMake(i*(self.frame.size.width/sumNumber), self.frame.size.height-2, self.frame.size.width/sumNumber, 2);
        }
        else
        {
            [button setTitleColor:DEF_COLOR(0, 0, 0) forState:UIControlStateNormal];
            
            //每个按钮之间的竖线
            UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*(self.frame.size.width/sumNumber)-0.5, 5, 1, self.frame.size.height-10)];
            imageView.backgroundColor=DEF_COLOR(210, 210, 210);
            [self addSubview:imageView];
            
//            //给按钮添加图标
//            if (i==1)
//            {
//                [button setImage:[UIImage imageNamed:@"arraw"] forState:UIControlStateNormal];
//                button.titleLabel.textAlignment=NSTextAlignmentRight;
//                 button.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, (self.frame.size.width/sumNumber/2));
//                button.imageEdgeInsets=UIEdgeInsetsMake(0, (self.frame.size.width/sumNumber/2), 0,0);
//              button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//            }
        }
        
        [button addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i+1000;
        [self addSubview:button];
    }
    //下边线
    UIImageView  *bottomLine=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    bottomLine.backgroundColor=DEF_COLOR(240, 240, 240);
    [self addSubview:bottomLine];

}
/**
 *  各个按钮的点击事件的描述
 *
 *  @param sender 按钮
 */
-(void)selectBtnClick:(UIButton *)sender
{
    long int  currentSelectIndex = sender.tag-1000;
    for (int i=0; i<sumNumber; i++)
    {
        if (currentSelectIndex==i)
        {
            [sender setTitleColor:selectLineColor forState:UIControlStateNormal];
             selectLine.frame=CGRectMake(i*(self.frame.size.width/sumNumber), self.frame.size.height-2, self.frame.size.width/sumNumber, 2);
        }
        else
        {
            UIButton * button=(UIButton *)[self viewWithTag:i+1000];
             [button setTitleColor:DEF_COLOR(0, 0, 0) forState:UIControlStateNormal];
        }
    }
    
    
    if ([self.delegate respondsToSelector:@selector(selectBtnIndex:)] ) {
        {
            [self.delegate selectBtnIndex:currentSelectIndex];
        }
    }
}

@end
