//
//  Quartz2d.m
//  Draw_graph
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Quartz2d.h"

@implementation Quartz2d


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawMyLine];
}


- (void)drawMyLine{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 10.0);
    
    //用栈保存段落，作用范围在入和出之间
    CGContextSaveGState(context); // 入栈
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    CGContextRestoreGState(context); // 出栈
}

- (void)drawXY:(CGContextRef)context{
    CGContextMoveToPoint(context, 50, 350); // 绘制x轴
    CGContextAddLineToPoint(context, 410, 350);
    CGContextAddLineToPoint(context, 400, 345);
    CGContextMoveToPoint(context, 410, 350);
    CGContextAddLineToPoint(context, 400, 355);
    
    CGContextMoveToPoint(context, 50, 350); // 绘制y轴
    CGContextAddLineToPoint(context, 50, 20);
    CGContextAddLineToPoint(context, 45, 30);
    CGContextMoveToPoint(context, 50, 20);
    CGContextAddLineToPoint(context, 55, 30);
    
    CGContextStrokePath(context);
}
@end
