//
//  ViewController.m
//  Draw_progressBar
//
//  Created by captain on 2018/5/28.
//  Copyright © 2018年 captain. All rights reserved.
//

/*
 定时器和所有的UI线程都必须保证在主线程中；
 */

#import "ViewController.h"
#import "Quartz.h"
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0]

@interface ViewController (){
    
    Quartz *quartz2d;  // 如果以后其他地方要用，这个文件可以单独拎出来。。
    int i;
    UILabel *label;
    CGSize iphoneSize;
    CGFloat width;
    CGFloat height;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"self.view.bounds = %@", NSStringFromCGRect(self.view.bounds));
    NSLog(@"mainscreen.bounds = %@", NSStringFromCGRect([UIScreen mainScreen].bounds)); // 两个尺寸是一样的；
    
    iphoneSize = self.view.bounds.size;
    width = iphoneSize.width;
    height = iphoneSize.height;
    // iphoneSize = [UIScreen mainScreen].bounds.size; 或者这样获取
    // 设置指示条的背景
    /*
     UIView *viewbg = [[UIView alloc]initWithFrame:CGRectMake(20, 208, 375-40, 15)]; // 设置UIview和指示条的位置效果是不一样的；
     
     // 下面为指示的代码：
     CGContextSetLineWidth(context, 15.0);
     CGContextMoveToPoint(context, 20, 208);
     CGContextAddLineToPoint(context, 20+(self.percent/100.0)*(355-20), 208); //6s的宽度为375
     */
    
    UIView *viewbg = [[UIView alloc]initWithFrame:CGRectMake(13, 201, width-26, 14)]; // 尺寸还是有所差异？？？
    viewbg.backgroundColor = COLOR2;
    viewbg.layer.cornerRadius = 5.0;
    [self.view addSubview:viewbg];
    
    // 初始化quartz2d
    quartz2d = [[Quartz alloc]initWithFrame:self.view.bounds];
    quartz2d.backgroundColor = [UIColor clearColor]; // 把背景颜色清空，即把默认的黑色背景清空为白色；
    [self.view addSubview:quartz2d];
    
    // 设置定时器定时调用渲染
    i = 0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refresh) userInfo:nil repeats:true];
    [timer fire]; // 是否需要这一句？不写也能正常运行。
    //  设置UIlabel
    label = [[UILabel alloc]initWithFrame:CGRectMake(width-120, 170, 100, 20)];
    label.text = @"0.0%";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:label];
    
}
- (void)refresh{
    if (i<100) {
        i++;
    }else{
        i=100;
    }
    quartz2d.percent = i;
    [quartz2d setNeedsDisplay];
    label.text = [NSString stringWithFormat:@"%d%@",i, @"%"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
