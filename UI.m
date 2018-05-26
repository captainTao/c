
https://www.jianshu.com/p/4be17ec40cfc
delegate、protocol、tagart-action、closure ？


Github  StackOverFlow
三方库：一个是用来网络请求，一个是用来加载图片的
AFNetworking，SDWebimage
主线代码，里面pod很多三方库


模拟器操作：

cmd +l :锁屏
cmd +shift +h :主界面
cmd +1, cmd +2, cmd +3, 4, 5; 调整模拟器大小；

编译：cmd+b
编译+运行：cmd+r
大小： cmd+1~7,一般用cmd+3


设置颜色十六进制的代码：
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0] // 宏定义16进制代码转rgb模式
self.loginbutton.backgroundColor = UIColorFromHex(0xC0FF3E);//用颜色的16进制设置颜色


/**********************************************/
question:
1.一个UIview中添加两种或以上的手势，同时作用，比如旋转和缩放？
2.一个UIview在手指移动的时候，进行拖动，在手指放开的时候，恢复到原来位置？



/**********************************************/
/*
 1> UIButton  -> UIControl -> UIView
 
 1.1 设置控件的状态
 
 启用、禁用
 @property(nonatomic,getter=isEnabled) BOOL enabled;
 选中、不选中
 @property(nonatomic,getter=isSelected) BOOL selected;
 高亮或者不高亮
 @property(nonatomic,getter=isHighlighted) BOOL highlighted;
 
 1.2 设置控件内容的布局
 垂直居中方向
 @property(nonatomic) UIControlContentVerticalAlignment contentVerticalAlignment;
 水平居中方向
 @property(nonatomic) UIControlContentHorizontalAlignment contentHorizontalAlignment;
 
 1.3 添加/删除监听方法
 - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
 - (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

 2> UILabel     -> UIView
 3> UIImageView -> UIView
 4> UITextField -> UIControl
 
 *** 代理设计模式，在OC中，使用最为广泛的一种设计模式
 
 1> 代理的用处是什么？
 *  监听那些不能通过addTarget监听的事件！
 *  主要用来负责在两个对象之间，发生某些事件时，来传递消息或者数据
 
 2> 代理的实现步骤
 (1)    成为(子)控件的代理，父亲（控制器）成为儿子（文本框）的代理
 (2)    遵守协议->利用智能提示，快速编写代码
 (3)    实现协议方法
 */


//////////////////////////////////////////////////////////////////////////


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blue.hidden = true;
    
    // UIbutton绑定事件；
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn setTitle:@"点击内容" forState:UIControlStateNormal]; //设置内容
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];//设置内容颜色
    btn.frame = CGRectMake(100, 200, 100, 100);
    // UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)]; //可以直接初始化的时候设置位置大小
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    // UIControlEventTouchUpInside:点击之后响应事件
    [self.view addSubview:btn];
}

- (void)buttonPressed:(UIButton *)bt // 含参的函数调用
{
    // button事件，跳转url
    NSLog(@"我被点击了！");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/jie-zou-da-shi/id493901993?mt=8"]];
    
    return;
    //    [self presentViewController:[TestVC new] animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)test6{
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
    
}

-(void)test5{
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

-(void)test4{
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

-(void)test3{
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
    
    //继承UIview的属性
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


-(void)test2{
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
    //从视图中移除
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
    self.blue.layer.borderColor = [UIColor redColor].CGColor;//注意要转换为CGColor
    //圆角：
    self.blue.layer.cornerRadius = 10;
    //阴影：
    self.blue.layer.shadowColor = [UIColor grayColor].CGColor;
    self.blue.layer.shadowOffset = CGSizeMake(10, 10); //设置shandow偏移量；
    _blue.layer.shadowOpacity = 0.5; //设置透明度

}


-(void)test1{
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
    
    

    //UIview的四个属性：frame, bounds, center, transform;

    // 添加一个色块：
    UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 200, 50)];
    //    UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 375-100-10, 50)];//375-100-10标识总的尺寸，然后左边留100，右边留10
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

//////////////////////////////////////////////////////////////////////////

/************************************************************/

先加载main.storyboard

1.设置main.storyboard的背景颜色；
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
}

2.视图控制器：
window --> UIViewcontroller --> UIview

3.获取当前设备的物理尺寸: UIscreen
- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加main.storyboard的背景颜色
    self.view.backgroundColor = [UIColor yellowColor];

    // 获取当前设备的物理尺寸: UIscreen
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"width = %f, height = %f", w, h);

    // 原点坐标(0,0)
    CGFloat x = [UIScreen mainScreen].bounds.origin.x;
    CGFloat y = [UIScreen mainScreen].bounds.origin.y;
    NSLog(@"x = %f, y = %f", x, y);
}

