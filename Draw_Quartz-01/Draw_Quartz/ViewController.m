//
//  ViewController.m
//  Draw_Quartz
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
#import "Quartz.h"
@interface ViewController (){
    //  Quartz *quaratz2d;   // 在这儿声明，后面初始化就直接用quartz2d = alloc..init
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Quartz *quartz2d = [[Quartz alloc]initWithFrame:self.view.bounds]; // 初始化view, 也可以直接在声明中初始化一个变量
    [self.view addSubview:quartz2d]; // 添加view
    [quartz2d setNeedsDisplay]; // 手动调用方法
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
