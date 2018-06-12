//
//  ViewController.m
//  FirstApp
//
//  Created by captain on 2018/2/26.
//  Copyright © 2018年 captain. All rights reserved.
//
/*
 1.1 继承自UIControl的控件
 ------------------------------------------
 1> UIButton    ->  UIControl   ->  UIView
 
 1.2 继承自UIView的视图
 ------------------------------------------
 1> UILabel     ->  UIView
 2> UIImageView ->  UIView
 3> UITextField ->  UIView
 */
#import "ViewController.h"
#import "mybutton.h"
#import "mytextField.h"
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0] // 宏定义16进制代码转rgb模式

@interface ViewController () <UITextFieldDelegate> // 这儿加上Uitextfield需要遵守的协议
{
    mytextField *userText;
    mytextField *pwdText;
}

@property (weak, nonatomic) IBOutlet UIView *blue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blue.hidden = true;
    self.mybutton.hidden = true;
    /*** insert code below .. ***/
    
    [self testUITextfield10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 自定义textfield:

-(void)testUITextfield10{

    self.loginbutton.layer.borderWidth = 2.0;
    self.loginbutton.layer.borderColor = [UIColor purpleColor].CGColor;
    
    self.loginbutton.backgroundColor = [UIColor grayColor];
    self.loginbutton.backgroundColor = UIColorFromHex(0xC0FF3E);//用颜色的16进制设置颜色
    
    [self.loginbutton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    userText = [[mytextField alloc]initWithFrame:CGRectMake(20, 60, 300, 30)];
    userText.placeholder = @"用户名";
    userText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [userText becomeFirstResponder]; // 设置初始化焦点
//    userText.delegate = self;
   
    pwdText = [[mytextField alloc]initWithFrame:CGRectMake(20, 100, 300, 30)];
    pwdText.placeholder = @"密码";
    pwdText.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwdText.secureTextEntry = YES;
//    pwdText.delegate = self;
    
    [self.view addSubview:userText];
    [self.view addSubview:pwdText];
    
    
}

// loginAction button点击时候调用方法：(自定义textfield)
- (IBAction)loginAction:(UIButton *)sender {
    [userText resignFirstResponder]; // 取消键盘的响应
    [pwdText resignFirstResponder];
    userText.layer.borderColor = [UIColor grayColor].CGColor;
    pwdText.layer.borderColor = [UIColor grayColor].CGColor;
    NSLog(@"%s %@ %@", __func__, userText.text, pwdText.text);
    userText.text = @"";
    pwdText.text = @"";
}


# pragma mark UITextFiled:

// 绑定UItextfield的事件，需要设置代理<UITextFieldDelegate>
-(void)testUITextfield9{
    // 文本框的属性
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(20, 50, 300, 30)];
    textfield.borderStyle = UITextBorderStyleRoundedRect; // 设置输入框为圆角矩形
    /*
    注意，设置button背景图像与边框样式UITextBorderStyleRoundedRect不能重叠使用
     textFiled.background = [UIImage imageNamed:@"img_01"];
     */
    
    textfield.textColor = [UIColor blueColor];
    textfield.text = @"text";
    textfield.font = [UIFont systemFontOfSize:17.0];
    textfield.placeholder = @"please enter your text..";
    textfield.backgroundColor = [UIColor yellowColor];
    
    textfield.layer.borderColor = [UIColor greenColor].CGColor;
    textfield.layer.borderWidth = 2.0;
    textfield.layer.cornerRadius = 5.0;
    
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing; // 设置文本的清除模式
    textfield.tag = 100;
    textfield.keyboardType = UIKeyboardTypeURL; // 键盘类型
    textfield.returnKeyType = UIReturnKeyDone; // 设置enter键的显示文字
    
    textfield.secureTextEntry = YES; // 设置密码输入就变点
    textfield.autocorrectionType = UITextAutocorrectionTypeNo; // 设置是否自动纠错
    textfield.clearsOnBeginEditing = YES; //再次编辑就清空
    [self.view addSubview:textfield];
    
    /*
     文本框的响应方法：
     跟button响应方法不同，文本是通过设置代理：
     1.设置代理为self
     2.当前方法需要遵守协议<UITextFieldDelegate>
     */
    textfield.delegate = self;
    
    
    
    /*
     自定义UITextField的样式:
     目标：在输入框的左边加入一个图标；
     1.设置一个imageview，图片，宽高，
     2.设置imageview的image
     3.设置imageview的图片居中
     4.添加imageview到最左边
     5.设置输入框左边的view的leftViewMode永久显示 textfield.leftViewMode =  UITextFieldViewModeAlways;
     6.设置输入框右边编辑时或者永久显示清除按钮 textfield.clearButtonMode = UITextFieldViewModeAlways；
     */
    
    UIImageView *leftimage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01.jpg"]];
    
    // 这儿设置值传递必须用一个中间值，先写属性，再取结构体：
    CGRect temp =leftimage.frame;
    temp.size.height = textfield.frame.size.height - 2;
    temp.size.width =temp.size.height;
    leftimage.frame = temp;
    
    leftimage.contentMode =UIViewContentModeScaleAspectFit;
    // leftimage.contentMode = UIViewContentModeCenter; //一般设置居中；这儿图片太大，就不能这么设置了
    textfield.leftView =leftimage;
    textfield.leftViewMode =  UITextFieldViewModeAlways; // 图标一直出现在输入框中
}

// 点击done按键之后调用此方法：
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"调用了tag=%ld的文本框",(long)textField.tag);
    if (textField == userText) {
        [pwdText becomeFirstResponder];
    }else {
//        [self.view endEditing:YES];// 关闭键盘的强制响应，一般用在不知道焦点在谁的时候
        [textField resignFirstResponder];// 取消当前键盘输入响应，即：输入完毕，收起键盘；
    }
    return true;
