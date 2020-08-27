//
//  HZCollectionTopViewCell.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/21.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZCollectionTopViewCell.h"
#import "SDWebImage.h"
@implementation HZCollectionTopViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self)
    {
        self.messageButton = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2+50, 100, 10, 10)];
        self.messageButton.backgroundColor = [UIColor grayColor];
        self.messageButton.font = [UIFont fontWithName:@"Verdana-Bold"size:17];
        [self.messageButton setTitle:@"编辑资料" forState:UIControlStateNormal];
        [self.messageButton sizeToFit];
         [self.contentView addSubview:self.messageButton];
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
        [self.messageButton addGestureRecognizer:tapGesture];
        
        [self.contentView addSubview:({
        self.liked=[[UILabel alloc]initWithFrame:CGRectMake(20, 270, 40, 20)];
//        self.liked.backgroundColor = [UIColor grayColor];
        self.liked.textColor=[UIColor whiteColor];
        self.liked;
        })];
        [self.contentView addSubview:({
        self.followed=[[UILabel alloc]initWithFrame:CGRectMake(100, 270, 40, 20)];
//        self.followed.backgroundColor = [UIColor grayColor];
        self.followed.textColor=[UIColor whiteColor];
        self.followed;
        })];
        [self.contentView addSubview:({
        self.following=[[UILabel alloc]initWithFrame:CGRectMake(160, 270, 40, 20)];
//        self.following.backgroundColor = [UIColor grayColor];
        self.following.textColor=[UIColor whiteColor];
        self.following;
        })];
        [self.contentView addSubview:({
        self.u_id=[[UILabel alloc]initWithFrame:CGRectMake(20, 100, 40, 20)];
//            self.u_id.backgroundColor = [UIColor grayColor];
        self.u_id.textColor=[UIColor whiteColor];
        self.u_id.font=[UIFont systemFontOfSize:14];
        self.u_id;
        })];
        [self.contentView addSubview:({
        self.u_name=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 40, 20)];
//            self.u_name.backgroundColor = [UIColor grayColor];
        self.u_name.textColor=[UIColor whiteColor];
        self.u_name.font = [UIFont fontWithName:@"Verdana-Bold"size:17];
        self.u_name;
        })];
        [self.contentView addSubview:({
        self.u_detail=[[UILabel alloc]initWithFrame:CGRectMake(20, 160, 270, 100)];
//        self.u_detail.backgroundColor = [UIColor grayColor];
        self.u_detail.textColor=[UIColor whiteColor];
        self.u_detail.numberOfLines=4;
        self.u_detail.lineBreakMode=NSLineBreakByTruncatingTail;
        self.u_detail;
        })];
        
        [self.contentView addSubview:({
            self.u_imageview=[[UIImageView alloc]initWithFrame:CGRectMake(20, 16, 70, 70)];
            self.u_imageview.backgroundColor=[UIColor whiteColor];
            self.u_imageview;
                })];
        
        
    }
    return self;
    
    
}
-(void)layoutTopView
{
    self.liked.text=@"0喜欢";
    [self.liked sizeToFit];
    
    self.following.text=@"0喜欢";
    [self.following sizeToFit];
    self.following.frame=CGRectMake(self.liked.frame.origin.x+self.following.frame.size.width+15, self.following.frame.origin.y, self.following.frame.size.width, self.following.frame.size.height);
    
    self.followed.text=@"0喜欢";
    [self.followed sizeToFit];
    self.followed.frame=CGRectMake(self.following.frame.origin.x+self.followed.frame.size.width+15, self.followed.frame.origin.y, self.followed.frame.size.width, self.followed.frame.size.height);
    
    self.u_id.text=@"0喜欢";
    [self.u_id sizeToFit];
    
    self.u_name.text=@"0喜欢";
    [self.u_name sizeToFit];
    
    self.u_detail.text=@"0喜欢";
    [self.u_detail sizeToFit];
}
-(void)layoutTopViewWithItem:(HZlistItem*)item
{
//    self.liked.text=item.like;
    self.liked.text=[NSString stringWithFormat:@"%@获赞",item.like];
    [self.liked sizeToFit];
    
    self.following.text=[NSString stringWithFormat:@"%@关注",item.following];
    [self.following sizeToFit];
    self.following.frame=CGRectMake(self.liked.frame.origin.x+self.following.frame.size.width+15, self.following.frame.origin.y, self.following.frame.size.width, self.following.frame.size.height);
    
    self.followed.text= [NSString stringWithFormat:@"%@粉丝",item.follower];
    [self.followed sizeToFit];
    self.followed.frame=CGRectMake(self.following.frame.origin.x+self.following.frame.size.width+15, self.followed.frame.origin.y, self.followed.frame.size.width, self.followed.frame.size.height);
    
    self.u_id.text=[NSString stringWithFormat:@"抖音号%@",item.uid];
    [self.u_id sizeToFit];
    
    self.u_name.text=[NSString stringWithFormat:@"%@",item.nickname];
    [self.u_name sizeToFit];
    
    self.u_detail.text= [NSString stringWithFormat:@"%@",item.signature];
   
    [self.u_imageview sd_setImageWithURL:[NSURL URLWithString:item.url]
                               completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"");
    }];
}
-(void)pushController{
//    NSLog(@"hello world");
  
    if (self.clickEditHandler) {
    self.clickEditHandler();
    }
}
@end
