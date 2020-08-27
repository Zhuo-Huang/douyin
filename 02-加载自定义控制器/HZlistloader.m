//
//  HZlistloader.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/21.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZlistloader.h"
#import "HZlistItem.h"
@implementation HZlistloader

-(void)loadListDataWithFinishBlock:(HZListLoaderFinishBlock)FinishBlock
{
    NSString *urlString=@"https://www.iesdouyin.com/web/api/v2/user/info/?sec_uid=MS4wLjABAAAAshzXgVS8HqF8PomFlCATZjkjC48Az0d8tk28RXRgrbA";
    NSURL *listurl=[NSURL URLWithString:urlString];
    
//    NSURLRequest *listRequest =[NSURLRequest requestWithURL:listurl];
    
        NSURLSession *session=[NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask=[session dataTaskWithURL:listurl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonerror;
        id jsonobj=[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonerror];
        

        NSDictionary *info =[((NSDictionary*) jsonobj) objectForKey:@"user_info" ] ;
        
        HZlistItem *listItem=[[HZlistItem alloc] init];
        [listItem configWithDictionary:info];
          
        dispatch_async(dispatch_get_main_queue(), ^{
            if(FinishBlock){
                FinishBlock(error==nil,listItem);
            }
        });
        
        NSLog(@"hh");
    }];
    [dataTask resume];
    NSLog(@"hh");
}
@end
