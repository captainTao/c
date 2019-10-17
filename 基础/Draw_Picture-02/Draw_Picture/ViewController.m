//
//  ViewController.m
//  Draw_Picture
//
//  Created by captain on 2018/5/29.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
#import "Quartz.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Quartz *quartzPicture = [[Quartz alloc]initWithFrame:self.view.bounds];
//    quartzPicture.backgroundColor = [UIColor clearColor]; // 清除背景颜色
    [self.view addSubview:quartzPicture];
    [quartzPicture setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
