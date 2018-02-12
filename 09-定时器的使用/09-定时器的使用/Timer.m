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
     // 参数1：时间间隔，参数2：响应方法对象，参数3：响应方法，参数4：传递参数，参数5：是否重复；
     timer1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timelog:) userInfo:dic repeats:false];
     
     //定时器添加进runloop线程，并进行run;
     [[NSRunLoop currentRunLoop]addTimer:timer1 forMode:NSDefaultRunLoopMode];
     [[NSRunLoop currentRunLoop]run];
     */

    
    // 带参数的定时器:(另外一种fire方法),非runloop方法;
    timer2 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timelog:) userInfo:@"hello!" repeats:false];
    [timer2 fire];
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
