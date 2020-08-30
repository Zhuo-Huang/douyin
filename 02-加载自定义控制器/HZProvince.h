//
//  HZProvince.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/28.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZProvince : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSArray *cities;

-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) provinceWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
