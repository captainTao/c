
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
     
     // 添加一个色块：
     UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 200, 50)];
     //    UIView *viewcolor = [[UIView alloc]initWithFrame:CGRectMake(70, 100, 375-100-10, 50)];//375-100-10标识总的尺寸，然后左边留100，右边留10
     viewcolor.backgroundColor = [UIColor purpleColor];
     [self.view addSubview:viewcolor];
     
     CGFloat x = viewcolor.frame.origin.x;
     CGFloat y = viewcolor.frame.origin.y;
     NSLog(@"x=%f,y=%f",x,y);//x=70.000000,y=100.000000
     NSLog(@"size=%@",NSStringFromCGSize(viewcolor.frame.size));//size={200, 50}
     NSLog(@"bounds=%@",NSStringFromCGRect(viewcolor.bounds));//bounds={{0, 0}, {200, 50}}，相对于自己的宽高
     NSLog(@"bounds=%@",NSStringFromCGRect(self.view.bounds));//bounds={{0, 0}, {375, 667}}，这是屏幕的尺寸
     
     
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
     
    
}

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





     