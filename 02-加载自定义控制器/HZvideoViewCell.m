//
//  HZvideoViewCell.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/27.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZvideoViewCell.h"
#import <AVFoundation/AVFoundation.h>
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
    if (self.clickEditHandler) {
    self.clickEditHandler();
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
    _playButton.image=[UIImage imageNamed:@"play"];
//    _coverView.image=[UIImage imageNamed:videourl];
    _coverView.image=[UIImage imageNamed:@"https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4"];
//    _videoUrl=videourl;
    _videoUrl=@"https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4";
}
@end
