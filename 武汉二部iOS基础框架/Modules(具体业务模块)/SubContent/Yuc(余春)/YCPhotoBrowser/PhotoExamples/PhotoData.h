//
//  PhotoData.h
//  武汉二部iOS基础框架
//
//  Created by Scott on 16/1/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoItem.h"

@interface PhotoData : NSObject

+ (NSArray *)getPhotoDataWithType:(SectionType)sectionType;

@end
