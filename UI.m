
Xcode导航：
CM + shift + O :头文件快速搜索
CM + shift + J :展开该文件所在的项目目录，同时在文件导航区选中该文件
CM  + J : XCode从聚焦文件导航区状态，变回聚焦源文件编辑区状态，源文件进入编辑状态
CM + ctr + UP 在头文件和.m文件之间切换

CM + 0 : 隐藏和显示左侧导航栏
CM + 1~9： 左侧导航栏的tab切换
CM + shift + Y : 显示和隐藏下方调试栏
CM + option + 0: 显示和隐藏右侧功能区

ctr + 6 :在指定的文件中查找下拉列表的方法
cm + ctrl + j: 跳转到对应文件的定义； 
cm + ctrl + left : 后退 back
cm + ctrl + right : 前进 forward
cm + alt +[/] : 代码上移或者下移
/**********************************************/
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

IOS另外一款模拟器：REVEAL 
https://revealapp.com/

设置颜色十六进制的代码：
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0] // 宏定义16进制代码转rgb模式
self.loginbutton.backgroundColor = UIColorFromHex(0xC0FF3E);//用颜色的16进制设置颜色


/**********************************************/
question:
1.一个UIview中添加两种或以上的手势，同时作用，比如旋转和缩放？---有一个协议代理的方法,但实际操作怎么只能同时使用两种方法？
2.一个UIview在手指移动的时候，进行拖动，在手指放开的时候，恢复到原来位置？----设置中心为self.view的中心
3.设置指示器的时候，设置的坐标和UIview中的坐标还是有所差异？ ---cgcontext的坐标使用的是CoreGraphics
4.一个方法中使用的另外一个方法中的变量时候，需要提前声明？



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
//////////////////////////////////////////////////////

@property (nonatomic, strong) Dog *dog;  // 适用于OC对象类型, 相当于原来的retain;
@property (nonatomic, weak) Person *person; // 适用于OC对象类型, 相当于原来的assign;
@property (nonatomic, assign) double percent; // 适用于非OC对象类型, 在ARC中还是可以用
@property (nonatomic, copy) NSString *name; // release旧值，copy新值（一般用于NSString *）
/***********************************************************************/UIButton

 1> UIButton  -> UIControl -> UIView
 

 // 设置button的中心点为view的中心点
btn.center = self.view.center;


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



- (void)buttonPressed:(UIButton *)bt // button target绑定的方法；
{
    
    NSLog(@"%s", __func__);
    // 监听方法的对象
    NSLog(@"%lu", (unsigned long)bt.allControlEvents);
    // UIControlEventTouchUpInside事件的监听方法
    NSLog(@"%@", [bt actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]);
}
/***********************************************************************/UILabel

 2> UILabel     -> UIView

 链接url:   https://www.jianshu.com/p/d4c71fbd440e


//自动计算label的高度，自动换行

NSString * str = @"阿什顿客服哈是客户的空间哈伦裤的是否考虑啥可来得及发货时看见啊奥斯卡交电话费看见啦释放及时奥斯卡恢复卡是否啊开始地方可拉伸阿什顿客服哈是客户的空间哈伦裤的是否考虑啥可来得及发货时看见啊奥斯卡交电话费看见啦释放及时奥斯卡恢复卡是否啊开始地方可拉伸";

/*
计算显示当前字符串需要多大的空间(宽和高)
参数1:限制显示当前字符串的最大宽度和最大高度
参数2:渲染模式
参数3:字符串的属性（设置文字颜色和字体）
NSFontAttributeName:设置字体的键
NSForegroundColorAttributeName:设置文字颜色的键
参数4:上下文
*/

CGRect rect = [str boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:[UIColor redColor]} context:nil];

UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, rect.size.width, rect.size.height)];
label.text = str;
label.numberOfLines = 0; //自动换行
label.lineBreakMode = NSLineBreakByWordWrapping;
label.font = [UIFont systemFontOfSize:17];



//ios动态获取UILabel的高度和宽度
http://www.cnblogs.com/spiritstudio/archive/2011/11/17/2252074.html

在使用UILabel存放字符串时，经常需要获取label的长宽数据，本文列出了部分常用的计算方法。

1.获取宽度，获取字符串不折行单行显示时所需要的长度 
CGSize titleSize = [aString sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
注：如果想得到宽度的话，size的width应该设为MAXFLOAT。

2.获取高度，获取字符串在指定的size内(宽度超过label的宽度则换行)所需的实际高度.

CGSize titleSize = [aString sizeWithFont:font constrainedToSize:CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
注：如果想得到高度的话，size的height应该设为MAXFLOAT。

3.实际编程时，有时需要计算一段文字最后一个字符的位置，并在其后添加图片或其他控件（如info图标），下面代码为计算label中最后一个字符后面一位的位置的方法。

CGSize sz = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, 40)];
CGSize linesSz = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
if(sz.width <= linesSz.width) //判断是否折行
{
        lastPoint = CGPointMake(label.frame.origin.x + sz.width, label.frame.origin.y);  
}
else  
{  
        lastPoint = CGPointMake(label.frame.origin.x + (int)sz.width % (int)linesSz.width,linesSz.height - sz.height);  
}



