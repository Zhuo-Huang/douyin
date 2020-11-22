//
//  ImagePickerManager.m
//  HKMember
//
//  Created by zhangshaoyu on 14-6-11.
//  Copyright (c) 2014年 惠卡. All rights reserved.
//

#import "ImagePickerManager.h"

@interface ImagePickerManager () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ImagePickerManager

@synthesize succeedBack;
@synthesize errorBack;
@synthesize pickerType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.sourceType = self.pickerType;
    self.delegate = self;
    self.allowsEditing = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 异常处理

// 根据数据源异常处理
- (BOOL)exceptionHandlingwithSourceType
{
    if (![UIImagePickerController isSourceTypeAvailable:self.pickerType])
    {
        NSString *message = (self.pickerType == UIImagePickerControllerSourceTypeCamera ? @"该设备找不到相机" : @"资源不可访问");
        
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:message
                                   delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil, nil] show];
        
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - 代码块回调

- (void)getPickerImage:(void (^)(UIImage *image))succeed withError:(void (^)(void))error
{
    self.succeedBack = [succeed copy];
    self.errorBack = [error copy];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (!image)
    {
        image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    }
    
    if (self.succeedBack)
    {
        self.succeedBack(image);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    if (self.errorBack)
    {
        self.errorBack();
    }
}

@end
