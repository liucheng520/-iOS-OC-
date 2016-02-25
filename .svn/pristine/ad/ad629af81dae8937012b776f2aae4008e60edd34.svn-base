//
//  Common.h
//  YMProject
//
//  Created by sam.l on 14-10-27.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

//根据颜色生产图片
+ (UIImage *)createImageByColor:(UIColor *)color;

//check NSNULL返回id
+(id)checkNSNull:(id)obj;

//计算文本长度
+(float)getNSStringWidth:(NSString*)str font:(UIFont*)theFont;

//拼接请求字符串
+(NSString*)getURLParamstring:(NSString*)json;

//时间戳转换为时间格式
+(NSDate *)NSDateFromNSString:(NSString *)date;

//时间戳转换为字符串格式
+(NSString *)yearFromAPIDate:(NSString*)date;

+(NSString *)dataFromAPIDate:(NSString*)date;

//MD5加密，用于登录和服务器同步加密
+(NSString*)encodeMD5:(NSString*)stringmd5;

//错误信息
+ (NSString *)errorInfo:(NSString *)errorId;

//提示成功提问 成功收藏 成功点赞
+ (void)tipWith:(NSString *)title;

// 对图片压缩处理
+(UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize image:(UIImage*)image;

//  文字改变字体大小
//+(NSMutableAttributedString *)
//  文字改变字体颜色

//  格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;


//在view里找到对应的viewcontroller
+ (UIViewController*)viewController:(UIView *)view;

//计算字符的长度 包含中文
+(float)getLengthWithChinese:(NSString *)str;
@end
