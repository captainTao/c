//
//  ViewController.m
//  testcocoapd
//
//  Created by captain on 2018/3/6.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *treeYellow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
