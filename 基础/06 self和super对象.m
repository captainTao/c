// self对象：

/*
 self的用途：
 1> 谁调用了当前方法，self就代表谁
 * self出现在对象方法中，self就代表对象
 * self出现在类方法中，self就代表类
 
 2> 在对象方法利用"self->成员变量名"访问当前对象内部的成员变量
 
 3> self->_xx   当前对象方法中调用self
 4> [self 方法名]可以调用其他对象方法\类方法
 */




// super:

/*
 super的作用
 1.直接调用父类中的某个方法
 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 
 3.使用场合：子类重写父类的方法时想保留父类的一些行为
 */


/***********************************************/

// self->_xx:   当前对象方法中调用self

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

- (void)test;

@end

@implementation Person
- (void)setAge:(int)age
{
    // _age = age;
    self->_age = age;
}
- (int)age
{
    return self->_age;
}

- (void)test
{
    // self：指向了方向调用者,代表着当期对象
    int _age = 20;
    NSLog(@"Person的年龄是%d岁", self->_age); //self为当前类或者当前实例变量
}

@end

int main()
{
    Person *p = [Person new];
    
    [p setAge:10];
    
    [p test];
    
    return 0;
}



/***********************************************/

// [self 方法名] 调用对象 其他方法\类方法

#import <Foundation/Foundation.h>

@interface Dog : NSObject
- (void)bark;
- (void)run;
@end

@implementation Dog
- (void)bark
{
    NSLog(@"汪汪汪");
}
- (void)run
{
    [self bark];   //先叫两声，才跑两步；先调用bark方法
    //NSLog(@"汪汪汪");
    NSLog(@"跑跑跑");
}
@end

int main()
{
    Dog *d = [Dog new];
    
    [d run];
    
    return 0;
}



/***********************************************/

// [self 方法名]  调用类的其他方法
#import <Foundation/Foundation.h>

@interface JiSusnQi : NSObject
+ (int)sumOfNum1:(int)num1 andNum2:(int)num2;

+ (int)averageOfNum1:(int)num1 andNum2:(int)num2;
@end

@implementation JiSusnQi
+ (int)sumOfNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}

+ (int)averageOfNum1:(int)num1 andNum2:(int)num2
{
    // 在这种情况下，self代表类
    int sum = [self sumOfNum1:num1 andNum2:num2]; // [self 方法名]
    return sum / 2;
}
@end

int main()
{
    int a = [JiSusnQi averageOfNum1:10 andNum2:12];
    
    NSLog(@"a=%d", a);
    
//    JiSusnQi *jsq = [JiSusnQi new];
//    
//    
//    [jsq sumOfNum1:10 andNum2:13];
    
    return 0;
}





/***********************************************/

// super：

/*
 僵尸
 
 跳跃僵尸、舞王僵尸、铁桶僵尸
 */


/*
 super的作用
 1.直接调用父类中的某个方法
 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 
 3.使用场合：子类重写父类的方法时想保留父类的一些行为
 */

#import <Foundation/Foundation.h>
// 僵尸
@interface Zoombie : NSObject
- (void)walk;

+ (void)test;
- (void)test;

@end

@implementation Zoombie
- (void)walk
{
    NSLog(@"往前挪两步******");
}

+ (void)test
{
    NSLog(@"Zoombie+test");
}

- (void)test
{
    NSLog(@"Zoombie-test");
}
@end


// 跳跃僵尸
@interface JumpZoombie : Zoombie
+ (void)haha;
- (void)haha2;
@end


@implementation JumpZoombie

+ (void)haha
{
    [super test];
}

- (void)haha2
{
    [super test];
}

- (void)walk
{
    // 跳两下
    NSLog(@"跳两下");
    
    // 走两下(直接调用父类的walk方法)
    [super walk];
    //NSLog(@"往前挪两步----");

}
@end

int main()
{
    //[JumpZoombie haha];
    JumpZoombie *jz = [JumpZoombie new];
    
    [jz haha2]; //Zoombie-test
    
    return 0;
}