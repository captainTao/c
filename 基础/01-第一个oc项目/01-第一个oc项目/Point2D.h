//
//  Point2D.h
//  01-第一个oc项目
//
//  Created by captain on 2018/1/24.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

// 点
@interface Point2D : NSObject
{
    double _x; // x值
    double _y; // y值
}

// x值的getter和setter
- (void)setX:(double)x;
- (double)x;

// y值的getter和setter
- (void)setY:(double)y;
- (double)y;

// 同时设置x和y
- (void)setX:(double)x andY:(double)y;

// 计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other;
// 计算两个点之间的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2;
@end
