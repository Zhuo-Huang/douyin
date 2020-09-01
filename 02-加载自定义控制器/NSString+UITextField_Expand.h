//
//  NSString+UITextField_Expand.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/9/1.
//  Copyright © 2020 itheima. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^LimitBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Expand)

@property (nonatomic , copy)LimitBlock limitBlock;

- (void)lengthLimit:(void (^)(void))limit;

@end

NS_ASSUME_NONNULL_END
