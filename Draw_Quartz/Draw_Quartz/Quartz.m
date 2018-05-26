//
//  Quartz.m
//  Draw_Quartz
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Quartz.h"

@implementation Quartz

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//这个方法是每次必调，或者手动调用setNeedDisplay

- (void)drawRect:(CGRect)rect{
    [self drawMyProperty];
}

// 绘制直线
// 颜色，线条的粗细，线条的两端的形状
- (void)drawMyLine{
    // 1绘制画板   2画，属性   3渲染
    CGContextRef context = UIGraphicsGetCurrentContext();  // 画板 ,注意context前面没有*
    [COLOR2 setStroke]; // 颜色
    CGContextSetLineWidth(context, 6.0); // 设置线条宽度
    CGContextMoveToPoint(context, 100, 100); //绘制一个点
    CGContextAddLineToPoint(context, 300, 300); // 绘制另外一个点
    CGContextStrokePath(context); // 渲染
}

// 绘制矩形
- (void)drawMyRect{
    // 1绘制画板   2画，属性   3渲染
    CGContextRef context = UIGraphicsGetCurrentContext();  // 画板 ,注意context前面没有*
    [COLOR1 setFill]; // 设置颜色填充
    [COLOR2 setStroke]; // 颜色
    CGContextSetLineWidth(context, 10.0); // 设置线条宽度
    CGContextAddRect(context, CGRectMake(100, 100, 200, 150));
//    CGContextStrokePath(context); // 渲染, 这种渲染只能展示出边框
    CGContextDrawPath(context, kCGPathFillStroke); // 这种渲染能展示出边框和矩形内部填充色
}

// 绘制三角形  实质是一个path，绘制一个路径
- (void)drawMyTriangle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 10.0);
    CGMutablePathRef pathref = CGPathCreateMutable(); // 创建path()
    CGPathMoveToPoint(pathref, nil, 200, 200); // 起点
    CGPathAddLineToPoint(pathref, nil, 300, 300);
    CGPathAddLineToPoint(pathref, nil, 100, 300);
    CGPathAddLineToPoint(pathref, nil, 200, 200); // 还需要把终点和起点进行重合
    CGContextAddPath(context, pathref);
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 绘制一个波浪线   为一个context
- (void)drawMyCurve{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 10.0);
//    CGMutablePathRef pathref = CGPathCreateMutable(); // 创建path()
    CGContextMoveToPoint(context, 100, 200);  // 绘制的起始点
    CGContextAddCurveToPoint(context, 200, 100, 200, 300, 300, 200); // 这其中有三对x,y坐标，弧形是切线出来的效果
//    CGContextAddPath(context, pathref);
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 绘制弧形，圆形   为一个context
- (void)drawMyArc{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 5.0);
    // 圆心(200,200), 半径150， 开始角度0， 结束角度2pi, 顺时针1, 逆时针0
    CGContextAddArc(context, 200, 300, 150, M_PI*3/4, M_PI*2, 1);
    CGContextClosePath(context); // 闭合路径的另外一种方法
    CGContextDrawPath(context, kCGPathFillStroke);
//    CGContextStrokePath(context);
}

// 绘制图形的属性:
// 颜色，线条的粗细，线条的两端，转折处，虚线
- (void)drawMyProperty{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 5.0);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);
    
}
@end
