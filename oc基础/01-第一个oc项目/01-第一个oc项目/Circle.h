//
//  Circle.h
//  01-第一个oc项目
//
//  Created by captain on 2018/1/24.
//  Copyright © 2018年 captain. All rights reserved.
//
#import "Point2D.h"
#import <Foundation/Foundation.h>

// 圆
@interface Circle : NSObject
{
    // 半径
    double _radius;
    // 圆心
    //    double _x;
    //    double _y;
    Point2D *_point;
}

// 半径的getter和setter
- (void)setRadius:(double)radius;
- (double)radius;

// 圆心的getter和setter
- (void)setPoint:(Point2D *)point;
- (Point2D *)point;

// 判断跟其他圆是否重叠（重叠返回YES，否则返回NO）
// 返回值是BOOL类型的，方法名一般都以is开头
- (BOOL)isInteractWithOther:(Circle *)other;
// 判断两个圆是否重叠（重叠返回YES，否则返回NO）
+ (BOOL)isInteractBetweenCircle1:(Circle *)c1 andCircle2:(Circle *)c2;
@end

