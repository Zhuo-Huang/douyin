//
//  HZMessageController.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/26.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZMessageController : UIViewController
@property(nonatomic,strong) UILabel *u_name;
@property (nonatomic, copy) void (^clickidHandler)(void);
-(void)removepickview;
-(void)addpicture;
@end

NS_ASSUME_NONNULL_END
