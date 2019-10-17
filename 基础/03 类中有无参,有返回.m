#import <Foundation/Foundation.h>

// 有参,有返回值方法类的调用
/*
计算器：
1.返回pi
2.返回一个整数的平方
3.返回两个整数的和
*/
@interface Calculator : NSObject
- (double)pi;
- (int)square:(int)num;
// - (int)sum:(int)num1 :(int)num2;  //一般不这么写
- (int)sumWithNum1:(int)num1 andNum2:(int)num2;
@end

@implementation Calculator
- (double)pi{
	return 3.14;
}
- (int)square:(int)num{
	return num * num;
}
- (int)sumWithNum1:(int)num1 andNum2:(int)num2{
	return num1 + num2;
}
@end

int main(int argc, char const *argv[])
{
	Calculator *cal = [Calculator new];

	NSLog(@"调用pi方法之后的值：%f", [cal pi]); //0个参数一个返回值
	NSLog(@"平方后的值为%d", [cal square:10]); //一个参数一个返回值
	NSLog(@"两个参数的和为%d", [cal sumWithNum1:8 andNum2:9]);//两个参数一个返回值
	return 0;
}