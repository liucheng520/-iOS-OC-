//
//  PhotoItem.h
//  俄官方的方式提供撒
//
//  Created by Scott on 15/12/25.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,SectionType)
{
    SectionTypeSingleiterm  = 0,        //单个Section
    SectionTypeMultiterm          //多条Section
};

@interface PhotoItem : NSObject

@property (nonatomic, copy) NSString *url;            /**<图片链接*/
@property (nonatomic, copy) NSString *imageName;      /**<图片名称*/
@property (nonatomic, strong) UIImage *image;         /**<图片对象*/
@property (nonatomic, copy) NSString *placeHolderImage;   /**<默认显示图片名称*/

@property (nonatomic, assign) NSInteger index;     /**<单个Section使用*/
@property (nonatomic, strong) NSIndexPath *indexPath;   /**<多个Section使用*/





@end