//调整行间距
UILabel *yearVipLabel = [[UILabel alloc]initWithFrame:CGRectMake(intevar, CGRectGetMaxY(yearVipTitle.frame) + intevar, self.view.width - intevar * 2, 200)];

 yearVipLabel.numberOfLines = 0;

 NSString *descStr = _buyYearInfoModel.desc;
 NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:descStr];
 NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
 [paragraphStyle setLineSpacing:15];//调整行间距
 [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [descStr length])];
 yearVipLabel.attributedText = attributedString;

/***********************************************************************/UIImageView
 3> UIImageView -> UIView

/***********************************************************************/UITextField
 4> UITextField -> UIControl
 
 *** 代理设计模式，在OC中，使用最为广泛的一种设计模式
 
 1> 代理的用处是什么？
 *  监听那些不能通过addTarget监听的事件！
 *  主要用来负责在两个对象之间，发生某些事件时，来传递消息或者数据
 
 2> 代理的实现步骤
 (1)    成为(子)控件的代理，父亲（控制器）成为儿子（文本框）的代理
 (2)    遵守协议->利用智能提示，快速编写代码
 (3)    实现协议方法



------------------------------ <UITextFieldDelegate>
// 文本框的的事件代理 <UITextFieldDelegate>

/* 用户每次输入文字的时候通知视图控制器具体的输入内容 */
** 限制文本框的输入长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@ %@", NSStringFromRange(range), string);
    
    // 限制输入的长度
    unsigned long loc = range.location;
    return (loc < 6);
    
//    if (loc < 6) {
//        return YES;
//    } else {
//        return NO;
//    }
    
    // 如果返回NO，就不向文本框中添加字符
//    return YES;
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


/** 用户在文本框中按回车键时通知代理: */
*** 键盘焦点的切换
*** 关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     if (textField == userText) {
        [pwdText becomeFirstResponder];
    }else if (textField == pwdText){
        [self myaction:_loginbutton]; // 调用登录按钮
    }
    return YES; // return true;
}

// [self.view endEditing:YES];// 关闭键盘的强制响应，一般用在不知道焦点在谁的时候
[textField resignFirstResponder];// 取消当前键盘输入响应，即：输入完毕，收起键盘；


textfield.borderStyle = UITextBorderStyleRoundedRect; // 设置输入框为圆角矩形
/*
1.注意，设置button背景图像与边框样式UITextBorderStyleRoundedRect不能重叠使用
2.textFiled.background = [UIImage imageNamed:@"img_01"];
*/




/***********************************************************************/UIAlertView

------------------------------<UIAlertViewDelegate>
#pragma mark - 提示框代理方法

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        NSLog(@"用户登录");
    } else {
        NSLog(@"取消登录");
    }
}


/***********************************************************************/UIScrollView
------------------------------<UIScrollViewDelegate>






//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////


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
a、一种是通过 UIImage 来加载：

    UIImage *image = [UIImage imageNamed:@"picture"];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:image];


b、一种是通过initWithFrame来加载，然后手工修改UIImageView的属性    
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
链接url:   https://www.jianshu.com/p/d4c71fbd440e



/************************************************************/



安装cocoapods:
http://blog.csdn.net/zhang5690800/article/details/51891879
使用cocoapods：
http://www.cocoachina.com/ios/20180110/21815.html

1.1.1
/*
错误：
error: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool: can't locate file for: -lPods-SuperStoreFW
error: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool: file: -lPods-SuperStoreFW is not an object file (not allowed in a library)
原因：
依赖除了问题，参考链接：https://www.jianshu.com/p/8c34e45a0499
*/


/************************************************************/
绘图：
Quartz2d绘制图形，图标，
drwaRect 重绘
Core Graphics核心矩阵操作




@implementation UIView (ScreenShot)

-(UIImage *)imageScreenShot{
    UIGraphicsBeginImageContext(self.frame.size); // 开始绘制
    [self.layer renderInContext:UIGraphicsGetCurrentContext()]; // 绘制当前
    UIImage *shotImage = UIGraphicsGetImageFromCurrentImageContext(); // 获取当前
    UIGraphicsEndImageContext(); // 结束绘制
    return shotImage;
}
@end

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [self.view imageScreenShot];
    
    // 保存到本地相册, 这儿需要在infolist中添加一个权限；Privacy - Photo Library Usage Description
    // Privacy - Photo Library Additions Usage Description
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}



/************************************************************/


图形的上下文栈：

