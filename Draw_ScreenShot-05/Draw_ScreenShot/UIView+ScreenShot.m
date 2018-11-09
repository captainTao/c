//
//  UIView+ScreenShot.m
//  Draw_ScreenShot
//
//  Created by captain on 2018/6/4.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "UIView+ScreenShot.h"

@implementation UIView (ScreenShot)

-(UIImage *)imageScreenShot{
    UIGraphicsBeginImageContext(self.frame.size); // 开始绘制
    [self.layer renderInContext:UIGraphicsGetCurrentContext()]; // 绘制当前
    UIImage *shotImage = UIGraphicsGetImageFromCurrentImageContext(); // 获取当前
    UIGraphicsEndImageContext(); // 结束绘制
    return shotImage;
}
@end
