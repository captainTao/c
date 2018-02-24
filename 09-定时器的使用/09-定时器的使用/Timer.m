//
//  Timer.m
//  09-定时器的使用
//
//  Created by captain on 2018/2/12.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Timer.h"

@interface Timer() //扩展一个无名称的分类,或者直接在主类中声明变量;
{
    NSTimer *timer1;
    NSTimer *timer2;
}
@end

@implementation Timer

-(void)testTimer
{
    /*
     NSDictionary *dic = @{@"key" : @"release"};
     //1. 参数1：时间间隔，参数2：响应方法对象，参数3：响应方法，参数4：传递参数，参数5：是否重复；
     timer1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timelog:) userInfo:dic repeats:false];
     
     //定时器添加进runloop线程，并进行run;
     [[NSRunLoop currentRunLoop]addTimer:timer1 forMode:NSDefaultRunLoopMode];
     [[NSRunLoop currentRunLoop]run];
     */

    
    //2. 带参数的定时器:(另外一种fire方法),非runloop方法; //带冒号是执行带参数的方法
    timer2 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timelog:) userInfo:@"hello!" repeats:false];
    [timer2 fire];

    /*
     //3. 时间精度：上面的timerInterval时间精度并不准确，只是大概粗略的来计算时间间隔；
     timer1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timelog) userInfo:nil repeats:true];
     [[NSRunLoop currentRunLoop]addTimer:timer1 forMode:NSDefaultRunLoopMode];
     [[NSRunLoop currentRunLoop]run];
     */
    
    /*
     //4. 快速打印当前代码执行的时间
     NSDate *timemark = [NSDate date]; // 当前时间
     for(int i = 0; i<1000; i++){
        printf(".");
     }
     NSTimeInterval interval = [timemark timeIntervalSinceNow];//timemark到现在的时间差
     float exctime = 0 - interval;
     NSLog(@"timenow = %f", exctime);
    */
}

-(void)timelog //不带参数的selector
{
    NSLog(@"我是一个timer, 正在执行");
}

-(void)timelog:(NSTimer *)timer
{
    NSLog(@"我是一个timer,执行的内容为：%@", timer.userInfo);
}
@end
