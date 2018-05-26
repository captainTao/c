//
//  ViewController.m
//  Draw_graph
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
#import "Quartz2d.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Quartz2d *quartz2d =[[Quartz2d alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:quartz2d];
    [quartz2d setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
