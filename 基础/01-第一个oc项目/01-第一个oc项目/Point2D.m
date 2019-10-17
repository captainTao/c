//
//  Point2D.m
//  01-第一个oc项目
//
//  Created by captain on 2018/1/24.
//  Copyright © 2018年 captain. All rights reserved.
//

/*
 5.设计一个类Point2D，用来表示二维平面中某个点
 1> 属性
 * double _x
 * double _y
 
 2> 方法
 * 属性相应的set和get方法
 * 设计一个对象方法同时设置x和y
 * 设计一个对象方法计算跟其他点的距离
 * 设计一个类方法计算两个点之间的距离
 
 3> 提示
 * C语言的math.h中有个函数：double pow(double n, double m); 计算n的m次方
 * C语言的math.h中有个函数：double sqrt(double n); 计算根号n的值（对n进行开根）
 */


#import "Point2D.h"
#import <math.h>

@implementation Point2D
// x值的getter和setter
- (void)setX:(double)x
{
    _x = x;
}
- (double)x
{
    return _x;
}

// y值的getter和setter
- (void)setY:(double)y
{
    _y = y;
}
- (double)y
{
    return _y;
}

// 同时设置x和y
- (void)setX:(double)x andY:(double)y
{
    /*
     _x = x;
     _y = y;
     */
    /*
     self->_x = x;
     self->_y = y;*/
    [self setX:x];
    [self setY:y];
}

// 计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other
{
    // ( (x1-x2)的平方 + (y1-y2)的平方 ) 开根
    // return [Point2D distanceBetweenPoint1:self andPoint2:other];
    
    // x1-x2
    double xDelta = [self x] - [other x];
    // (x1-x2)的平方
    double xDeltaPF = pow(xDelta, 2);
    
    // y1-y2
    double yDelta = [self y] - [other y];
    // (y1-y2)的平方
    double yDeltaPF = pow(yDelta, 2);
    
    // 返回距离
    return sqrt(xDeltaPF + yDeltaPF);
}

// 计算两个点之间的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2
{
    // 调用p2对象的对象方法计算p2和p1的距离
    return [p2 distanceWithOther:p1];
    
    // return [p1 distanceWithOther:p2];
    
    /*
     // x1-x2
     double xDelta = [p1 x] - [p2 x];
     // (x1-x2)的平方
     double xDeltaPF = pow(xDelta, 2);
     
     // y1-y2
     double yDelta = [p1 y] - [p2 y];
     // (y1-y2)的平方
     double yDeltaPF = pow(yDelta, 2);
     
     // 返回距离
     return sqrt(xDeltaPF + yDeltaPF);
     */
}
@end

