//
//  HZViewController.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/21.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZViewController : UIViewController
@property (strong, nonatomic) UIButton *messageButton;


-(void)pushController;
@end

NS_ASSUME_NONNULL_END

