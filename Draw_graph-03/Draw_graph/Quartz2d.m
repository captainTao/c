//
//  Quartz2d.m
//  Draw_graph
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//
/*
 CGContextSaveGState(context);
 .......
 CGContextRestoreGState(context);
 
 1.CGContextStrokePath(context) 实心绘制
 2.CGContextDrawPath(context, kCGPathStroke);空心绘制
 
 [COLOR1 setStroke];
 [COLOR2 setFill];
 
 */
#import "Quartz2d.h"

@implementation Quartz2d


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawMyRect];
}

// 绘制XY轴
- (void)drawXY:(CGContextRef)context{
    CGContextMoveToPoint(context, 20, 350); // 绘制x轴
    CGContextAddLineToPoint(context, 360, 350);
    CGContextAddLineToPoint(context, 350, 345);
    CGContextMoveToPoint(context, 360, 350);  // 挪动坐标到线段的最末端
    CGContextAddLineToPoint(context, 350, 355);
    
    CGContextMoveToPoint(context, 20, 350); // 绘制y轴
    CGContextAddLineToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 15, 30);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 25, 30);
    
    CGContextStrokePath(context);
}


// 折线图
- (void)drawMyLine{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 3.0);
    
    // 绘制折线图
    // 用栈保存段落，作用范围在入和出之间
    CGContextSaveGState(context); // 入栈
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    [self drawXY:context];
    CGContextRestoreGState(context); // 出栈
    
    // 绘制折线图
    CGContextMoveToPoint(context, 50, 260);
    CGContextAddLineToPoint(context, 100, 70);
    CGContextAddLineToPoint(context, 150, 300);
    CGContextAddLineToPoint(context, 200, 40);
    CGContextAddLineToPoint(context, 250, 80);
    CGContextAddLineToPoint(context, 300, 270);
    
    CGContextStrokePath(context);
    
}

// 柱状图的绘制：
/*
 1.绘制线条，然后把线条加粗---弊端：不能绘制空心的柱状图
 2.绘制矩形，矩形内部可以填充或者不填充，又或者选择不同的渲染方式
 */


// 柱状图的绘制：（实心）
- (void)drawMyBarChart{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 30.0);
    
    // 绘制XY
    CGContextSaveGState(context);
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    [self drawXY:context];
    CGContextRestoreGState(context);
    
    //绘制柱状
    CGContextMoveToPoint(context, 70, 320);
    CGContextAddLineToPoint(context, 70, 50);
    
    CGContextMoveToPoint(context, 140, 320);
    CGContextAddLineToPoint(context, 140, 50);
    
    CGContextMoveToPoint(context, 210, 320);
    CGContextAddLineToPoint(context, 210, 240);
    
    CGContextMoveToPoint(context, 280, 320);
    CGContextAddLineToPoint(context, 280, 170);
    
    CGContextMoveToPoint(context, 350, 320);
    CGContextAddLineToPoint(context, 350, 210);
    
    CGContextStrokePath(context);
    
}

// 柱状图的绘制：（空心）
- (void)drawMyBarHollow{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 3.0);
    
    // 绘制XY
    CGContextSaveGState(context);
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    [self drawXY:context];
    CGContextRestoreGState(context);
    
    //绘制柱状
    CGContextAddRect(context, CGRectMake(50, 250, 40, 70));
    CGContextAddRect(context, CGRectMake(100, 250, 40, 70));
    CGContextAddRect(context, CGRectMake(150, 80, 40, 240));
    CGContextAddRect(context, CGRectMake(200, 140, 40, 180));
    CGContextAddRect(context, CGRectMake(250, 40, 40, 280));
    
    CGContextDrawPath(context, kCGPathStroke);
    
}


// 饼状图的绘制：

- (void)drawMyPie{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 1.0);
    
    // 画圆
    CGContextAddArc(context, 200, 200, 150, 0, M_PI*2, 0);
    CGContextDrawPath(context, kCGPathStroke);
   
    // part 1
    CGContextSaveGState(context);
    [COLOR2 setFill];
    CGContextMoveToPoint(context, 200, 200); // 需要移动点到圆的中心，不然图形只有弧度的一部分；
    CGContextAddArc(context, 200, 200, 150, 0, M_PI*2*0.3, 0); //  顺时针1, 逆时针0；但实际效果画出来顺时针和逆时针方向是反的；因为原点在左上角，y轴方向向下
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);

    // part 2
    CGContextSaveGState(context);
    [COLOR3 setFill];
    CGContextMoveToPoint(context, 200, 200); // 需要移动点到圆的中心，不然图形只有弧度的一部分；
    CGContextAddArc(context, 200, 200, 150, M_PI*2*0.3, M_PI*2*0.7, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // part 3
    CGContextSaveGState(context);
    [COLOR4 setFill];
    CGContextMoveToPoint(context, 200, 200); // 需要移动点到圆的中心，不然图形只有弧度的一部分；
    CGContextAddArc(context, 200, 200, 150, M_PI*2*0.7, M_PI*2*0.95, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // part 4
    CGContextSaveGState(context);
    [COLOR5 setFill];
    CGContextMoveToPoint(context, 200, 200); // 需要移动点到圆的中心，不然图形只有弧度的一部分；
    CGContextAddArc(context, 200, 200, 150, M_PI*2*0.95, M_PI*2, 0);
//    CGContextDrawPath(context, kCGPathFill);
    CGContextFillPath(context); //也可以这样填充
    CGContextRestoreGState(context);
    
    // 划线
    CGContextSaveGState(context);
    [COLOR6 setStroke];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 220, 320);
    CGContextAddLineToPoint(context, 260, 380);
    CGContextAddLineToPoint(context, 300, 380);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    // 文字渲染 UIlabel
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(300, 367, 50, 20)];
    lab.text = @"31.7%";
    lab.textColor = COLOR6;
    [self addSubview:lab];
}

// 绘制矩形：
- (void)drawMyRect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setStroke];//边色
    [COLOR2 setFill];//填充色
    CGContextSetLineWidth(context, 1.0);
    CGContextAddRect(context, CGRectMake(100, 100, 200, 160));//绘制矩形
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置为圆角
//    CGContextStrokePath(context);//边色渲染
//    CGContextFillPath(context);//填充渲染
    CGContextDrawPath(context, kCGPathFill);

}
@end
