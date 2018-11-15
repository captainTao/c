//
//  ViewController.m
//  Draw_LockScreen-07
//
//  Created by captain on 2018/11/12.
//  Copyright © 2018年 captain. All rights reserved.
//
/*
 1.手势的各个点编号1-9；
 2.手指进入到手势点钟，点亮该手势点的图标
 3.手势点不能重复，不会出现手势点闭合的状态
 */

#import "ViewController.h"
#import "UIBlockView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBlockView *blockView = [[UIBlockView alloc]initWithFrame:self.view.frame];
    blockView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:blockView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
