//
//  Quartz.m
//  Draw_Picture
//
//  Created by captain on 2018/5/29.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Quartz.h"

@implementation Quartz

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawImageClip];
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
@end
