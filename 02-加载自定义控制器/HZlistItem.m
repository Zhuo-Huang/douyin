//
//  HZlistItem.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/22.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZlistItem.h"

@implementation HZlistItem
-(void)configWithDictionary:(NSDictionary*)dictonary
{
    self.uid=[dictonary objectForKey:@"short_id"];
    self.following=[dictonary objectForKey:@"following_count"];
    self.total_favorited=[dictonary objectForKey:@"total_favorited"];
    self.nickname=[dictonary objectForKey:@"nickname"];
    self.signature=[dictonary objectForKey:@"signature"];
    self.follower=[dictonary objectForKey:@"follower_count"];
    self.aweme=[dictonary objectForKey:@"aweme"];
    self.like=[dictonary objectForKey:@"favoriting_count"];
    self.url=[[dictonary objectForKey:@"avatar_thumb"] objectForKey:@"url_list"][0];
}

@end
