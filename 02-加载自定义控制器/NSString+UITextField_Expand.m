//
//  NSString+UITextField_Expand.m
//  02-加载自定义控制器
//
//  Created by huangzhuo on 2020/9/1.
//  Copyright © 2020 itheima. All rights reserved.
//

#import "NSString+UITextField_Expand.h"
#import <objc/runtime.h>

@implementation UITextField (Expand)

static char limit;

- (void)setLimitBlock:(LimitBlock)limitBlock {
    objc_setAssociatedObject(self, &limit, limitBlock, OBJC_ASSOCIATION_COPY);
}

- (LimitBlock)limitBlock {
    return objc_getAssociatedObject(self, &limit);
}

- (void)lengthLimit:(void (^)(void))limit {
    [self addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    self.limitBlock = limit;
}

- (void)textFieldEditChanged:(UITextField *)textField {
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position){
        if (self.limitBlock) {
            self.limitBlock();
        }
    }
}

@end
