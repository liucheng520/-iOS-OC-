//
//  YuYModel.h
//  武汉二部iOS基础框架
//
//  Created by yuy on 15/11/24.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,YuYType)
{
    YuYTypeUI = 0
};

@interface YuYModel : NSObject

@property (nonatomic, strong) NSString  *title ;  /**<标题*/
@property (nonatomic, strong) NSString  *describtion; /**<描述*/
@property (nonatomic, strong) NSString  *creatTime;   /**<创建时间*/
@property (nonatomic, strong) NSString  *viewController;  /**<控制器名称*/
@property (nonatomic, assign) YuYType   type;/**<类型*/
@end
