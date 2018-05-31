//
//  Quartz.m
//  Draw_Picture
//
//  Created by captain on 2018/5/29.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Quartz.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@implementation Quartz

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawImagePixel];
}

// 图片绘制
- (void)drawPicture{
    UIImage *image = [UIImage imageNamed:@"images/1.jpg"];
//    [image drawAtPoint:CGPointMake(100, 100)];// 绘制的起始点坐标
//    [image drawInRect:CGRectMake(30, 100, 300, 200)]; // 矩形中拉伸填充
    [image drawAsPatternInRect:CGRectMake(30, 100, 300, 500)]; // 图层的平铺
}

 // 图片的裁剪成圆形
- (void)drawImageClip{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(150, 150, 60, 60));
    CGContextClip(context);
    CGContextFillPath(context);
    UIImage *image = [UIImage imageNamed:@"images/1.jpg"];
    [image drawAtPoint:CGPointMake(150, 150)];
    CGContextFillPath(context);
}

// 在图片上  绘制文字
- (void)drawlogoTitle{
    UIImage *image = [UIImage imageNamed:@"images/1.jpg"];
    [image drawAtPoint:CGPointMake(100, 100)];
    
    NSString *str = @"Captain website";
    NSMutableParagraphStyle *paragraphstyle =  [[NSMutableParagraphStyle defaultParagraphStyle]mutableCopy];// 设置段落的样式为默认样式,mutablecopy为快速拷贝
    paragraphstyle.lineBreakMode = NSLineBreakByClipping;
    
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:10.0],NSParagraphStyleAttributeName:paragraphstyle,NSForegroundColorAttributeName:[UIColor greenColor]};// 设置文字的属性
    [str drawInRect:CGRectMake(100, 100, 100, 10) withAttributes:dic];// draw文字的属性
    [str drawInRect:CGRectMake(100, 150, 100, 10) withAttributes:nil];// draw文字的属性为空
};

// 图片上再做图
- (void)drawlogOnImage{
    UIImage *image = [UIImage imageNamed:@"images/1.jpg"];
    [image drawAtPoint:CGPointMake(100, 100)];
    [image drawAsPatternInRect:CGRectMake(100, 100, 30, 20)];
}

// 算法优化，特效相机，选择像素点
- (void)drawImagePixel{
    UIImage *image = [UIImage imageNamed:@"images/1.jpg"];
    
    size_t width = 100;  //获取像素点
    size_t height = 63;
    // 每1个像素由4个点构成：R＋G＋B＋alpha    8bit = 1 Byte
    size_t bytePerRow = width*4;
    CGImageAlphaInfo alphaInfo = kCGImageAlphaPremultipliedFirst; // 获取alpha信息
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL, width, height, 8, bytePerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault|alphaInfo); // 创建一个像素矩阵
    // 渲染
    CGContextDrawImage(bitmapContext, CGRectMake(0, 0, width, height), image.CGImage);
    
    UInt8 *data = (UInt8 *)CGBitmapContextGetData(bitmapContext);
    vImage_Buffer src = {data,height,width,bytePerRow}; // 源buffer
    vImage_Buffer dest = {data,height,width,bytePerRow}; // 目的buffer
    Pixel_8888 bgColor = {0,0,0,0}; // pixel
    vImageRotate_ARGB8888(&src, &dest, NULL, M_PI_2, bgColor, kvImageBackgroundColorFill);
    
    CGImageRef rotateImageRef = CGBitmapContextCreateImage(bitmapContext);
    UIImage *imageNew = [UIImage imageWithCGImage:rotateImageRef scale:0.5 orientation:image.imageOrientation]; // 用CGImage来创建一个UIImage
    [imageNew drawAtPoint:CGPointMake(100, 100)];
}
@end
