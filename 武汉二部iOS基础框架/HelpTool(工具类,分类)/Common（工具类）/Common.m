//
//  Common.m
//  YMProject
//
//  Created by sam.l on 14-10-27.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "Common.h"
#import "NSString+Extention.h"
@implementation Common

+(NSString*)encodeMD5:(NSString*)stringmd5
{
    return [stringmd5 MD5];
}
/**
 *根据颜色生成图片
 */
+(UIImage *)createImageByColor:(UIColor *)color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 *check NSNULL返回id
 */
+(id)checkNSNull:(id)obj{
    if (obj == [NSNull null]||obj==nil){
        obj=@"";
    }
    
    return obj;
}


//计算文本长度
+(float)getNSStringWidth:(NSString*)str font:(UIFont*)theFont
{
    float width=0.0f;
    
    NSDictionary *attribute = @{NSFontAttributeName:theFont};
    CGSize sizeName = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0)
                                        options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;

    width=sizeName.width;
    return width;
}

//获取系统当前时间
+(NSString*)getDateNow
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:MM:SS"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}



//拼接请求字符串
+(NSString*)getURLParamstring:(NSString*)json
{
    NSString * time=[Common getDateNow];
    NSString * accesstoken = [Common encodeMD5:[NSString stringWithFormat:@"%@%@",json,time]];
    
    NSMutableDictionary*Dicparameters=[[NSMutableDictionary alloc]init];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",json] forKey:@"accessParam"];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",time] forKey:@"accessTime"];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",accesstoken] forKey:@"accessToken"];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",@"2"] forKey:@"deviceId"];
    
    //拼接访问地址
    NSMutableString*sb=[[NSMutableString alloc]init];
    
    NSString*keyword=[Dicparameters objectForKey:@"accessParam"];
    if(keyword!=nil){
        if(![keyword isEqualToString:@""])
            [sb appendFormat:@"accessParam=%@&",keyword];
    }
    NSString*keytype=[Dicparameters objectForKey:@"accessTime"];
    if(keytype!=nil){
        if(![keytype isEqualToString:@""])
            [sb appendFormat:@"accessTime=%@&",keytype];
    }
    
    NSString*categoryId1=[Dicparameters objectForKey:@"accessToken"];
    if(categoryId1!=nil){
        if(![categoryId1 isEqualToString:@""])
            [sb appendFormat:@"accessToken=%@&",categoryId1];
    }
    NSString*categoryIdq=[Dicparameters objectForKey:@"deviceId"];
    if(categoryIdq!=nil){
        if(![categoryId1 isEqualToString:@""])
            [sb appendFormat:@"deviceId=%@&",categoryIdq];
    }
    
    NSString*strurl=[NSString stringWithString:sb];
    NSString*strtemp=[strurl substringFromIndex:[strurl length]-1];
    if([strtemp isEqualToString:@"&"])
    {
        strurl=[strurl substringToIndex:[strurl length]-1];
    }
    strurl = [strurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return strurl;
}

//时间搓转换为时间格式
+(NSDate *)NSDateFromNSString:(NSString *)date
{
    NSTimeInterval userTime = [date doubleValue];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy.MM.dd"];
    NSDate *da = [NSDate dateWithTimeIntervalSince1970:userTime];
    return da;
}

//时间搓转换为字符串格式
+(NSString *)yearFromAPIDate:(NSString*)date
{
    NSTimeInterval userTime = [date doubleValue];
    
    //设定时间格式,这里可以设置成自己需要的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // [dateFormatter setDateFormat:@"MM月dd"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    //这里比较关键,需要将NSTimeInterval除以1000
    NSString *iosDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime/1000]];
    return iosDate;
}

//时间搓转换为字符串格式
+(NSString *)dataFromAPIDate:(NSString*)date
{
    NSTimeInterval userTime = [date doubleValue];
    
    //设定时间格式,这里可以设置成自己需要的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // [dateFormatter setDateFormat:@"MM月dd"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];
    
    //这里比较关键,需要将NSTimeInterval除以1000
    NSString *iosDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime/1000]];
    return iosDate;
}