1.栈 ：局部变量，全局变量，先进后出   // 系统自动回收，由操作系统分配和释放，先进后出
2.堆 ：对象，先进先出            // 动态分配，手动回收,由程序员手动分配和释放，先进先出

// 用栈保存段落，作用范围在入和出之间
CGContextSaveGState(context); // 入栈
[COLOR2 setStroke];
CGContextSetLineWidth(context, 1.0);
[self drawXY:context];
CGContextRestoreGState(context); // 出栈
     

1.创建一个UIview，就会自动创建一个drawRect方法；
2.drawRect是重绘UIView
3.什么时候调用此方法？
a,init的时候不调用，
b,设置当前frame的时候调用
c,调用setNeedDisplay的时候调用

另外：
调用subview的时候，
滚动一个storeview的时候，
另外旋转UIScreen的时候是否调用此方法？


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawMyPie];
}


/************************************************************/

[COLOR1 setStroke];//边色
[COLOR2 setFill];//填充色

CGContextStrokePath(context);//边色渲染
CGContextFillPath(context);//填充渲染

CGContextDrawPath(context, kCGPathStroke); //描边
CGContextDrawPath(context, kCGPathFill); //填充
CGContextDrawPath(context, kCGPathFillStroke);//描边和填充

CGcontextMovetoPoint  //直接绘制
CGPathMovetoPoint //绘制路径然后添加
CGContextAddPath(context,pathref)

CGContextAddCurveToPoint// 绘制曲线

CGContextSetLineWidth

CGContextSetLineCap：设置线条的头尾样式
CGContextSetLineJoin：设置连接点样式 

CGpath:
-------------
CGMutablePathRef pathref = CGPathCreateMutable(); // 创建path()
CGPathMoveToPoint(pathref, nil, 200, 200); // 起点
CGPathAddLineToPoint(pathref, nil, 300, 300);
CGPathAddLineToPoint(pathref, nil, 100, 300);
CGPathAddLineToPoint(pathref, nil, 200, 200); // 还需要把终点和起点进行重合

CGContextSetLineJoin(context, kCGLineJoinRound); // 设置转角为圆形,连接样式
CGContextAddPath(context, pathref);
CGContextDrawPath(context, kCGPathFillStroke);


 point: CGContextMoveToPoint, CGContextAddLineToPoint
 line: CGContextAddLineToPoint, CGContextAddLines
 arc: CGContextAddArc, CGContextAddArcToPoint
 curve: CGContextAddCurveToPoint
 ellipse: CGContextAddEllipseInRect
 rectangle: CGContextAddRect, CGContextAddRects //current point does not change!!
 
 path:
 CGPathCreateMutable 类似于 CGContextBeginPath
 CGPathMoveToPoint 类似于 CGContextMoveToPoint
 CGPathAddLineToPoint 类似于 CGContextAddLineToPoint
 CGPathAddCurveToPoint 类似于 CGContextAddCurveToPoint
 CGPathAddEllipseInRect 类似于 CGContextAddEllipseInRect
 CGPathAddArc 类似于 CGContextAddArc
 CGPathAddRect 类似于 CGContextAddRect
 CGPathCloseSubpath 类似于 CGContextClosePath
 CGPathRef
 CGMutablePathRef
 
 CGContextAddPath
/************************************************************/


//stock加载数据：
- (NSMutableArray *)loadStockData{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *stockListStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:[stockListStr componentsSeparatedByString:@"\n"]];
    return array;
}

CGFloat h = fabsf(beginPrice-endPrice);// 绝对值

/************************************************************/
- (void)drawRect:(CGRect)rect {
    if (self.path) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, self.path);
        CGContextSetLineWidth(context, 4.0);
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    self.path = CGPathCreateMutable();
    CGPathMoveToPoint(self.path, NULL, pt.x, pt.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    CGPathAddLineToPoint(self.path, NULL, pt.x, pt.y);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPathRelease(self.path);
    self.path = nil;
}
/************************************************************/

self.nodeViews = [NSMutableArray array]; //初始化一个空数组？
self.throughNodeViews = [NSMutableArray array];
CGRectContainsPoint(rect, pt)// 点是否在矩形中


//UIAlterController:
UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:success?@"解锁成功":@"解锁失败" preferredStyle:UIAlertControllerStyleAlert];
UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [bview reset];
}
[alert addAction:action];// alert添加action
[self presentViewController:alert animated:YES completion:nil];  //展示controller


https://www.jianshu.com/p/c69f34e436e7
我们可以使用宏来解决调用NSLog方法可能导致的安全问题，只在调试版本中调用NSLog。可以采用全局可访问的头文件，把所有日志记录都灌进去，而且不用担心它们会出现在成品代码当中。
#ifdef DEBUG#define DMLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])#else#define DMLog(...) do { } while (0)

DMLog的名字可以随便取




