//
//  main.m
//  01-第一个oc项目
//
//  Created by captain on 2018/1/23.
//  Copyright © 2018年 captain. All rights reserved.
//

/*
 总结
 1.只有利用类名调用类方法的时候，不需要在类名后面写*。其他情况下，类名后面统一加上一个*
 Circle *c1 = [Circle new];
 - (BOOL)isInteractWithOther:(Circle *)other;
 
 2.返回值是BOOL类型的方法，方法名一般都以is开头
 - (BOOL)isInteractWithOther:(Circle *)other;
 
 3.想要拥有某个对象，就先创建对象，然后调用set方法将对象传递给内部的成员变量
 // 创建圆心对象
 Point2D *p2 = [Point2D new];
 [p2 setX:12 andY:19];
 // 设置圆心
 [c2 setPoint:p2];
 
 - (void)setPoint:(Point2D *)point
 {
 _point = point;
 }
 
 
 4.定义一个类分2个文件：.h声明文件、.m实现文件
 .h : 成员变量、方法的声明
 .m : 方法的实现
 
 5.如果想使用某一个类，只需要#import类的.h文件即可
 */


#import "Point2D.h"
#import "Circle.h"


int main()
{
    // 圆对象
    Circle *c1 = [Circle new];
    // 设置半径
    [c1 setRadius:1];
    // 创建圆心对象
    Point2D *p1 = [Point2D new];
    [p1 setX:10 andY:15];
    // 先设置圆心
    [c1 setPoint:p1];
    [[c1 point] setX:15];
    
    // c1 半径：1  圆心：（15， 15）
    
    // 圆对象
    Circle *c2 = [Circle new];
    // 设置圆的半径
    [c2 setRadius:2];
    
    // 创建圆心对象
    Point2D *p2 = [Point2D new];
    [p2 setX:12 andY:19];
    // 设置圆心
    [c2 setPoint:p2];
    
    // c2 半径：2 圆心：（12， 19）
    
    // 圆心距离：5 > 半径和：3
    //BOOL b1 = [c1 isInteractWithOther:c2];
    
    BOOL b1 = [Circle isInteractBetweenCircle1:c1 andCircle2:c2];
    NSLog(@"%d", b1);
    
    
    /*
     Point2D *p1 = [Point2D new];
     // (10, 15)
     [p1 setX:10 andY:15];
     
     Point2D *p2 = [Point2D new];
     // (13, 19)
     [p2 setX:13 andY:10];
     
     //double d1 = [p1 distanceWithOther:p2];
     double d1 = [Point2D distanceBetweenPoint1:p1 andPoint2:p2];
     NSLog(@"%f", d1);*/
    return 0;
}