//错误信息
+ (NSString *)errorInfo:(NSString *)errorId{
    if ([errorId isEqualToString:@"param_error"]) {
        return @"参数错误";
    }else if ([errorId isEqualToString:@"system_access_error"]){
        return @"系统异常";
    }else if ([errorId isEqualToString:@"errorPassword"]){
        return @"密码错误";
    }else if ([errorId isEqualToString:@"errorUsername"]){
        return @"用户名错误";
    }else if ([errorId isEqualToString:@"username_exist"]){
        return @"用户名已经存在";
    }else if ([errorId isEqualToString:@"forbidLogin"]){
        return @"用户被禁止登陆";
    }else if ([errorId isEqualToString:@"code_error"]){
        return @"验证码错误";
    }else if ([errorId isEqualToString:@"code_delay"]){
        return @"验证码失效";
    }else if ([errorId isEqualToString:@"already_register"]){
        return @"手机号已经被注册了";
    }else if ([errorId isEqualToString:@"send_error"]){
        return @"发送验证码失败";
    }else if ([errorId isEqualToString:@"mobile_not_register"]){
        return @"手机号没有注册";
    }else{
        return @"";
    }
}

//提示成功提问 成功收藏 成功点赞
+ (void)tipWith:(NSString *)title{
    UIWindow * win = [[[UIApplication sharedApplication] delegate] window];
    __block UILabel *likeLable = nil;
    if (likeLable == nil) {
        likeLable=[[UILabel alloc]init];
        
        likeLable.backgroundColor=[UIColor blackColor];
        likeLable.layer.cornerRadius = 15;
        likeLable.layer.masksToBounds = YES;
        likeLable.alpha=0.8;
        likeLable.textAlignment=NSTextAlignmentCenter;
        likeLable.font=[UIFont systemFontOfSize:17];
        likeLable.text=title;
        CGRect rect =[title boundingRectWithSize:CGSizeMake(1000, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        likeLable.bounds = CGRectMake(0, 0, rect.size.width + 40, 30);
        //[likeLable sizeToFit];
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0&& [[[UIDevice currentDevice] systemVersion] floatValue]<=7.1) {
            likeLable.center = CGPointMake(100 , KScreenWidth/2);
            likeLable.transform =CGAffineTransformMakeRotation( M_PI_2);
        }else{
            likeLable.center =CGPointMake(KScreenWidth/2 , KScreenHeight - 100);
        }
        likeLable.textColor=[UIColor whiteColor];
        
        [UIView animateWithDuration:2 animations:^{
            //            likeLable.center = CGPointMake(KScreenWidth/2, KScreenHeight/2-80);
            likeLable.alpha = 1;
        } completion:^(BOOL finished)
         {
             [UIView animateWithDuration:1 animations:^{
                 [likeLable removeFromSuperview];
             }];
             likeLable = nil;
         }];
        
        [win addSubview:likeLable];
 
        
        
    }
    
}

#pragma mark - 对图片压缩处理
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize image:(UIImage*)image
{
    UIGraphicsBeginImageContext(targetSize);
    
    [image drawInRect:CGRectMake(0,0,targetSize.width,targetSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - 格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
//    return  [NSString stringWithFormat:@"%.1f",(floatV+0.05)];
}
/**
 *  在view里找到对应的viewcontroller
 *
 *  @param UIViewController view
 *
 *  @return UIViewController
 */
#pragma mark - 在view里找到对应的viewcontroller
+ (UIViewController*)viewController:(UIView *)view
{
    for (UIView* next = [view superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
    
}

//计算字符的长度 包含中文
+(float)getLengthWithChinese:(NSString *)str
{
    
//   const char *cString=[str UTF8String];
//   return  strlen(cString);
    float length = 0;
    if(str){
        
        for (int i=0; i<str.length;i++){
           NSRange range=NSMakeRange(i,1);
           NSString *subString=[str substringWithRange:range];
            const char *cString=[subString UTF8String];
            
            if (strlen(cString)==3)
            {
                NSLog(@"昵称是汉字");
                length+=2;
              
            }else{
                length++;
            }

                
        }
    }
        return length;
   
}

        
@end
