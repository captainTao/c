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
1.绘制：线条，矩形，三角形，圆，椭圆，扇形，曲线
2.用点或者路径来绘制
3.填充的颜色为单色或者渐变色
？1.绘制三角形的边没有合拢

 CGContextSetLineWidth
 CGContextSetLineJoin
 CGContextSetLineDash, CGFloat lengths
 CAGradientLayer
 
 CGContextStrokePath(context);//边色渲染
 CGContextFillPath(context);//填充渲染
 
 CGContextDrawPath(context, kCGPathStroke); //描边
 CGContextDrawPath(context, kCGPathFill); //填充
 CGContextDrawPath(context, kCGPathFillStroke);//描边和填充
 
 point: CGContextMoveToPoint, CGContextAddLineToPoint
 line: CGContextAddLineToPoint, CGContextAddLines
 arc: CGContextAddArc, CGContextAddArcToPoint
 curve: CGContextAddCurveToPoint
 ellipse: CGContextAddEllipseInRect
 rectangle: CGContextAddRect, CGContextAddRects //current point does not change!!
 
 path:
 CGPathCreateMutable 类似于 CGContextBeginPath
 CGPathMoveToPoint 类似于 CGContextMoveToPoint
 CGPathAddLineToPoint 类似于 CGContextAddLineToPoint
 CGPathAddCurveToPoint 类似于 CGContextAddCurveToPoint
 CGPathAddEllipseInRect 类似于 CGContextAddEllipseInRect
 CGPathAddArc 类似于 CGContextAddArc
 CGPathAddRect 类似于 CGContextAddRect
 CGPathCloseSubpath 类似于 CGContextClosePath
 CGPathRef
 CGMutablePathRef
 
 CGContextAddPath
*/


//这个方法是每次必调，或者手动调用setNeedDisplay

- (void)drawRect:(CGRect)rect{
    [self drawMyDesign2];
}

// 绘制直线     一个context
// 颜色，线条的粗细，线条的两端的形状
- (void)drawMyLine1{
    // 1绘制画板   2画，属性   3渲染
    CGContextRef context = UIGraphicsGetCurrentContext();  // 画板 ,注意context前面没有*
    [COLOR2 setStroke]; // 颜色
    CGContextSetLineWidth(context, 6.0); // 设置线条宽度
   
    CGContextMoveToPoint(context, 100, 100); //绘制一个点
    CGContextAddLineToPoint(context, 300, 300); // 绘制另外一个点
    
    CGContextSetLineCap(context, kCGLineCapRound); // 设置线条两端的形状，第二个参数为枚举类型
    CGContextStrokePath(context); // 渲染
}

- (void)drawMyLine2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 4.0);
    CGPoint aPoints[2];//坐标点
    aPoints[0] =CGPointMake(100, 80);//坐标1
    aPoints[1] =CGPointMake(280, 80);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
}

// 绘制矩形     可以用addrect或者用path
- (void)drawMyRect{
    // 1绘制画板   2画，属性   3渲染
    CGContextRef context = UIGraphicsGetCurrentContext();  // 画板 ,注意context前面没有*
    [COLOR1 setFill]; // 设置颜色填充
    [COLOR2 setStroke]; // 颜色
    
    CGContextSetLineWidth(context, 10.0); // 设置线条宽度
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置为圆角
    
    CGContextAddRect(context, CGRectMake(100, 100, 200, 150));
//    CGContextStrokePath(context); // 渲染, 这种渲染只能展示出边框
    CGContextDrawPath(context, kCGPathFillStroke); // 这种渲染能展示出边框和矩形内部填充色
}

// 绘制三角形  用path,再添加path,绘制
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
//    CGContextClosePath(context); //或者用closePath
    CGContextAddPath(context, pathref);
    /*
     //这种方法也行：
     CGPoint sPoints[3];//坐标点
     sPoints[0] =CGPointMake(100, 220);//坐标1
     sPoints[1] =CGPointMake(130, 220);//坐标2
     sPoints[2] =CGPointMake(130, 160);//坐标3
     CGContextAddLines(context, sPoints, 3);//添加线
     CGContextClosePath(context);
     */
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
- (void)drawMyArc1{
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

// 切线绘制弧,https://www.jianshu.com/p/76c3e47cc7da
- (void)drawMyArc2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 2.0);
    
    CGContextMoveToPoint(context, 100, 180);
    CGContextAddArcToPoint(context, 280, 60, 160, 250, 30);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

