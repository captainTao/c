//
//  ViewController.m
//  UIview2
//
//  Created by captain on 2018/3/22.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
#import "UiviewtoAlertView.h"
/*本文讲解： UIAlertView和UIActionSheet  后学再学习UIAlertController */

@interface ViewController () <UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self AlterViewWithTwoTextField6];// AlterView调用
    
     // 自定义alertview:  == 1个lable +2个button:
     UiviewtoAlertView *myalertview = [[UiviewtoAlertView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 100)];
    [self.view addSubview: myalertview];

    
}

# pragma mark UIAcitonSheet:  <UIActionSheetDelegate>
// UIActionSheet:
// 代理为self时候，协议用：UIActionSheetDelegate， 响应方法：
// Cancel--最下面，OK---最上面
// ok--0  , other1 -1 , other2 -2 , cancle -3 （index从上往下依次递增）
- (void)ActionSheet{
    UIActionSheet *sheet1 = [[UIActionSheet alloc]initWithTitle:@"Action" delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:@"OK" otherButtonTitles:@"other1",@"other2", nil];
    sheet1.actionSheetStyle = UIActionSheetStyleDefault;
    [sheet1 showInView:self.view];
}

// UIActionSheet点击的响应方法:
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"button Index = %ld", buttonIndex);
}



# pragma mark UIAlertView  <UIAlertViewDelegate>
// UIAlertView:
- (void)AlterViewWithTwoTextField6{
    // 如果代理为自己，那么对一个的.m文件需要遵守 <UIAlertViewDelegate>协议
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK",@"other", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;// name,password模式；
    [alert show];
}

// test5的结果输出的是： cancel--0  ok--1  textfield--nil
- (void)AlterViewWithTextField5{
    // 如果代理为自己，那么对一个的.m文件需要遵守 <UIAlertViewDelegate>协议
    // ok--1  cancel--0  textfield--nil
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    /*
     UIAlertViewStyleDefault = 0,  // 默认
     UIAlertViewStyleSecureTextInput,  // 密文
     UIAlertViewStylePlainTextInput,  // 普通文本
     UIAlertViewStyleLoginAndPasswordInput  // user and pwd
     */
    UITextField *alertextfield = [alert textFieldAtIndex:0]; // 找到textfield的输入
    alertextfield.keyboardType = UIKeyboardTypeNumberPad;// 数字键
    [alert show];
}

// test4结果输出是"cancle"--index:0  "1"--index:1  "2"--index:2  (从cancle = 0开始算起走)
- (void)AlterView4{
    // 如果代理为自己，那么对一个的.m文件需要遵守 <UIAlertViewDelegate>协议
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"1",@"2", nil];
    [alert show];
}


/*
 1>  ok - index:0
 2>  cancle - index:0  ok - index:1  // textfield - index:0
 3>  cancle"--index:0  "1"--index:1  "2"--index:2  // textfield - index:0  textfield - index:1
*/

// 点击alerView的delegate响应方法：
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex = %ld", buttonIndex);
    if(buttonIndex == 1){

         // AlterViewWithTextField5中的调用：
         UITextField *textfield = [alertView textFieldAtIndex:0];
         NSLog(@"输入的内容为%@",textfield.text);
        
        // AlterViewWithTwoTextField6中的调用：
        UITextField *textfield1 = [alertView textFieldAtIndex:0];
        UITextField *textfield2 = [alertView textFieldAtIndex:1];
        NSLog(@"name = %@, password = %@", textfield1.text, textfield2.text);
    }

}

# pragma mark UIAlertView no delegete

- (void)AlterView3{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"1",@"2", nil];
    [alert show];
}
// cancle - 0 ok -1
- (void)AlterView2{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
    [alert show];
}
- (void)AlterView1{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ALert" message:@"message" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


# pragma mark UIAlertController:

// refer to : https://www.jianshu.com/p/85edffe95d2a
// UIAlertView, UIActionSheet 在ios8之后不推荐使用了,苹果不进行维护,推荐使用 UIAlertController :UIViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 不能直接在viewDiaLoad中调用[self actionSheet]
    [self alertStyleWithTwoTextField];
}


// 无标题的弹窗
- (void)alterStyleWithThreeItems
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *showAllInfoAction = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *commentAction = [UIAlertAction actionWithTitle:@"评论" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:commentAction];
    [actionSheetController addAction:showAllInfoAction];
    
    [self presentViewController:actionSheetController animated:YES completion:nil];
    
}

// 带标题的弹窗
- (void)alterStyleWithThreeItemsWithTitle
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示信息" message:@"保存" preferredStyle:UIAlertControllerStyleAlert];
    //    UIAlertController *alter =[UIAlertController alertControllerWithTitle:@"提示信息" message:@"保存？" preferredStyle:UIAlertControllerStyleActionSheet];//sheet风格
    
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

// 输入弹窗：
- (void)alertStyleWithTextField
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:@"输入姓名" preferredStyle:UIAlertControllerStyleAlert];
    [actionSheetController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入姓名";
    }];
    
    UIAlertAction *determineAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheetController addAction:determineAction];
    [actionSheetController addAction:cancelAction];
    
    [self presentViewController:actionSheetController animated:YES completion:nil];
}


// 带标题的文本框：
- (void)alertStyleWithTextFieldWithTitle
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

// 两个文本框：
- (void)alertStyleWithTwoTextField
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:@"登录" preferredStyle:UIAlertControllerStyleAlert];
    [actionSheetController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"账号";
    }];
    [actionSheetController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *determineAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheetController addAction:determineAction];
    [actionSheetController addAction:cancelAction];
    
    [self presentViewController:actionSheetController animated:YES completion:nil];
}

// 上拉菜单sheet风格
- (void)SheetStyleController
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
