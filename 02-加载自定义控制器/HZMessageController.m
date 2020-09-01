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
@interface HZMessageController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) HZlistItem *dataitem;
@property (nonatomic,strong) HZlistloader *listloader;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HZNameViewController *View1;
@property(nonatomic,strong) UIPickerView *pickerview;
@property(nonatomic,strong) UIView *viewv;
@property(nonatomic,strong) UIView *removeview;
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
    self.tableView = tableview;
    
    self.viewv=[[UIView alloc]initWithFrame:self.view.bounds];
    self.removeview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 388)];
    UIPickerView* pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 388, self.view.bounds.size.width, 300)];
    pickerView.backgroundColor=[UIColor greenColor];
    pickerView.dataSource=self;
    pickerView.delegate=self;
    self.pickerview=pickerView;
   
    
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


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component API_UNAVAILABLE(tvos)
{
    if(row==0)
        return @"男";
    else if(row==1)
        return @"女";
    else
        return @"不显示";
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component API_UNAVAILABLE(tvos)
{
    NSString *str;
    if(row==0)
        str= @"男";
    else if(row==1)
        str= @"女";
    else
        str= @"不显示";
    self.dataitem.sex=str;
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
        
    }

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
    {
        cell.textLabel.text=@"性别";
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",self.dataitem.sex];
    }
    else if(indexPath.row==4)
        cell.textLabel.text=@"生日";
    else if(indexPath.row==5)
    {
        cell.textLabel.text=@"地区";
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",self.dataitem.city];
    }
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
        HZNameViewController* view1=[[HZNameViewController alloc] init];
        view1.view.backgroundColor=[UIColor whiteColor];
        view1.navigationItem.title=@"修改名字";
        view1.textfield.text=[NSString stringWithFormat:@"%@",self.dataitem.nickname];
        view1.length.text=
        [NSString stringWithFormat:@"%lu/20",view1.textfield.text.length];
        self.View1=view1;
        __weak __typeof(self) weakSelf = self;
        view1.clickEditHandler = ^(NSString * _Nonnull name) {
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.dataitem.nickname = name;
//            [strongSelf.tableView reloadData];
            [strongSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            [strongSelf.navigationController reloadInputViews];
        };

        [self.navigationController pushViewController:view1 animated:YES];
        
    }
    else if(indexPath.row==1)
    {
         
    }
    else if(indexPath.row==2)
    {
        UIViewController *view1=[[UIViewController alloc]init];
        view1.view.backgroundColor=[UIColor greenColor];
        [self.navigationController pushViewController:view1 animated:YES];
    }
    else if(indexPath.row==3)
    {
        [self.view addSubview:self.viewv];
        [self.viewv addSubview:self.pickerview];
        [self.viewv addSubview:self.removeview];
        
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removepickview)];
        [self.removeview addGestureRecognizer:tapGesture];
        
        [self pickerView:self.pickerview didSelectRow:0 inComponent:0];
    }
    else if(indexPath.row==4)
    {
       
    }
    else if(indexPath.row==5)
    {
        HZProvinceViewController *view=[[HZProvinceViewController alloc]init];
        view.view.backgroundColor=[UIColor yellowColor];
        __weak __typeof(self) weakSelf = self;
        view.clickEditcity = ^(NSString * _Nonnull name) {
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.dataitem.city=name;
           [strongSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:5 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        };
        [self.navigationController pushViewController:view animated:YES];
        
    }
    
}

-(void)removepickview
{
    [self.viewv removeFromSuperview];
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
