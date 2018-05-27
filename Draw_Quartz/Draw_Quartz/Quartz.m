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
    [self drawMyArc];
}

// 绘制直线     一个context
// 颜色，线条的粗细，线条的两端的形状
- (void)drawMyLine{
    // 1绘制画板   2画，属性   3渲染
    CGContextRef context = UIGraphicsGetCurrentContext();  // 画板 ,注意context前面没有*
    [COLOR2 setStroke]; // 颜色
    CGContextSetLineWidth(context, 6.0); // 设置线条宽度
   
    CGContextMoveToPoint(context, 100, 100); //绘制一个点
    CGContextAddLineToPoint(context, 300, 300); // 绘制另外一个点
    
    CGContextSetLineCap(context, kCGLineCapRound); // 设置线条两端的形状，第二个参数为枚举类型
    CGContextStrokePath(context); // 渲染
}

// 绘制矩形     一个context
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
    CGContextSetLineWidth(context, 3.0);
    
    CGContextMoveToPoint(context, 200, 300); // 设置圆心，不设置只会展示一部分
    // 圆心(200,200), 半径150， 开始角度0， 结束角度2pi, 顺时针1, 逆时针0
//    CGContextAddArc(context, 200, 300, 150, 0, M_PI*2*0.25, 0);
    CGContextAddArc(context, 200, 300, 150, M_PI*2*0.3, M_PI, 1); // 还是不懂为啥会画成那样？？。。x轴为横轴向右，y为纵轴向下， so顺指针变成了感觉数学中的逆时针
    CGContextClosePath(context); // 闭合路径的另外一种方法
//    CGContextDrawPath(context, kCGPathFill); // 只是填充
    CGContextDrawPath(context, kCGPathFillStroke); // 填充和圆弧的边
//    CGContextStrokePath(context); // 描边
}

// 图形的属性:
// 颜色，线条的粗细，线条的两端，转折处，虚线
- (void)drawMyProperty1{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 5.0);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 300, 400);
    
    CGContextSetLineCap(context, kCGLineCapRound); // 第二个参数为枚举类型,设置线条的两端
    CGContextStrokePath(context);
}

// 绘制三角形  设置转折处
- (void)drawMyProperty2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 10.0);
    
    CGMutablePathRef pathref = CGPathCreateMutable(); // 创建path()
    CGPathMoveToPoint(pathref, nil, 200, 200); // 起点
    CGPathAddLineToPoint(pathref, nil, 300, 300);
    CGPathAddLineToPoint(pathref, nil, 100, 300);
    CGPathAddLineToPoint(pathref, nil, 200, 200); // 还需要把终点和起点进行重合
    
    CGContextSetLineJoin(context, kCGLineJoinRound); // 设置转角位圆形
    CGContextAddPath(context, pathref);
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 设置虚线
- (void)drawMyProperty3{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 10.0);
    
    CGFloat lengths[] = {10,50,10};  // 指定虚线的length
    CGContextSetLineDash(context, 30, lengths, 3); // 参数2：偏移量，参数3：长度，参数4：length的长度

    CGContextMoveToPoint(context, 100, 0);
    CGContextAddLineToPoint(context, 100, 300);
//    CGContextDrawPath(context, kCGPathFillStroke); // 渲染效果与下面保持一致
    CGContextStrokePath(context);
}

// 绘制条形码， 实质是用虚线来绘制
- (void)drawMyProperty4{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 200.0);
    
    CGFloat lengths[] = {3,2,4,8,6,4,2,1,7};  // 指定虚线的length
    CGContextSetLineDash(context, 0, lengths, 9); // 参数2：偏移量，参数3：长度，参数4：length的长度
    
    CGContextMoveToPoint(context, 200, 100);
    CGContextAddLineToPoint(context, 200, 600);
    //    CGContextDrawPath(context, kCGPathFillStroke); // 渲染效果与下面保持一致
    CGContextStrokePath(context);
}
@end
