/**
 5.设计一个类Point2D，用来表示二维平面中某个点
 1> 属性
 * double x
 * double y
 
 2> 方法
 * 属性相应的set和get方法
 * 设计一个对象方法同时设置x和y
 * 设计一个对象方法计算跟其他点的距离
 * 设计一个类方法计算两个点之间的距离
 
 3> 提示
 * C语言的math.h中有个函数：double pow(double n, double m); 计算n的m次方
 * C语言的math.h中有个函数：double sqrt(double n); 计算根号n的值（对n进行开根）
 */

#import <Foundation/Foundation.h>
#import <math.h>

// 点
@interface Point2D : NSObject
{
    double _x; // x值
    double _y; // y值
}
// x值的getter和setter
- (void)setX:(double)x;
- (double)x;

// y值的getter和setter
- (void)setY:(double)y;
- (double)y;

// 同时设置x和y
- (void)setX:(double)x andY:(double)y;

// 计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other;

// 计算两个点之间的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2;

@end

@implementation Point2D
// x值的getter和setter
- (void)setX:(double)x
{
    _x = x;
}
- (double)x
{
    return _x;
}

// y值的getter和setter
- (void)setY:(double)y
{
    _y = y;
}
- (double)y
{
    return _y;
}

// 同时设置x和y
- (void)setX:(double)x andY:(double)y
{
    // 第1种思路
    // _x = x;
    // _y = y;
    
    // 第2种思路
    [self setX:x];
    [self setY:y];
}

// 计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other
{
    /*
    // 方法一： 类方法和对象方法可以相互调用？？？？

    // 两点距离公式：( (x1-x2)的平方 + (y1-y2)的平方 )开根
    
    // x1-x2
    double xDelta = [self x] - [other x];
    // (x1-x2)的平方
    double xDeltaPingFang = pow(xDelta, 2);
    
    // y1-y2
    double yDelta = [self y] - [other y];
    // (y1-y2)的平方
    double yDeltaPingFang = pow(yDelta, 2);
    
    return sqrt(xDeltaPingFang + yDeltaPingFang);
    */

    // 方法二：
    // 不要再傻乎乎算一遍了，直接调用类方法即可
    return [Point2D distanceBetweenPoint1:self andPoint2:other];
}

// 计算两个点之间的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2
{

    /*
    // 方法一：
    return [p1 distanceWithOther: p2];
    */

    // 方法二：
    // 两点距离公式：( (x1-x2)的平方 + (y1-y2)的平方 )开根
    
    // x1-x2
    double xDelta = [p1 x] - [p2 x];
    // (x1-x2)的平方
    double xDeltaPingFang = pow(xDelta, 2);
    
    // y1-y2
    double yDelta = [p1 y] - [p2 y];
    // (y1-y2)的平方
    double yDeltaPingFang = pow(yDelta, 2);
    
    return sqrt(xDeltaPingFang + yDeltaPingFang);

}
@end

int main()
{
    Point2D *p1 = [Point2D new];
    [p1 setX:10 andY:10];
    
    Point2D *p2 = [Point2D new];
    [p2 setX:13 andY:14];
    
    double d1 = [p1 distanceWithOther:p2];
    
    double d2 = [Point2D distanceBetweenPoint1:p1 andPoint2:p2];
    
    NSLog(@"d1=%f, d2=%f", d1, d2);
    
    return 0;
}