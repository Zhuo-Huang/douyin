//
//  HZProvinceViewController.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/28.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZProvinceViewController : UIViewController
@property (nonatomic,strong) NSString *city;
@property (nonatomic, copy) void (^clickEditcity)(NSString *name);
@end

NS_ASSUME_NONNULL_END
