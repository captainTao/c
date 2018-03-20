//
//  mybutton.m
//  FirstApp
//
//  Created by captain on 2018/3/20.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "mybutton.h"

@implementation mybutton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
// 边框
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.cornerRadius = 5.0;
// image
        self.imageView.contentMode = UIViewContentModeScaleAspectFit; // !!! 特别注意，设置图像的fit模式
        [self setImage:[UIImage imageNamed:@"01.jpg"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"02.jpg"] forState:UIControlStateHighlighted];
// title
        [self setTitle:@"未选中" forState:UIControlStateNormal];
        [self setTitle:@"选中" forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];

    }
    return self;
}
// 设置button中图片位置：
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat h = contentRect.size.height/2; // 设置button高度的1/2
    CGFloat w = h; // 宽和高相等
    CGFloat x = 10; // 距离左边为5个像素
    CGFloat y = (contentRect.size.height-h)/2; // （button高度-图像高度）/2
    return CGRectMake(x, y, w, h);
}
// 设置button中文字位置：
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat h = contentRect.size.height/2; // 设置button高度的1/2
    CGFloat w = contentRect.size.width -h-5; // 设置字体的宽度
    CGFloat x = 10+h+5; // 距离左边为5+h+5个像素
    CGFloat y = (contentRect.size.height-h)/2; // （button高度-图像高度）/2
    return CGRectMake(x, y, w, h);
}
@end