// 绘制椭圆
- (void)drawMyEllipseInRect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 2.0);
    CGContextAddEllipseInRect(context, CGRectMake(20, 20, 200, 300));
    CGContextDrawPath(context, kCGPathFillStroke);
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
    
    CGContextSetLineJoin(context, kCGLineJoinRound); // 设置转角为圆形,连接样式
    CGContextAddPath(context, pathref);
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 设置虚线
- (void)drawMyProperty3{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 10.0);
    
    CGFloat lengths[] = {10,50,10};  // 指定虚线的length, 先绘制10个点，再跳过50个点；再绘制10个点，再跳过10个点；再绘制50个点，跳过10个点，如此反复
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

// Bezier Curve
// https://blog.csdn.net/rhljiayou/article/details/9919713
- (void)drawMyDesign1{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setStroke];
    [COLOR2 setFill];
    CGContextSetLineWidth(context, 2.0);
    // 二次曲线
    CGContextMoveToPoint(context, 120, 300);//设置Path的起点
    CGContextAddQuadCurveToPoint(context,190, 310, 120, 390);//设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    // 三次曲线
    CGContextMoveToPoint(context, 200, 300);//设置Path的起点
    CGContextAddCurveToPoint(context,250, 280, 250, 400, 280, 300);//设置贝塞尔曲线的控制点和终点坐标
    CGContextStrokePath(context);
    // 画图片
    UIImage *image = [UIImage imageNamed:@"apple.jpg"];
    [image drawInRect:CGRectMake(60, 40, 200, 200)];//在坐标中画出图片
//    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片
    CGContextDrawImage(context, CGRectMake(60, 440, 200, 200), image.CGImage);//使图片上下颠倒了,参考:http://blog.csdn.net/koupoo/article/details/8670024
//    CGContextDrawTiledImage(context, CGRectMake(0, 0, 200, 200), image.CGImage);//平铺图
    
    /*画圆角矩形*/
    float fw = 180;
    float fh = 280;
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径

}

// 渐变色
- (void)drawMyDesign2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    //矩形，并填弃渐变颜色
    //关于颜色参考http://blog.sina.com.cn/s/blog_6ec3c9ce01015v3c.html
    //http://blog.csdn.net/reylen/article/details/8622932
    //第一种填充方式，第一种方式必须导入类库quartcore并#import <QuartzCore/QuartzCore.h>，这个就不属于在context上画，而是将层插入到view层上面。那么这里就设计到Quartz Core 图层编程了。
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(120, 90, 60, 30);
    gradient1.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor grayColor].CGColor,
                        (id)[UIColor blackColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor blueColor].CGColor,
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                        (id)[UIColor orangeColor].CGColor,
                        (id)[UIColor brownColor].CGColor,nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
   
    //第二种填充方式 矩形对角线渐变
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    //画线形成一个矩形
    //CGContextSaveGState与CGContextRestoreGState的作用
    /*
     CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextRestoreGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
     */
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 220, 90);
    CGContextAddLineToPoint(context, 240, 90);
    CGContextAddLineToPoint(context, 240, 110);
    CGContextAddLineToPoint(context, 220, 110);
    CGContextClip(context);//context裁剪路径,后续操作的路径
    //CGContextDrawLinearGradient(CGContextRef context,CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,CGGradientDrawingOptions options)
    //gradient渐变颜色,startPoint开始渐变的起始位置,endPoint结束坐标,options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (220,90) ,CGPointMake(240,110),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context
    
    //再写一个看看效果：矩形竖向渐变
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 260, 90);
    CGContextAddLineToPoint(context, 280, 90);
    CGContextAddLineToPoint(context, 280, 100);
    CGContextAddLineToPoint(context, 260, 100);
    CGContextClip(context);//裁剪路径
    //说白了，开始坐标和结束坐标是控制渐变的方向和形状
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (260, 90) ,CGPointMake(260, 100),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context
    
    //下面再看一个颜色渐变的圆
    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 100), 0.0, CGPointMake(300, 100), 10, kCGGradientDrawsBeforeStartLocation);
    
}
@end
