//
//  PhotoData.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 16/1/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "PhotoData.h"

@implementation PhotoData


+ (NSArray *)getPhotoDataWithType:(SectionType)sectionType
{
    
    switch (sectionType) {
        case SectionTypeSingleiterm:
            return [self getSingleData];
            break;
       case SectionTypeMultiterm:
            return [self getMultiData];
        default:
            return [NSArray array];
            break;
    }
    
}


+ (NSArray *)getSingleData
{
    NSMutableArray *sigleData = [NSMutableArray array];
    NSArray *dataArray = [self baseData];
    for(NSInteger i = 0; i < dataArray.count; i ++)
    {
        PhotoItem *photo = [PhotoItem new];
        photo.url = dataArray[i];
        photo.index = i;
        photo.placeHolderImage = @"default_ads";
        
        [sigleData addObject:photo];
    }
    
    return sigleData;
}

+ (NSArray *)getMultiData
{
    NSMutableArray *multiData = [NSMutableArray array];
    NSArray *dataArray = [self baseData];
    NSArray *coutArray = @[@4,@6,@2,@3,@5];
    NSInteger i = 0;
    for(NSInteger section = 0 ;section < coutArray.count; section ++)
    {
        NSInteger count = [[coutArray objectAtIndex:section] integerValue];
        NSMutableArray *sectionArray = [NSMutableArray array];
        for (NSInteger row = 0; row < count; row ++ ,i ++)
        {
            PhotoItem *photo = [PhotoItem new];
            photo.url = dataArray[i];
            photo.index= i;
            photo.indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            photo.placeHolderImage = @"default_ads";
            
            [sectionArray addObject:photo];
        }
        [multiData addObject:sectionArray];
    }
    return multiData;
}


+ (NSArray *)baseData
{
    return @[
             @"http://baike.soso.com/p/20090711/20090711101754-314944703.jpg",
             @"http://pica.nipic.com/2007-11-09/200711912453162_2.jpg",
             @"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",
             @"http://pic.nipic.com/2007-11-09/200711912230489_2.jpg",
             @"http://imgsrc.baidu.com/forum/pic/item/3ac79f3df8dcd1004e9102b8728b4710b9122f1e.jpg",
             @"http://pic9.nipic.com/20100812/3289547_144304019987_2.jpg",
             @"http://a2.att.hudong.com/38/59/300001054794129041591416974.jpg",
             @"http://pic1a.nipic.com/2008-11-26/200811268173650_2.jpg",
             @"http://pic.nipic.com/2007-11-08/2007118192311804_2.jpg",
             @"http://pic1.nipic.com/2008-09-12/20089129255891_2.jpg",
             @"http://pic.nipic.com/2007-11-08/200711819133664_2.jpg",
             @"http://pic.nipic.com/2007-11-09/2007119123053767_2.jpg",
             @"http://pic1.ooopic.com/uploadfilepic/sheji/2010-01-12/OOOPIC_1982zpwang407_20100112bd83f1f620b7a5c3.jpg",
             @"http://c.hiphotos.baidu.com/zhidao/pic/item/1ad5ad6eddc451da6bb0d76fb6fd5266d11632f4.jpg",
             @"http://img2.niutuku.com/desk/anime/3354/3354-4958.jpg",
             @"http://imgsrc.baidu.com/forum/pic/item/7669d5628535e5ddab84941c76c6a7efcc1b62f7.jpg",
             @"http://hiphotos.baidu.com/%BB%AA%CD%A4%B9%AB%BE%F4/pic/item/527bd3009557f1a7e850cd6c.jpg",
             @"http://img3.imgtn.bdimg.com/it/u=2868191432,386375563&fm=21&gp=0.jpg",
             @"http://zt.comicyu.com/UploadFiles/ManArea/2010/3/201003221014503225.jpg",
             @"http://www.qbaobei.com/tuku/images/13.jpg"
             ];
}


@end
