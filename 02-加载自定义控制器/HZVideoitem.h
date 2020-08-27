//
//  HZVideoitem.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/27.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZVideoitem : NSObject
@property (nonatomic,copy) NSString *url;

+(instancetype)ameweWithDict:(NSDictionary*)dict;
@end

NS_ASSUME_NONNULL_END
