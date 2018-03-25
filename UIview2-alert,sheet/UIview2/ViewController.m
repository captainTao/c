//
//  ViewController.m
//  UIview2
//
//  Created by captain on 2018/3/22.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
#import "UiviewtoAlertView.h"

@interface ViewController () <UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*本文讲解： UIAlertView和UIActionSheet  后学再学习UIAlertController */
    
    // UIAlertView在ios9之后不推荐使用了，苹果不进行维护，推荐使用UIAlertController
    [self test7];
    
    
    // 自定义alertview:  == 1个lable +2个button:

    UiviewtoAlertView *myalertview = [[UiviewtoAlertView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 100)];
    [self.view addSubview: myalertview];

}

// UIActionSheet:
// 代理为self时候，协议用：UIActionSheetDelegate， 响应方法：
// Cancel--最下面，OK---最上面
// ok--0  , other1 -1 , other2 -2 , cancle -3 （index从上往下依次递增）
- (void)test7{
    UIActionSheet *sheet1 = [[UIActionSheet alloc]initWithTitle:@"Action" delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:@"OK" otherButtonTitles:@"other1",@"other2", nil];
    sheet1.actionSheetStyle = UIActionSheetStyleDefault;
    [sheet1 showInView:self.view];
}

// UIActionSheet点击的响应方法:
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"button Index = %ld", buttonIndex);
}

// UIAlertView:
- (void)test6{
    // 如果代理为自己，那么对一个的.m文件需要遵守 <UIAlertViewDelegate>协议
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;// name,password模式；
    [alert show];
}

// test5的结果输出的是： cancel--0  ok--1  textfield--nil
- (void)test5{
    // 如果代理为自己，那么对一个的.m文件需要遵守 <UIAlertViewDelegate>协议
    // ok--1  cancel--0  textfield--nil
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *alertextfield = [alert textFieldAtIndex:0]; // 找到textfield的输入
    alertextfield.keyboardType = UIKeyboardTypeNumberPad;// 数字键
    [alert show];
}

// test4结果输出是"cancle"--index:0  "1"--index:1  "2"--index:2  (从cancle = 0开始算起走)
- (void)test4{
    // 如果代理为自己，那么对一个的.m文件需要遵守 <UIAlertViewDelegate>协议
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"1",@"2", nil];
    [alert show];
}

// 点击alerView的响应方法：
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex = %ld", buttonIndex);
    if(buttonIndex == 1){

         // test5中的调用：
         UITextField *textfield = [alertView textFieldAtIndex:0];
         NSLog(@"输入的内容为%@",textfield.text);
         
        // test 6中的调用：
        UITextField *textfield1 = [alertView textFieldAtIndex:0];
        UITextField *textfield2 = [alertView textFieldAtIndex:1];
        NSLog(@"name = %@, password = %@", textfield1.text, textfield2.text);
    }

}

- (void)test3{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:nil cancelButtonTitle:@"Cancle" otherButtonTitles:@"1",@"2", nil];
    [alert show];
}
// cancle - 0 ok -1
- (void)test2{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
    [alert show];
}
- (void)test1{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

// 弹出对话框
- (void)createAlterController
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示信息" message:@"保存" preferredStyle:UIAlertControllerStyleAlert];
    //确定按钮的风格是默认的
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
        //添加你自己让他发生的事件  都是一样的！！！！！
    }];
    //取消按钮的风格是取消， 并且一直在最下边，且只能有一个
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil];
    [alter addAction:sure];
    [alter addAction:cancle];
    [alter addAction:delete];
    
    [self presentViewController:alter animated:YES completion:^{
        
    }];
}

// 文本对话框：
- (void)createUIAlertControllerWithTextField
{
    UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"文本对话框" message:@"保存" preferredStyle:UIAlertControllerStyleAlert];
    [alert2 addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入用户名" ;
    }];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //         UITextField *longinTextField = alert2.textFields.firstObject;
        //         UITextField *pad = alert2.textFields.lastObject;
    }];
    [alert2 addAction:sure];
    [self presentViewController:alert2 animated:YES completion:^{
        
    }];
    
}

// 上拉菜单
- (void)create
{
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"上拉对话框" message:@"保存" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil];
    [sheet addAction:sure];
    [sheet addAction:cancle];
    [sheet addAction:delete];
    
    [self presentViewController:sheet animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
