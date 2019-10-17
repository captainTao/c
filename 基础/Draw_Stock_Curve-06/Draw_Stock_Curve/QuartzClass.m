//
//  QuartzClass.m
//  Draw_Stock_Curve
//
//  Created by captain on 2018/11/8.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "QuartzClass.h"
#define COLOR1 [UIColor colorWithRed:220/255.0 green:20/255.0 blue:60/255.0 alpha:1.0]
#define COLOR2 [UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1.0]
#define COLOR3 [UIColor colorWithRed:188/255.0 green:238/255.0 blue:104/255.0 alpha:1.0]
#define displayRatio 0.718  //从屏幕的多少比例开始展示
#define displayNumber 40  //展示多少条信息
#define n 17 //从哪一条信息开始展示
@interface QuartzClass(){
    NSMutableArray *stockData;
}
@end

@implementation QuartzClass

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawStockRectAndLine];
    [self drawTradeVolumeLine];
}

- (instancetype) initWithFrame:(CGRect)frame stockData:(NSMutableArray *)normalizationStockData{
    if (self = [super initWithFrame:frame]) {
        stockData = normalizationStockData;
    }
    return self;
}
// 画股价矩形和线条
- (void)drawStockRectAndLine{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for (int i=n; i<stockData.count; i++) {
        StockClass *item = [stockData objectAtIndex:i];
        float beginPrice = item.beginPrice;
        float endPrice = item.endPrice;
        float maxPrice = item.maxPrice;
        float minPrice = item.minPrice;
        CGPoint points[2];  //获取maxPrice和minPrice
        points[0] = [self getCurrentPoint:i-n Price:maxPrice];
        points[1] = [self getCurrentPoint:i-n Price:minPrice];
        [COLOR2 setStroke];
        [COLOR2 setFill];
        if (beginPrice > endPrice) {
            CGContextAddRect(context, [self getCurrentRect:i-n beginPrice:beginPrice andEndPrice:endPrice]);//画rect
            CGContextAddLines(context, points, 2);//画线
            CGContextDrawPath(context, kCGPathFillStroke);
        }else{
            CGContextSaveGState(context);
            [COLOR1 setStroke];
            [COLOR1 setFill];
            CGContextAddRect(context, [self getCurrentRect:i-n beginPrice:beginPrice andEndPrice:endPrice]);
            CGContextAddLines(context, points, 2);
            CGContextDrawPath(context, kCGPathFillStroke);
            CGContextRestoreGState(context);
        }
    }
}
// 画交易量的曲线
- (void)drawTradeVolumeLine{
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    [COLOR3 setStroke];
    CGPoint points[displayNumber];
    for (int i=n; i<stockData.count; i++) {
        StockClass *item = [stockData objectAtIndex:i];
        int tradeVolume = item.tradeVolume;
        points[i-n]=[self getCurrentVolume:i-n Volume:tradeVolume];
    }
    CGContextAddLines(context, points, displayNumber);
    CGContextDrawPath(context, kCGPathStroke);
}

// 获取矩形位置
- (CGRect)getCurrentRect:(int)i beginPrice:(float)beginPrice andEndPrice:(float)endPrice{
    CGSize ScreenSize =[UIScreen mainScreen].bounds.size;
//    NSLog(@"%@",NSStringFromCGSize(ScreenSize));
    CGFloat x = i*ScreenSize.width/displayNumber+2; //先算40个点
    CGFloat y = 0;
    CGFloat w = ScreenSize.width/displayNumber-4;
    CGFloat h = fabsf(beginPrice-endPrice);
    if (beginPrice > endPrice) {
        y = ScreenSize.height*displayRatio - beginPrice; //beginPrice在下，镜像到上，
    } else {
        y = ScreenSize.height*displayRatio - endPrice;
    }
    return CGRectMake(x, y, w, h);
}
// 获取最大和最小价格点位置
- (CGPoint)getCurrentPoint:(int)i Price:(float)Price{
    CGSize ScreenSize =[UIScreen mainScreen].bounds.size;
    CGFloat w = ScreenSize.width/displayNumber-4;
    CGFloat x = i*ScreenSize.width/displayNumber+2+w/2; //画的起点+rect的一半
    CGFloat y = ScreenSize.height*displayRatio - Price;
    return CGPointMake(x, y);
}

// 获取交易量位置
- (CGPoint)getCurrentVolume:(int)i Volume:(int)Volume{
    CGSize ScreenSize =[UIScreen mainScreen].bounds.size;
    CGFloat w = ScreenSize.width/displayNumber-4;
    CGFloat x = i*ScreenSize.width/displayNumber+2+w/2; //画的起点+rect的一半
    CGFloat y = ScreenSize.height*displayRatio - Volume - 100;//高度再提高150pixel
    return CGPointMake(x, y);
}
@end
