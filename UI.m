
https://www.jianshu.com/p/4be17ec40cfc
delegate、protocol、tagart-action、closure ？


Github  StackOverFlow


模拟器操作：

cmd +l :锁屏
cmd +shift +h :主界面
cmd +1, cmd +2, cmd +3, 4, 5; 调整模拟器大小；

编译：cmd+b
编译+运行：cmd+r
大小： cmd+1~7,一般用cmd+3

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


- (void)viewDidLoad {
    [super viewDidLoad];

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
     
     // 图片轮播效果
     UIImage *img1 = [UIImage imageNamed:@"img1.jpg"];
     UIImage *img2 = [UIImage imageNamed:@"img2.jpg"];
     UIImage *img3 = [UIImage imageNamed:@"img3.jpg"];
     UIImageView *imageview = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
     imageview.animationImages = [NSArray arrayWithObjects:img1,img2,img3, nil];
     imageview.animationDuration = 5;
     [imageview startAnimating];
     [self.view addSubview:imageview];
     //    [imageview release];
     
     // 添加一个色块：
     UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 200, 50)];
     viewcolor.backgroundColor = [UIColor purpleColor];
     // 把这个view添加到视图：
     [self.view addSubview:viewcolor];
     
}

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


7.轮播效果：
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img1 = [UIImage imageNamed:@"img1.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"img2.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"img3.jpg"];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    imageview.animationImages = [NSArray arrayWithObjects:img1,img2,img3, nil];
    imageview.animationDuration = 5;
    [imageview startAnimating];
    [self.view addSubview:imageview];
//    [imageview release];
}

8.添加一个色块：

     // 添加一个色块：
     UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 200, 50)];
     viewcolor.backgroundColor = [UIColor purpleColor];
     // 把这个view添加到视图：
     [self.view addSubview:viewcolor];

     