4.
frame:描述当前view视图在其父视图中的位置和大小
bounds:描述当前view视图在其自身坐标系统中的位置和大小
center:描述当前view视图的中心点在其父视图中的位置

一般来说，bounds属性比较少用，
通常使用frame来设置视图的大小和位置，
使用center来改变（移动）视图的位置（也可以用frame来改变位置）。
另外，对视图进行旋转，缩放也是相对于center进行操作的；


5.UI view对象中有以下属性：
frame - 改变视图的尺寸和位置
bounds - 改变视图的尺寸
center - 改变视图的位置
transform - 翻转或者缩放视图
alpha - 改变视图的透明度
backgroundColor - 背景颜色
contentStretch - 视图内容如何拉伸


6.创建 UIImageView 有两种方法
1、一种是通过 UIImage 来加载：

    UIImage *image = [UIImage imageNamed:@"picture"];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:image];


2、一种是通过initWithFrame来加载，然后手工修改UIImageView的属性    
animationImages：属性，是一个 NSArray，包含要加载到 UIImageView 中的图像；
animationRepeatCount：属性，指定动画播放多少次，不指定为无限循环播放；
image：属性，指定一个要加载的图像；
startAnimating：方法，开始播放动画；
stopAnimating：方法，停止播放动画；


7.通过拖拽main.storyboard到viewcontoller中，在interface和end之间；
形成如下：
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blue;
@end

拖拽的view一般我们写weak属性，否则比较容易形成强持有关系，很难被释放
通过代码添加的空间，一般使用strong.

通过代码链接之后，同样可以在viewcontroller中通过代码来修改控件
self.blue.backgroundColor = [UIColor grayColor];


layer和UIview的区别：
1.layer无法响应响应事件， UIview可以响应
2.layer继承自NSObject,  UIview继承自UIResponder
3.layer：主要进行内容的绘制，创建；UIview：显示管理
4.layer：能实现一些特殊的效果，比如圆角和阴影



8.UILabel:
链接url:
https://www.jianshu.com/p/d4c71fbd440e





/************************************************************/
UIColor的颜色#494949转rgb模式！

//
//  UIColor+ext.h
//  HFramework
//
//  Created by zhangchutian on 14-6-5.
//  Copyright (c) 2014年 zhangchutian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ext)

- (UIColor *)revertColor;

//formate : @"#f6ee34" or @"0x45fed2"
+ (UIColor *)colorWithString:(NSString *)colorStr alpha:(float)alpha;
+ (UIColor *)colorWithString:(NSString *)colorStr;

//formate : 0x9875a3
+ (UIColor *)colorWithHex:(int)hex alpha:(float)alpha;
+ (UIColor *)colorWithHex:(int)hex;

+ (UIColor *)random;
@end

/*---------------------------分割线---------------------------------*/
//
//  UIColor+ext.m
//  HFramework
//
//  Created by zhangchutian on 14-6-5.
//  Copyright (c) 2014年 zhangchutian. All rights reserved.
//

#import "UIColor+ext.h"

@implementation UIColor (ext)
- (UIColor *)revertColor
{
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    if (colorSpaceModel == kCGColorSpaceModelRGB)
    {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        return [UIColor colorWithRed:(1.0 - components[0]) green:(1.0 - components[1]) blue:(1.0 - components[2]) alpha:components[3]];
    }
    else return nil;
}

+ (UIColor *)colorWithString:(NSString *)colorStr
{
    return [self colorWithString:colorStr alpha:1.0];
}

+ (UIColor *)colorWithString:(NSString *)colorStr alpha:(float)alpha
{
    NSString *cString = [[colorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return [UIColor clearColor];
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];

    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hex
{
    return [self colorWithHex:hex alpha:1.0];
}

+ (UIColor *)colorWithHex:(int)hex alpha:(float)alpha
{
    float r = ((float)((hex & 0xff0000) >> 16))/255.0;
    float g = ((float)((hex & 0xff00) >> 8))/255.0;
    float b = ((float)((hex & 0xff) >> 0))/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}
+ (UIColor *)random
{
    return [UIColor colorWithRed:(arc4random()%256)*1.0/256 green:(arc4random()%256)*1.0/256 blue:(arc4random()%256)*1.0/256 alpha:1];
}
@end


/************************************************************/


安装cocoapods:
http://blog.csdn.net/zhang5690800/article/details/51891879
使用cocoapods：
http://www.cocoachina.com/ios/20180110/21815.html

1.1.1

错误：
error: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool: can't locate file for: -lPods-SuperStoreFW
error: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool: file: -lPods-SuperStoreFW is not an object file (not allowed in a library)
原因：
依赖除了问题，参考链接：https://www.jianshu.com/p/8c34e45a0499




/************************************************************/
绘图：
Quartz2d绘制图形，图标，
drwaRect 重绘
CoreGraphics核心矩阵操作





/************************************************************/


     