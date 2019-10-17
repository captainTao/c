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
#import "FuncitonViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBlockView *blockView = [[UIBlockView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:blockView];
    
    blockView.unblockViewBlock = ^(UIBlockView *bview, BOOL success) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:success?@"解锁成功":@"解锁失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [bview reset];
            if (success) {
                //跳转到新的Controller
                FuncitonViewController *function = [[FuncitonViewController alloc]init];
                [self presentViewController:function animated:YES completion:nil];
            }
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
