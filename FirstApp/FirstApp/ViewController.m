//
//  ViewController.m
//  FirstApp
//
//  Created by captain on 2018/2/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*

     */
    
    self.blue.hidden = true;
    
    // UIlabel的相关属性：url：https://www.jianshu.com/p/d4c71fbd440e
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 70, 200, 100)];//位置
    label1.backgroundColor = [UIColor grayColor];//背景颜色
    label1.text  = @"这是label1的内容！";//内容
    [label1 setText:@"hello,world 你好,呵呵呵，哈哈哈，哼哼，唧唧，乐乐"];
    label1.textColor = [UIColor greenColor];//字体颜色
    [label1 setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];//设置rgb;
    label1.font = [UIFont systemFontOfSize:12.0];//字体大小
    label1.font = [UIFont fontWithName:@"Menlo" size:14.0];//字体
    label1.font = [UIFont boldSystemFontOfSize:13];//加粗
    label1.font = [UIFont italicSystemFontOfSize:13.0];//斜体
    [label1 setTextAlignment:NSTextAlignmentCenter];//对齐
    [label1 setNumberOfLines:3];//设置行数
    [label1 setLineBreakMode:NSLineBreakByWordWrapping]; //折行模式
    [self.view addSubview:label1];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)test1{
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
}


-(void)test{
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
    
    CGFloat x1 = viewcolor.frame.origin.x;
    CGFloat y1 = viewcolor.frame.origin.y;
    NSLog(@"x=%f,y=%f",x1,y1);//x=70.000000,y=100.000000
    NSLog(@"size=%@",NSStringFromCGSize(viewcolor.frame.size));//size={200, 50}
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
    //    [imageview release];
    
}
@end