//    return YES; // 两种return都可以用；
}

// 输入完成后调用此方法；在上面done方法之后调用；
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"输入的text = %@", textField.text);
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"%@  %@", NSStringFromRange(range), string);
    unsigned long loca = range.location;
    return (loca <6); // 字符长度为6
    /*
     if (loca < 6) {
     return YES;
     }else{
     return NO;
     }

     return yes的时候可以输入；
     return No的时候不能输入；
     */
}

# pragma mark UIButton：
/*
 UIbutton的背景图会填充整个button区域，图片会拉伸
 UIbutton设置image属性的时候，图片不会占据整个button
 UIbutton设置属性最好通过set方式，并指定状态，直接赋值可能没有效果
 UIbutton的title不能直接进行赋值改变  btn.title
 */
// 自定义button:
-(void)testUIButton8{
    // 设置button内部的图片和文字位置:
    mybutton *btn2 = [[mybutton alloc]initWithFrame:CGRectMake(80, 70, 200, 100)];
    btn2.backgroundColor = [UIColor yellowColor];
    btn2.titleLabel.font = [UIFont systemFontOfSize:26]; // 设置btn中文字的大小
    [self.view addSubview: btn2];
}

// myaction button点击时候调用方法：
- (IBAction)myaction:(id)sender { // 通过拖拽方式生成的btn1的方法，点击之后响应：
    UIButton *btn1 = (UIButton *)sender; //把id类型转为uibutton
    btn1.backgroundColor = [UIColor greenColor];
}

