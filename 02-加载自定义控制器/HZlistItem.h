//
//  HZlistItem.h
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/22.
//  Copyright © 2020 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZlistItem : NSObject
@property (nonatomic,copy,readwrite) NSString* uid;
@property (nonatomic,copy,readwrite) NSString* following;
@property (nonatomic,copy,readwrite) NSString* total_favorited;
@property (nonatomic,copy,readwrite) NSString* nickname;
@property (nonatomic,copy,readwrite) NSString* signature;
@property (nonatomic,copy,readwrite) NSString* follower;
@property (nonatomic,copy,readwrite) NSString* aweme;
@property (nonatomic,copy,readwrite) NSString* like;
@property (nonatomic,copy,readwrite) NSString* url;
-(void)configWithDictionary:(NSDictionary*)dictonary;
@end

NS_ASSUME_NONNULL_END
