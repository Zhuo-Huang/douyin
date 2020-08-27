//
//  HZCollectionViewCell.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/20.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZCollectionViewCell.h"
#import "HZVideoitem.h"
@interface  HZCollectionViewCell()
@property (nonatomic,strong) NSArray *aweme;
@end

@implementation HZCollectionViewCell

-(NSArray *)aweme{
    if(_aweme)
    {
        NSString *path= [[NSBundle mainBundle]pathForResource:@"他人页作品数据" ofType:@"json"];
        NSData *data=[NSData dataWithContentsOfFile:path];
        
//        NSDictionary *info =[((NSDictionary*) jsonobj) objectForKey:@"user_info" ] ;
        
//         NSArray * tempArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray * tempArray=[[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]objectForKey:@"aweme_list" ];
        NSMutableArray *array=[NSMutableArray array];
        for(NSDictionary *dict in tempArray)
        {
            NSDictionary *info =[[[(dict) objectForKey:@"author" ]objectForKey:@"video"]objectForKey:@"play_addr"] ;
            HZVideoitem *p=[HZVideoitem ameweWithDict:dict];
            
            [array addObject:p];
        }
        _aweme=array;
    }
    return _aweme;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self)
    {
        self.likeLable = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/3-50,  173, 10, 10)];
        self.likeLable.textAlignment = NSTextAlignmentCenter;
        self.likeLable.textColor=[UIColor whiteColor];
//        self.likeLable.backgroundColor = [UIColor whiteColor];
        self.likeLable.font = [UIFont fontWithName:@"Verdana-Bold"size:13];
         [self.contentView addSubview:self.likeLable];
    }
    return self;
}


-(void)layoutclooectioncell
{
    self.likeLable.text=@"1.54W";
    [self.likeLable sizeToFit];
}
@end
