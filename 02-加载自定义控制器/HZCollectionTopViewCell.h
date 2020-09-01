//
//  HZCollectionTopViewCell.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/21.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZlistItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZCollectionTopViewCell : UICollectionViewCell
@property (strong, nonatomic) UIButton *messageButton;
@property(nonatomic,strong) UILabel *liked;
@property(nonatomic,strong) UILabel *following;
@property(nonatomic,strong) UILabel *followed;
@property(nonatomic,strong) UILabel *u_name;
@property(nonatomic,strong) UILabel *u_id;
@property(nonatomic,strong) UILabel *u_detail;
@property(nonatomic,strong) UIImageView *u_imageview;
@property (nonatomic, copy) void (^clickEditHandler)(void);
@property (nonatomic, copy) void (^clickidHandler)(void);

-(void)pushController;
-(void)layoutTopViewWithItem:(HZlistItem*)item;
-(void)layoutTopView;
@end

NS_ASSUME_NONNULL_END


