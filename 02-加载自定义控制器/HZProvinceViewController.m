//
//  HZProvinceViewController.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/28.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZProvinceViewController.h"
#import "HZProvince.h"
#import "HZCityViewController.h"
@interface HZProvinceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray* provinces;
@end

@implementation HZProvinceViewController

-(NSArray *)provinces
{
    if(_provinces==nil)
    {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"02cities.plist" ofType:nil];
        NSArray *dictarr=[NSArray arrayWithContentsOfFile:path];

        NSMutableArray *arr=[NSMutableArray arrayWithCapacity:dictarr.count];
        for(NSDictionary *dict in dictarr)
        {
            HZProvince *pro=[HZProvince provinceWithDict:dict];
            [arr addObject:pro];
        }
        _provinces=arr;
    }
    return _provinces;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:tableview];
    tableview.dataSource=self;
    tableview.delegate=self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.provinces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HZProvince *n=self.provinces[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=n.name;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HZProvince *n=self.provinces[indexPath.row];
    HZCityViewController *view=[[HZCityViewController alloc] init];
    view.provin=indexPath.row;
    
    view.view.backgroundColor=[UIColor yellowColor];
    [self.navigationController pushViewController:view animated:YES];
}
@end
