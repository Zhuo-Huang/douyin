//
//  MYViewController.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/20.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "MYViewController.h"
#import "HZCollectionViewFlowLayout.h"
#import "HZCollectionViewCell.h"
#import "HZCollectionTopViewCell.h"
#import "HZlistloader.h"
#import "HZMessageController.h"
#import "HZVideoitem.h"
#import "HZvideoViewCell.h"
#import <AVFoundation/AVFoundation.h>
#define JkScreenHeight [UIScreen mainScreen].bounds.size.height
#define JkScreenWidth [UIScreen mainScreen].bounds.size.width
#define ISiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface MYViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UIView *tvHeaderView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong) HZlistloader *listloader;
@property (nonatomic,strong) HZlistItem *dataitem;
@property(nonatomic,strong,readwrite) AVPlayer *player;

@end

@implementation MYViewController

-(instancetype) init{
    self=[super init];
    if(self)
    {
        self.listloader=[[HZlistloader alloc] init];
//        self.automaticallyAdjustsScrollViewInsets = YES;
      
    }
    return self;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        HZCollectionViewFlowLayout *flowlayout = [[HZCollectionViewFlowLayout alloc] init];
        //设置悬停高度，默认64
        flowlayout.naviHeight = ISiPhoneX?88:64;
        //设置滚动方向
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //左右间距
        flowlayout.minimumInteritemSpacing = 1;
        //上下间距
        flowlayout.minimumLineSpacing = 1;
        flowlayout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 2);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0 , 0 , JkScreenWidth, JkScreenHeight) collectionViewLayout:flowlayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;

        [_collectionView setBackgroundColor:[UIColor clearColor]];
        _collectionView.showsVerticalScrollIndicator = NO;

        //注册单元格
        [_collectionView registerClass:[HZvideoViewCell class] forCellWithReuseIdentifier:@"cell"];
         [_collectionView registerClass:[HZCollectionTopViewCell class] forCellWithReuseIdentifier:@"celltop"];
        //注册区头
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:@"topView"];
        
        __weak typeof(self)wself=self;
                      
        [self.listloader loadListDataWithFinishBlock:^(BOOL success, HZlistItem * dataitem) {
            __strong typeof(wself) strongself=wself;
            strongself.dataitem=dataitem;
        
            [strongself.collectionView reloadData];
        }];
        
         NSString *path= [[NSBundle mainBundle]pathForResource:@"鞠婧祎" ofType:@"json"];
                NSData *data=[NSData dataWithContentsOfFile:path];
                
        //        NSDictionary *info =[((NSDictionary*) jsonobj) objectForKey:@"user_info" ] ;
                
        //         NSArray * tempArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSArray * tempArray=[[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]objectForKey:@"aweme_list" ];
                NSMutableArray *array=[NSMutableArray array];
                for(NSDictionary *dict in tempArray)
                {
                    NSDictionary *info =[[(dict) objectForKey:@"video"]objectForKey:@"play_addr"] ;
                    NSDictionary *info1 =[[(dict) objectForKey:@"video"]objectForKey:@"cover"] ;
                    HZVideoitem *p=[HZVideoitem ameweWithDict:info:info1];
                    
                    [array addObject:p];
                }
        self.aweme=array;
    }
    
    
    return _collectionView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        HZCollectionTopViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"celltop" forIndexPath:indexPath];
 
        cell.clickEditHandler = ^()
        {
            HZMessageController *view=[[HZMessageController alloc] init];
            view.view.backgroundColor=[UIColor blackColor];
            view.navigationItem.title=@"编辑资料";            
            [self.navigationController pushViewController:view animated:YES];
        };
        cell.backgroundColor =[UIColor redColor];
       
        [cell layoutTopViewWithItem:self.dataitem];
        return cell;
    }
    else
    {
        HZvideoViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        NSLog(@"");
        [cell layouyWithVideoCoverUrl:((HZVideoitem *)self.aweme[indexPath.item]).coverurl videoUrl:((HZVideoitem *)self.aweme[indexPath.item]).url];

        cell.clickEditHandler =^(NSString * url)
        {
            UIViewController *view=[[UIViewController alloc] init];
            view.view.backgroundColor=[UIColor blackColor];
            
            [self.navigationController pushViewController:view animated:YES];
//            NSString *videoUrl=@"https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4";
            NSString *videoUrl=url;
            
            NSURL *videourl=[NSURL URLWithString:videoUrl];
              AVAsset *asset=[AVAsset assetWithURL:videourl];
              AVPlayerItem *videoItem= [AVPlayerItem playerItemWithAsset:asset];
              AVPlayer *avplayer=[AVPlayer playerWithPlayerItem:videoItem];
              AVPlayerLayer *playerlayer=[AVPlayerLayer playerLayerWithPlayer:avplayer];
//              playerlayer.frame=_playerView.bounds;
            playerlayer.frame=[UIScreen mainScreen].bounds;
              [view.view.layer addSublayer:playerlayer];
              [avplayer play];
            self.player= avplayer;
        
        };
        cell.backgroundColor = [UIColor greenColor];
        
         return cell;
    }
}


#pragma mark ---------  UICollectionView  Delegate/DataSource-----
//点击单元格
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
//配置区头
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {

        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"topView" forIndexPath:indexPath];

        headerView.backgroundColor = [UIColor blackColor];

        return headerView;

    }
    return nil;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    return 20;
}
//设置区头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(JkScreenWidth,50);
}

//设置区尾高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}


//设置cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//轮播
        return CGSizeMake(JkScreenWidth,300);
    }
    return CGSizeMake((JkScreenWidth -1-2-2-2)/3,580/3);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

 //   self.title = @"悬停效果";

    [self.view addSubview:self.collectionView];
}
@end


