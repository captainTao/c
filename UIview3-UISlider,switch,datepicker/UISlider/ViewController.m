//
//  ViewController.m
//  UISlider
//
//  Created by captain on 2018/3/25.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test4];
}

#pragma mark --UIDatePikcer

-(void)test4{
    // UIDatePikcer,日期选择器的使用：
    UIDatePicker *datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(20, 300, 300, 100)];
    datepicker.datePickerMode = UIDatePickerModeDateAndTime;// 选择日期和时间模式
    [datepicker addTarget:self action:@selector(ActionPicker:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datepicker];
}

-(void)ActionPicker:(UIDatePicker *)pikcer{
    NSLog(@"%@",[pikcer date]); // 获取日期和时间
    
    NSDateFormatter *formatt = [[NSDateFormatter alloc]init];
    formatt.dateFormat = @"yyyy--MM....dd HH**mm//ss"; //设置格式
    NSString *str = [formatt stringFromDate:[pikcer date]]; //应用格式
    NSLog(@"%@", str);
}

#pragma mark --UISwitch

-(void)test3{
    // UISwitch的用法：这儿不能取名字为switch,名字被占用：
    UISwitch *mswitch = [[UISwitch alloc]initWithFrame:CGRectMake(20, 200, 50, 30)];
    [mswitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mswitch];
}

-(void)switchAction:(UISwitch *)sender{
    NSLog(@"%d",[sender isOn]);// 判断开关是否打开，打开为1,关闭为0
}

#pragma mark --UISlider

// 自定义slider
- (void)test2{
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, 200, 100)];
    slider.maximumValue = 100.0;
    slider.minimumValue = 0;
    slider.value = 70.0;
    slider.continuous = true; // 表明滑动连续
    [slider addTarget:self action:@selector(ActionSlider:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *imageleft = [UIImage imageNamed:@"1.png"];
    UIImage *imageright = [UIImage imageNamed:@"2.png"];
    UIImage *imagecenter = [UIImage imageNamed:@"3.png"];
    
    // 下面方法设置图片如何拉伸，参数10，0，代表x方向对称10个像素，y方向0个像素不动，其余拉伸
    UIImage *imagelefttrack = [imageleft stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    UIImage *imagerighttrack = [imageright stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    
    // 设置左边，右边，中间的图片，记住方法是trackimage;
    [slider setMinimumTrackImage:imagelefttrack forState:UIControlStateNormal];
    [slider setMaximumTrackImage:imagerighttrack forState:UIControlStateNormal];
    [slider setThumbImage:imagecenter forState:UIControlStateNormal];
    [self.view addSubview:slider];
}


- (void)test1{
    // 系统自带slider
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, 200, 100)];
    slider.maximumValue = 100.0;
    slider.minimumValue = 0;
    slider.value = 70.0;
    slider.continuous = true; // 表明滑动连续
    [slider addTarget:self action:@selector(ActionSlider:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:slider];
}

- (void)ActionSlider:(UISlider *)slider{
    NSLog(@"%f", slider.value);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
