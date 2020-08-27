//
//  HZvideoViewCell.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/27.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZvideoViewCell.h"

@interface HZvideoViewCell()
@property(nonatomic,strong,readwrite) UIImageView *coverView;
@property(nonatomic,strong,readwrite) UIImageView *playButton;

@end
@implementation HZvideoViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame: frame];
    if(self)
    {
        [self addSubview:({
            _coverView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
            _coverView;
        })];
        [self addSubview:({
            _playButton=[[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-50)/2,(frame.size.height-50)/2,50,50)];
            _playButton.image=[UIImage imageNamed:@"play"];
            _playButton;
        })];
    }
    return self;
}
@end
