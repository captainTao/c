//
//  mytextField.m
//  FirstApp
//
//  Created by captain on 2018/3/21.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "mytextField.h"

@implementation mytextField

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 2.0;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 5.0;
        self.delegate = self;
    }
    return self;
}

//开始编辑：
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.layer.borderColor =[UIColor blueColor].CGColor;
}

//编辑结束后：
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *content = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];//去掉内容中的空格；
    if ([content isEqualToString:@""] || content == nil) {
        self.layer.borderColor = [UIColor redColor].CGColor;
    }else{
        self.layer.borderColor = [UIColor greenColor].CGColor;
    }
}

// 点击done按键之后调用此方法：
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"the content of textfield is : %@",textField.text);
//    [self.view endEditing:YES];// 关闭键盘的强制响应，一般用在不知道焦点在谁的时候
    [textField resignFirstResponder];// 取消当前键盘输入响应，即：输入完毕，收起键盘；
    return true;
    //    return YES; // 两种return都可以用；
}

@end
