//
//  HZCityViewController.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/29.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZCityViewController.h"
#import "HZProvince.h"
@interface HZCityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray* provinces;

@end

@implementation HZCityViewController

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
    HZProvince *n=self.provinces[self.provin];
    return n.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HZProvince *n=self.provinces[self.provin];
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
    cell.textLabel.text=n.cities[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HZProvince *n=self.provinces[self.provin];
    if (self.clickEditHandler) {
        self.clickEditHandler(n.cities[indexPath.row]);
        [self.navigationController popViewControllerAnimated:self];
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
