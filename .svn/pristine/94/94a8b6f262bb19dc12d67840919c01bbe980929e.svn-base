//
//  SingleSectionPhotoViewController.m
//  武汉二部iOS基础框架
//
//  Created by Scott on 16/1/4.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "SingleSectionPhotoViewController.h"
#import "YCPhotosPageViewController.h"   //图片浏览的主页面
#import "ZoomTransition.h"               //图片浏览的动画类

#import "PhotoData.h"             //图片数据

#define kRowCount  3
#define kImageTag 100
#define kPhotoCellIdentifier @"userPhotoCell"

@interface SingleSectionPhotoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,ZoomTransitionProtocol,PhotosPageViewDelegate>


@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) ZoomTransition *zoomTransition;
@property (nonatomic, weak) UIView *transionView;              //进行动画的View

@end

@implementation SingleSectionPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)creatNavgationItem
{
    self.navigationItem.title = @"单Section相册";
}

- (void)creatContentView
{
    //初始化自定义的动画对象  注：因为是改写了pop,push动画 ，所以，容器一定是要navigationController
    self.zoomTransition = [[ZoomTransition alloc] initWithNavigationController:self.navigationController];
    self.dataArray = [PhotoData getPhotoDataWithType:SectionTypeSingleiterm];
    
    [self.view addSubview:self.collectionView];
    
}

//实现ZoomTransition的协议
#pragma mark = ZoomTransitionProtocol
- (UIView *)viewForTransition      //返回进行动画的视图
{
    return self.transionView;
}

- (BOOL)shouldApplyZoomOutAnimation    //被pop时是否进行ZoomOut动画
{
    return (self.transionView)?YES:NO;
}





#pragma mark - PhotosPageViewDelegate
- (void)PhotosPageViewControlller:(YCPhotosPageViewController *)photosVC didChangedBackIndex:(NSInteger)index
{
    //要返回的时候,返回来的图片index 更新用来动画的View
    NSIndexPath *currentIndexPath  = [NSIndexPath indexPathForItem:index inSection:0];
    
    [self.collectionView scrollToItemAtIndexPath:currentIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
    
    [self.collectionView performBatchUpdates:^{
        [self.collectionView reloadItemsAtIndexPaths:@[currentIndexPath]];
    } completion:^(BOOL finished) {
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:currentIndexPath];
        if(cell)
        {
            _transionView = (UIImageView *)[cell.contentView viewWithTag:kImageTag];
        }
        else
        {
            _transionView = nil;
        }
    }];
    
   
}



#pragma mark - UICollectionView Delegate & DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoCellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:kImageTag];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    PhotoItem *item = [self.dataArray objectAtIndex:indexPath.row];
    [imageView sd_setImageWithURL:[NSURL URLWithString:item.url] placeholderImage:[UIImage imageNamed:item.placeHolderImage]];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    self.transionView = (UIImageView *)[cell.contentView viewWithTag:kImageTag];
    YCPhotosPageViewController *photoPageVC = [[YCPhotosPageViewController alloc] initWithPhotos:self.dataArray currentIndex:indexPath.row];
    photoPageVC.delegate = self;
    photoPageVC.needsShowToolBar = NO;
    
    [self.navigationController pushViewController:photoPageVC animated:YES];
}

#pragma mark - UICollectionView
- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        CGFloat width = ceilf((KScreenWidth - (kRowCount + 1)*10)/kRowCount - ((kRowCount == 3)? 2:1));
        layout.itemSize = CGSizeMake(width, width);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight - 64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kPhotoCellIdentifier];
        
    }
    return _collectionView;
}

//- (NSMutableArray *)dataArray
//{
//    if(!_dataArray)
//    {
//        _dataArray = [[NSMutableArray alloc] init];
//    }
//    return _dataArray;
//}

@end
