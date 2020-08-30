//
//  HZMessageController.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/26.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZMessageController.h"
#import "HZlistItem.h"
#import "HZlistloader.h"
#import "SDWebImage.h"
#import "HZProvinceViewController.h"
#import "HZNameViewController.h"
@interface HZMessageController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) HZlistItem *dataitem;
@property (nonatomic,strong) HZlistloader *listloader;

@end

@implementation HZMessageController

-(instancetype) init{
    self=[super init];
    if(self)
    {
        self.listloader=[[HZlistloader alloc] init];
//        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:tableview];
    tableview.dataSource=self;
    tableview.delegate=self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 150, 100, 150)];
    tableview.tableHeaderView=view;
    
    [view addSubview:({
        self.u_imageview=[[UIImageView alloc]initWithFrame:CGRectMake(150, 25, 70, 70)];
        self.u_imageview.backgroundColor=[UIColor yellowColor];
//        self.u_imageview.contentMode = UIViewContentModeCenter;
        self.u_imageview;
        })];
    
     [view addSubview:({
            UILabel* u_name=[[UILabel alloc]initWithFrame:CGRectMake(130, 105, 40, 20)];
    //            self.u_name.backgroundColor = [UIColor grayColor];
            u_name.textColor=[UIColor whiteColor];
            u_name.font = [UIFont fontWithName:@"Verdana-Bold"size:17];
            u_name.text=@"点击更换头像";
         [u_name sizeToFit];
//         u_name.center= [view.convertPoint(view.center, fromView: view.superview) ];
//
         [u_name setTextAlignment:NSTextAlignmentCenter];
         u_name;
            })];
    
    __weak typeof(self)wself=self;
                     
       [self.listloader loadListDataWithFinishBlock:^(BOOL success, HZlistItem * dataitem) {
           __strong typeof(wself) strongself=wself;
           strongself.dataitem=dataitem;
           NSLog(@"");
           [tableview reloadData];
       }];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
   
    UIView *backgrdView = [[UIView alloc] initWithFrame:cell.frame];
    backgrdView.backgroundColor = [UIColor blackColor];
    cell.backgroundView = backgrdView;
    
    
    if(indexPath.row==0)
    {
        cell.textLabel.text=@"名字";
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",self.dataitem.nickname];
    }
    else if(indexPath.row==1)
    {
        cell.textLabel.text=@"账号";
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",self.dataitem.uid];
    }
    else if(indexPath.row==2)
    {
        cell.textLabel.text=@"简介";
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",self.dataitem.signature];
    }
    else if(indexPath.row==3)
        cell.textLabel.text=@"性别";
    else if(indexPath.row==4)
        cell.textLabel.text=@"生日";
    else if(indexPath.row==5)
        cell.textLabel.text=@"地区";
    else if(indexPath.row==6)
        cell.textLabel.text=@"学校";

    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    [self.u_imageview sd_setImageWithURL:[NSURL URLWithString:self.dataitem.url]
                               completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"");
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        HZNameViewController *view1=[[HZNameViewController alloc] init];
        view1.view.backgroundColor=[UIColor whiteColor];
        view1.navigationItem.title=@"修改名字";
        
        [self.navigationController pushViewController:view1 animated:YES];
        
    }
    else if(indexPath.row==1)
    {
        UIViewController *view1=[[UIViewController alloc]init];
        view1.view.backgroundColor=[UIColor greenColor];
        [self.navigationController pushViewController:view1 animated:YES];
    }
    else if(indexPath.row==2)
    {
        UIViewController *view1=[[UIViewController alloc]init];
        view1.view.backgroundColor=[UIColor greenColor];
        [self.navigationController pushViewController:view1 animated:YES];
    }
    else if(indexPath.row==5)
    {
        HZProvinceViewController *view=[[HZProvinceViewController alloc]init];
        view.view.backgroundColor=[UIColor yellowColor];
        [self.navigationController pushViewController:view animated:YES];
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
