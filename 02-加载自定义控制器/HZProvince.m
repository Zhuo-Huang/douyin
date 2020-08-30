//
//  HZProvince.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/28.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZProvince.h"

@implementation HZProvince
-(instancetype) initWithDict:(NSDictionary *)dict
{
    self=[super init];
    if(self)
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype) provinceWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
