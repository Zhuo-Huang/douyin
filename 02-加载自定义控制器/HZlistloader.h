//
//  HZlistloader.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/21.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HZlistItem;
typedef void (^HZListLoaderFinishBlock)(BOOL success,HZlistItem *dataitem);

@interface HZlistloader : NSObject
-(void)loadListDataWithFinishBlock:(HZListLoaderFinishBlock)FinishBlock;
@end

NS_ASSUME_NONNULL_END
