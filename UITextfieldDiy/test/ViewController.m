//
//  ViewController.m
//  test
//
//  Created by captain on 2018/6/13.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
#import "MyTextField.h"
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0] // 宏定义16进制代码转rgb模式

@interface ViewController () <UITextFieldDelegate>
{
    MyTextField *userText;
    MyTextField *pwdText;
}
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;
- (IBAction)myaction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testUITextfield10];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testUITextfield10{
    
    self.loginbutton.layer.borderWidth = 2.0;
    self.loginbutton.layer.borderColor = [UIColor purpleColor].CGColor;
    
    self.loginbutton.backgroundColor = [UIColor grayColor];
    self.loginbutton.backgroundColor = UIColorFromHex(0xC0FF3E);//用颜色的16进制设置颜色
    
    [self.loginbutton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    userText = [[MyTextField alloc]initWithFrame:CGRectMake(20, 60, 300, 30)];
    userText.placeholder = @"用户名";
    userText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [userText becomeFirstResponder]; // 设置初始化焦点
        userText.delegate = self;
    
    pwdText = [[MyTextField alloc]initWithFrame:CGRectMake(20, 100, 300, 30)];
    pwdText.placeholder = @"密码";
    pwdText.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwdText.secureTextEntry = YES;
        pwdText.delegate = self;
    
    [self.view addSubview:userText];
    [self.view addSubview:pwdText];
    
    
}

- (IBAction)myaction:(id)sender {
    NSLog(@"the excuting function is: %s; the input content is: user = %@, pwd = %@", __func__, userText.text, pwdText.text);
    [userText resignFirstResponder];
    [pwdText resignFirstResponder];
    userText.layer.borderColor = [UIColor grayColor].CGColor;
    pwdText.layer.borderColor = [UIColor grayColor].CGColor;
    userText.text = @"";
    pwdText.text = @"";
}

//开始编辑：
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.layer.borderColor =[UIColor blueColor].CGColor;
}

//编辑结束后：
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *content = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];//去掉内容中的空格；
    if ([content isEqualToString:@""] || content == nil) {
        textField.layer.borderColor = [UIColor redColor].CGColor;
    }else{
        textField.layer.borderColor = [UIColor greenColor].CGColor;
    }
}

// 回车后调用
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == userText) {
        [pwdText becomeFirstResponder];
    }else if (textField == pwdText){
        [self myaction:_loginbutton];
    }
    return YES;
}

// 字符串长度；
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == pwdText) {
        return (range.location < 6);
    }
    return YES;
}
@end
