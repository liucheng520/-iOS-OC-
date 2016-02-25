//
//  CustomAlertView.h
//  武汉二部iOS基础框架
//
//  Created by yuy on 15/11/24.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//  弹出框alertView
//

/**
 *调用此类时要打点调用  如：@property (nonatomic,strong) CustomAlertView *alertView;
 *_alertView = [[CustomAlertView alloc]initWithTitle:@"提示" titleImage:@"jinggao" message:@"您输入的账号不正确" delegate:self sureButtonTitle:@"知道了" ];
 *[_alertView show];
 *
 *  @param
 */
#import <UIKit/UIKit.h>
@protocol CustomAlertViewDelegate <NSObject>
/**
 *
 *
 *  @param
 */
- (void)customAlertViewWithButtonAtIndex:(NSInteger)buttonIndex;

@end
@interface CustomAlertView : UIView

@property (nonatomic,assign)id<CustomAlertViewDelegate> delegate;

-(id)initWithTitle:(NSString *)title titleImage:(NSString *)titleImage message:(NSString *)message delegate:(id)delegate sureButtonTitle:(NSString *)sureButtonTitle ;

-(id)initWithTitle:(NSString *)title titleImage:(NSString *)titleImage message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;
-(void)show;
@end
