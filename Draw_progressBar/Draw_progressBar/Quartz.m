//
//  Quartz.m
//  Draw_progressBar
//
//  Created by captain on 2018/5/28.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Quartz.h"


@implementation Quartz


- (instancetype)initWithFrame:(CGRect)frame{ // 返回一个实例对象
    if (self = [super initWithFrame:frame]) {
        self.percent = 0;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.percent !=0) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [COLOR1 setStroke];
        
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 15.0);
        CGContextMoveToPoint(context, 20, 208);
        CGContextAddLineToPoint(context, 20+(self.percent/100.0)*([UIScreen mainScreen].bounds.size.width-40), 208); //6s的宽度为375
        CGContextStrokePath(context);
    }
}


@end