-(void)testUIButton7{
    
    // button的枚举类型：UIControlStateNormal   UIButtonTypeCustom
    // UIbutton 继承自UIControl, UIControl继承自UIView；
    // UIbutton绑定事件；
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    /*button type的类型：
     UIButtonTypeCustom = 0,                         // no button type,自定义类型
     UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // standard system button
     
     UIButtonTypeDetailDisclosure, // 蓝色小箭头按钮，主要做详细说明用
     UIButtonTypeInfoLight, // 一个i信息图标,亮色
     UIButtonTypeInfoDark, // 一个i信息图标,暗色
     UIButtonTypeContactAdd, // 一个+号图标
     */
    [btn setBackgroundColor:[UIColor grayColor]];
    // btn.backgroundColor = [UIColor greenColor]; // 也可以这样设置
    
    // [btn setBackgroundImage:[UIImage imageNamed:@"img4.jpg"] forState:UIControlStateNormal];
    // UIControlStateHighlighted:设置高亮，button点击之后的高亮的背景
    [btn setBackgroundImage:[UIImage imageNamed:@"btnbg.jpg"] forState:UIControlStateHighlighted];
    
    [btn setTitle:@"点击内容" forState:UIControlStateNormal]; //设置内容
    // 默认情况下字体title的颜色为白色
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];//设置内容颜色
    
    // UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)]; //可以直接初始化的时候设置位置大小
    btn.frame = CGRectMake(130, 200, 100, 100);
    
    // UIControlEventTouchUpInside:点击之后响应事件
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    /*
     typedef NS_OPTIONS(NSUInteger, UIControlEvents) {
     UIControlEventTouchDown                                         = 1 <<  0,      // on all touch downs,点击按钮后触发
     UIControlEventTouchDownRepeat                                   = 1 <<  1,      // on multiple touchdowns (tap count > 1)
     UIControlEventTouchDragInside                                   = 1 <<  2,
     UIControlEventTouchDragOutside                                  = 1 <<  3,
     };
     button.showsTouchWhenHighlighted = YES; // 这个属性设置yes,按钮按下会发光
     */
}

- (void)buttonPressed:(UIButton *)bt // 含参的函数调用,如果方法没有冒号，这儿就不加后面的参数；
{
    // button事件，跳转url
    NSLog(@"我被点击了！");
    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/jie-zou-da-shi/id493901993?mt=8"]]; // 老版本的用法，10已经启用openURL
    NSString *scheme = @"itms-apps://itunes.apple.com/cn/app/jie-zou-da-shi/id493901993?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scheme] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"Open %@: %d",scheme,success);
    }];
    
    [bt removeTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside]; // 点击一下之后移除事件
//    return;
    // [self presentViewController:[TestVC new] animated:YES completion:nil];
}

#pragma mark 多个图片的UIImageView：轮播效果图

-(void)testCarousel6{
    // 图片轮播效果，幻灯片效果
    UIImage *img1 = [UIImage imageNamed:@"img1.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"img2.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"img3.jpg"];
    
    //设置imageview的尺寸
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat imgheight = screensize.width * (img1.size.height / img1.size.width);
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screensize.width, imgheight)];
    
    imageview.animationImages = [NSArray arrayWithObjects:img1,img2,img3, nil];//设置图像，需要先把图像包装成UIimage
    imageview.animationDuration = 3; //循环间隔
    imageview.animationRepeatCount =5; //循环次数
    imageview.alpha = 0.9; // 修改view的透明度alpha,取值范围为0-1，数值越小，透明度越高；
    [self.view addSubview:imageview];
    [imageview startAnimating]; //开始动画
    [imageview stopAnimating]; //停止动画
    
}

#pragma mark 单个图片的UIImageView：
-(void)testUIImage5{
    /*
     typedef NS_ENUM(NSInteger, UIViewContentMode) {
     UIViewContentModeScaleToFill,         // 填充，会变形,
     UIViewContentModeScaleAspectFit,      // 居中适配，不变形, contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // 全部填充，不变形，部分裁切, contents scaled to fill with fixed aspect. some portion of content may be clipped.
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     };
     凡是没有带Scale的，当图片尺寸超过 ImageView尺寸时，只有部分显示在ImageView中;
     
     */
    
    UIImage *img2 = [UIImage imageNamed:@"img4.jpg"];
    UIImageView *imageview2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 300, 500)];
    imageview2.image = img2;
    imageview2.contentMode = UIViewContentModeScaleAspectFit;
    //view的变换：
    imageview2.center = CGPointMake(150, 300);//中心移动：移动view的中心点
    imageview2.transform = CGAffineTransformMakeRotation(M_1_PI);//旋转办法；
    imageview2.transform = CGAffineTransformMakeScale(0.5, 0.5);//缩放，参数分别为宽，高
    imageview2.transform = CGAffineTransformMakeTranslation(100, 100);//相对移动：屏幕上的点再移动100，100
    
    [self.view addSubview:imageview2];
    imageview2.layer.borderColor = [UIColor redColor].CGColor;
    imageview2.layer.borderWidth = 3.0;
    
}

