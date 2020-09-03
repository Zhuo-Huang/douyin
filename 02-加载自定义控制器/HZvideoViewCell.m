//
//  HZvideoViewCell.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/27.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZvideoViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface HZvideoViewCell()
@property(nonatomic,strong,readwrite) UIImageView *coverView;
@property(nonatomic,strong,readwrite) UIImageView *playButton;
@property(nonatomic,copy,readwrite) NSString *videoUrl;
@property(nonatomic,strong,readwrite) UIView *playerView;
@property(nonatomic,strong,readwrite) AVPlayer *player;
-(void)_taptoplay;
@end
@implementation HZvideoViewCell

- (void)prepareForReuse
{
    if (_player) {
        [_player pause];
        _player = nil;
    }
    
    [self.playerView.layer.sublayers enumerateObjectsUsingBlock:^(__kindof CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
}

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
        [self addSubview:self.playerView];
        self.playerView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_taptoplay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)_taptoplay
{
    NSLog(@"");
    NSString* url=[NSString stringWithFormat:@"%@", _videoUrl];
    if (self.clickEditHandler) {
        self.clickEditHandler(url);
    }

}

- (UIView *)playerView
{
    if (!_playerView) {
        _playerView = [UIView new];
    }
    return _playerView;
}

-(void)layouyWithVideoCoverUrl:(NSString*)videoCoverUrl videoUrl:(NSString *)videourl
{
    _playButton.image=[UIImage imageNamed:videoCoverUrl];
//    _coverView.image=[UIImage imageNamed:videoCoverUrl];
//    _coverView.image=[UIImage imageNamed:@"https://p29-dy.byteimg.com/img/tos-cn-p-0015/156fb531013a4ba18aabbca51196a601~c5_300x400.jpeg?from=2563711402_large"];
    _videoUrl=videourl;
//
    
    
//    NSURL *photourl = [NSURL URLWithString:videoCoverUrl];
//    //url请求实在UI主线程中进行的
//    UIImage *images = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];//通过网络url获取uiimage
    [self.coverView sd_setImageWithURL:[NSURL URLWithString:videoCoverUrl]];
}
@end
