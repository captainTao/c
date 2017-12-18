
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




// 封装的调用

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    // 成员变量尽量不要用@public
    // @public
    int age;
    
    //@public
    // 只读（readonly）：只允许外界访问我的no，不允许外界修改我的no
    int no; // 只需要提供get方法
}

//
/*
 set方法
 1.作用： 提供一个方法给外界设置成员变量值，可以在方法里面对参数进行相应过滤
 2.命名规范：
 1> 方法名必须以set开头
 2> set后面跟上成员变量的名称，成员变量的首字母必须大写
 3> 返回值一定是void
 4> 一定要接收一个参数，而且参数类型跟成员变量类型一致
 5> 形参的名称不能跟成员变量名一样
 */
- (void)setAge:(int)newAge;

/*
 get方法
 1.作用：返回对象内部的成员变量
 2.命名规范：
 1> 肯定有返回值，返回值类型肯定与成员变量类型一致
 2> 方法名跟成员变量名一样
 3> 不需要接收任何参数
 */
- (int)age;

- (void)study;

@end

@implementation Student

// set方法的实现
- (void)setAge:(int)newAge
{
    // 对传进来的参数进行过滤
    if (newAge <= 0)
    {
        newAge = 1;
    }
    
    age = newAge;
}

- (int)age
{
    return age;
}

- (void)study
{
    NSLog(@"%d岁的学生在学习", age);
}

@end

int main()
{
    Student *stu = [Student new];
    //stu->age = -10;
    
    //stu->age = 10;
    
    [stu setAge:10];
    
    
    NSLog(@"学生的年龄是%d岁", [stu age]);
    
    //[stu study];
    
    
    return 0;
}




// 封装实例，一个方法的可读写，

#import <Foundation/Foundation.h>

typedef enum {  //枚举类型
    SexMan,
    SexWoman
} Sex;


@interface Student : NSObject
{/*成员变量的命名规范：一定要以下划线 _ 开头
  作用：
  1.让成员变量和get方法的名称区分开
  2.可以跟局部变量区分开，一看到下划线开头的变量，一般都是成员变量
  */
    int _no;
    Sex _sex;
}

// sex的set和get方法
- (void)setSex:(Sex)sex;
- (Sex)sex;

// no的set和get方法
- (void)setNo:(int)no;
- (int)no;

@end

@implementation Student

- (void)setSex:(Sex)sex
{
    _sex = sex;
}

- (Sex)sex
{
    return _sex;
}

- (void)setNo:(int)no
{
    _no = no;
}
- (int)no
{
    return _no;
}

@end


int main()
{
    Student *stu = [Student new];
    
    [stu setSex:SexMan];
    [stu setNo:10];
    
    [stu sex];
    
    [stu no];
    
    return 0;
}


// oc允许传递没有被定义的消息，但c，和c++允许
// oc的方法是动态调用，是在运行中才会检测；

