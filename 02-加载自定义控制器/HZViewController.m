//
//  HZViewController.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/21.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZViewController.h"

@interface HZViewController ()

@end

@implementation HZViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.messageButton = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2-50, 100, 10, 10)];
    self.messageButton.backgroundColor = [UIColor grayColor];
    self.messageButton.font = [UIFont fontWithName:@"Verdana-Bold"size:17];
    [self.messageButton setTitle:@"编辑资料" forState:UIControlStateNormal];
    [self.messageButton sizeToFit];
     [self.view addSubview:self.messageButton];
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [self.messageButton addGestureRecognizer:tapGesture];
}


-(void)pushController{
//    NSLog(@"hello world");
    UIViewController *view=[[UIViewController alloc] init];
    view.view.backgroundColor=[UIColor whiteColor];
    view.navigationItem.title=@"编辑资料";

//    [self.navigationController pushViewController:view animated:YES];
//    [self.nav pushViewController:view animated:YES];

    
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
