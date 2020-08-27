//
//  HZVideoitem.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/27.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZVideoitem.h"

@implementation HZVideoitem

+(instancetype)ameweWithDict:(NSDictionary*)dict
{
    HZVideoitem *p=[[self alloc] init];
    p.url=dict[@"url_list"][0];
    return p;
}
@end
