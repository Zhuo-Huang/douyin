//
//  HZNameViewController.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/8/30.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "HZNameViewController.h"
#import "HZMessageController.h"
#import "NSString+UITextField_Expand.h"
@interface HZNameViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) HZMessageController *message;
@end

@implementation HZNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
            self.name=[[UILabel alloc]initWithFrame:CGRectMake(30, 80, 40, 20)];
    //        self.followed.backgroundColor = [UIColor grayColor];
            self.name.textColor=[UIColor blackColor];
            self.name.text=@"我的名字";
            self.name.font=[UIFont systemFontOfSize:14];
            [self.name sizeToFit];
            self.name;
            })];
    [self.view addSubview:({
        self.textfield=[[UITextField alloc]initWithFrame:CGRectMake(30, 100, 300, 50)];
    //        self.followed.backgroundColor = [UIColor grayColor];
        self.textfield.textColor=[UIColor blackColor];
        self.textfield.delegate=self;
        self.textfield.clearButtonMode=UITextFieldViewModeAlways;
        self.textfield.placeholder=@"别忘了写名字哦";
        self.textfield.borderStyle=UITextBorderStyleRoundedRect;
            self.textfield;
            })];
    
    [self.textfield lengthLimit:^{
           if (self.textfield.text.length > 20) {
               self.textfield.text = [self.textfield.text substringToIndex:20];
           }
        self.length.text=
            [NSString stringWithFormat:@"%lu/20",self.textfield.text.length];
            [self.length sizeToFit];
            NSLog(@"%lu",self.textfield.text.length);

       }];
       
    // Do any additional setup after loading the view.
    [self.view addSubview:({
            self.length=[[UILabel alloc]initWithFrame:CGRectMake(30, 160, 40, 20)];
    //        self.followed.backgroundColor = [UIColor grayColor];
            self.length.textColor=[UIColor blackColor];
        
            self.length.font=[UIFont systemFontOfSize:14];
            self.length;
            })];
    self.messageButton = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2+50, 200, 10, 10)];
    self.messageButton.backgroundColor = [UIColor grayColor];
    self.messageButton.font = [UIFont fontWithName:@"Verdana-Bold"size:17];
    [self.messageButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.messageButton sizeToFit];
     [self.view addSubview:self.messageButton];
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
           [self.messageButton addGestureRecognizer:tapGesture];
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//
//    self.length.text=
//    [NSString stringWithFormat:@"%lu/20",self.textfield.text.length];
//    [self.length sizeToFit];
//    NSLog(@"%lu",self.textfield.text.length);
//    if (self.textfield.text.length >= 20) {
//        return NO;
//    }
//    return YES;
//}// return NO to not change text


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textfield resignFirstResponder];
    
    NSLog(@"%@",self.textfield.text);
    return YES;
}
-(void)pushController{
    if (self.clickEditHandler) {
        self.clickEditHandler(self.textfield.text);
    }
//    self.navigationController.view.backgroundColor=[UIColor blueColor];
}
@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
