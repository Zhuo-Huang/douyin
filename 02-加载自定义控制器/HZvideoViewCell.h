//
//  HZvideoViewCell.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/27.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZvideoViewCell : UICollectionViewCell
-(void)layouyWithVideoCoverUrl:(NSString*)videoCoverUrl videoUrl:(NSString *)videourl;
-(instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
