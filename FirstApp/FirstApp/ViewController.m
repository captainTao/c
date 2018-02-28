//
//  ViewController.m
//  FirstApp
//
//  Created by captain on 2018/2/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
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
     */

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