-(void)testUIImage4{
    /*
     UIImageView: UI + image + view
     
     直接通过imageview添加的图片没有大小限制，会根据图片的实际大小来展示；
     UIImageView *imageview2 = [[UIImageView alloc]initWithImage:img1];
     [self.view addSubview:imageview2];
     */
    
    UIImage *img1 = [UIImage imageNamed:@"img1.jpg"];
    //根据屏幕设备的宽度来适配图片的高度
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat imgheight = screensize.width * (img1.size.height / img1.size.width);
    UIImageView *imageview1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screensize.width, imgheight)];
    imageview1.image = img1;
    [self.view addSubview:imageview1];
    
}

#pragma mark UILable:

-(void)testUILable3{
    // UIlabel的相关属性：url：https://www.jianshu.com/p/d4c71fbd440e
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 70, 200, 100)];//位置
    label1.backgroundColor = [UIColor grayColor];//背景颜色
    label1.text  = @"这是label1的内容！";//内容
    [label1 setText:@"hello,world 你好,呵呵呵，哈哈哈，哼哼，唧唧，乐乐, 说走咱就走啊，你有我有全都有啊！嘿嘿嘿！！！"];
    label1.textColor = [UIColor greenColor];//字体颜色
    [label1 setTextColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0]];//设置rgb;
    label1.font = [UIFont systemFontOfSize:12.0];//字体大小
    label1.font = [UIFont fontWithName:@"Menlo" size:14.0];//字体
    label1.font = [UIFont boldSystemFontOfSize:13];//加粗
    label1.font = [UIFont italicSystemFontOfSize:13.0];//斜体
    [label1 setTextAlignment:NSTextAlignmentCenter];//文本对齐
    label1.textAlignment = NSTextAlignmentLeft;
    [label1 setNumberOfLines:3];//设置行数
    [label1 setLineBreakMode:NSLineBreakByWordWrapping]; //折行模式
    label1.lineBreakMode = NSLineBreakByTruncatingTail; //最后省略模式
    //label1.adjustsFontSizeToFitWidth = true; //字体大小自适应,这种方法会缩小字体，不建议使用
    label1.numberOfLines = 0; //行数自适应
    [self.view addSubview:label1];
    
    //继承UIview的属性,这是label的样式
    label1.layer.borderColor = [UIColor redColor].CGColor; //转换为CGcolor
    label1.layer.borderWidth = 5.0;
    label1.layer.shadowColor = [UIColor greenColor].CGColor; //转换为CGcolor
    label1.layer.cornerRadius = 5.0;
    label1.layer.shadowOffset = CGSizeMake(20, 20);
    label1.layer.shadowOpacity = 0.7; //阴影的透明度，越大越不透明；
    
    //设置label中的字体样式
    label1.shadowColor = [UIColor yellowColor];
    label1.shadowOffset = CGSizeMake(2, 2);
    
    
    
    //根据label的内容设置合适的宽和高,比如微信：
    UIFont *font = [UIFont systemFontOfSize:15.0];
    NSString *content =@"hello,嘿嘿！！！";
    //根据文本内容，以及字体大小生成合适的宽高。
    CGSize lableWh = [content sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, lableWh.width, lableWh.height)];
    label2.text = content;
    label2.font = font;
    label2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label2];
    
}

# pragma mark UIView:

