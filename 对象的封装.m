
/*
面向对象的三大特性：
封装，继承，多态

	set方法
1.有参数，参数类型与成员变量保持一致
2.返回值为void
3.命名以set开始，后面成员变量名的首字母必须大写

1)	作用：用来设置成员变量，可以在方法里面过滤掉一些不合理的值
2)	命名规范：
	方法都是以set开头，而且后面跟上成员变量名，成员变量名的首字母必须大写
	形参名称不要跟成员变量同名


	get方法
1.没有参数
2.有返回值
3.命名与成员变量同名，但差一个下划线
4.赋值在方法中赋值

1)	作用：返回对象内部的成员变量
2)	命名规范：get方法的名称一般就跟成员变量同名
4.	成员变量的命名规范
	成员变量都以下划线 _ 开头
	可以跟get方法的名称区分开
	可以跟其他局部变量区分开，一看到下划线开头的变量，肯定是成员变量
*/

// 5.	代码示例
#import <Foundation/Foundation.h>
// 声明
@interface Car : NSObject
{
    int _wheels; // 轮子个数
}
/*set方法*/
- (void) setWheels:(int)wheels;
/*get方法*/
- (int) wheels;
@end

@implementation Car
// set方法的实现
- (void) setWheels:(int)wheels
{
    // 对外面传进来的轮子数进行过滤
    if (wheels<=0)
    {
        wheels = 1;
    }
    
    _wheels = wheels;
}

// get方法的实现
- (int) wheels
{
    return _wheels;
}
@end


// 6.	封装的好处
// 	过滤不合理的值
// 	屏蔽内部的赋值过程
// 	让外界不必关注内部的细节




