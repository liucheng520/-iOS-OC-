//
//  YuCModel.h
//  武汉二部iOS基础框架
//
//  Created by Scott on 15/11/17.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,YCType)
{
    YCTypeUI = 0
};


@interface YuCModel : NSObject

@property (nonatomic, strong) NSString  *title ;  /**<标题*/
@property (nonatomic, strong) NSString  *describtion; /**<描述*/
@property (nonatomic, strong) NSString  *creatTime;   /**<创建时间*/
@property (nonatomic, strong) NSString  *viewController;  /**<控制器名称*/
@property (nonatomic, assign) YCType     type;            /**<类型*/

@end

@protocol YuCModel <NSObject>

@end