-(void)testUIview2{
    // view的增删改查：
    UIView *viewcolor1 = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 200, 50)];
    viewcolor1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:viewcolor1];
    
    UIView *viewcolor2 = [[UIView alloc]initWithFrame:CGRectMake(75, 105, 200, 50)];
    viewcolor2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewcolor2];//在最后一个view后面添加
    
    //插入某个view到哪一层
    [self.view insertSubview:viewcolor2 atIndex:2];
    //view的交换,self.view的index为1，后面的子视图依次+1;
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    
    UIView *viewcolor3 = [[UIView alloc]initWithFrame:CGRectMake(80, 110, 200, 50)];
    viewcolor3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:viewcolor3];//在最后一个view后面添加
    
    //调整到最后一个view
    [self.view sendSubviewToBack:viewcolor3];
    //调整到最前面来
    [self.view bringSubviewToFront:viewcolor3];
    //从父视图中移除
    [viewcolor3 removeFromSuperview];
    
    
    //遍历：
    viewcolor1.tag = 1;//添加tag
    viewcolor2.tag = 2;
    viewcolor3.tag = 3;
    NSArray *subviewArray = self.view.subviews;//通过父视图获取子视图
    for (UIView *view in subviewArray){ // 通过数组遍历
        if(view.tag == 1){
            view.backgroundColor = [UIColor grayColor];
        }
        if(view.tag == 2){
            view.frame = CGRectMake(75, 105, 250, 70);
        }
    }
    
    
    /*
     layer和UIview的区别：
     1.layer无法响应响应事件， UIview可以响应
     2.layer继承自NSObject,  UIview继承自UIResponder
     3.layer：主要进行内容的绘制，创建；UIview：显示管理
     4.layer：能实现一些特殊的效果，比如圆角和阴影
     */
    //修改view的透明度alpha,取值范围为0-1，数值越小，透明度越高；
    _blue.alpha = 0.7;
    //隐藏：hidden属性为bool类型，也可以设置它的透明度为0来把它隐藏
    self.blue.hidden = false;
    
    //描边：
    self.blue.layer.borderWidth = 3;
    self.blue.layer.borderColor = [UIColor redColor].CGColor;//注意要转换为CGColor,所有的layer图层都要使用CGColor属性
    //圆角：
    self.blue.layer.cornerRadius = 10;
    //阴影：
    self.blue.layer.shadowColor = [UIColor grayColor].CGColor;
    self.blue.layer.shadowOffset = CGSizeMake(10, 10); //设置shandow偏移量；
    _blue.layer.shadowOpacity = 0.5; //设置透明度

}


-(void)testUIView1{
    /*
     struct CGRect { //CGRect两个属性 origin, size;
     CGPoint origin;
     CGSize size;
     };
     struct CGSize {
     CGFloat width;
     CGFloat height;
     };
     struct CGPoint {
     CGFloat x;
     CGFloat y;
     };
     */
    // 添加main.storyboard的背景颜色
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 获取当前设备的物理尺寸: UIscreen
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"width = %f, height = %f", w, h);
    
    // 获取原点坐标
    CGFloat x = [UIScreen mainScreen].bounds.origin.x;
    CGFloat y = [UIScreen mainScreen].bounds.origin.y;
    NSLog(@"x = %f, y = %f", x, y);
    
    
    //UIview的四个属性：frame, bounds, center, transform, alpha, backgroundColor, contentStrench（视图内容如何拉伸）;
    /*
     frame:描述当前view视图在其父视图中的位置和大小
     bounds:描述当前view视图在其自身坐标系统中的位置和大小
     center:描述当前view视图的中心点在其父视图中的位置
     
     一般来说，bounds属性比较少用，
     通常使用frame来设置视图的大小和位置，
     使用center来改变（移动）视图的位置（也可以用frame来改变位置）。
     另外，对视图进行旋转，缩放也是相对于center进行操作的；
     */
    
    // 添加一个色块：
    UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 200, 50)];
    // UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 375-100-10, 50)];//375-100-10标识总的尺寸，然后左边留100，右边留10
    viewcolor.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:viewcolor];
    
    CGFloat x1 = viewcolor.frame.origin.x;
    CGFloat y1 = viewcolor.frame.origin.y;
    NSLog(@"x=%f,y=%f",x1,y1);//x=70.000000,y=100.000000
    NSLog(@"size=%@",NSStringFromCGSize(viewcolor.frame.size));//size={200, 50},相对于屏幕的宽高
    NSLog(@"bounds=%@",NSStringFromCGRect(viewcolor.bounds));//bounds={{0, 0}, {200, 50}}，相对于自己的宽高
    NSLog(@"bounds=%@",NSStringFromCGRect(self.view.bounds));//bounds={{0, 0}, {375, 667}}，这是屏幕的尺寸
    
    
    // 图片轮播效果
    UIImage *img1 = [UIImage imageNamed:@"img1.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"img2.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"img3.jpg"];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    imageview.animationImages = [NSArray arrayWithObjects:img1,img2,img3, nil];
    imageview.animationDuration = 5;
    [imageview startAnimating];
    [self.view addSubview:imageview];
    
}


@end
