C语言一共提供了32个关键字，这些关键字都被C语言赋予了特殊含义:
auto double int struct break else long switch
case enum register typedef char extern return union
const float short unsigned continue for signed void
default goto sizeof volatile do if while static

a=10,b=11,使用两种方法交换他们的值：
使用第三方变量
int temp;
temp = a;
a = b;
b = temp;

不使用第三方变量
a = b - a;
b = b - a;
a = b + a;


int age;
scanf("%d", &age);  //&是C语言中的一个地址运算符
// 短横线- 
scanf("%d-%d-%d", &a, &b, &c); //输入的时候： 10-14-20
// 逗号, 
scanf("%d,%d,%d", &a, &b, &c); // 输入格式：10,14,20  
// 井号# 
scanf("%d#%d#%d", &a, &b, &c); // 输入格式：10#14#20  
// 字母x ,或者其他英文字母
scanf("%dx%dx%d", &a, &b, &c); // 输入格式：10x14x20
// 空格 ， 分隔符可以是空格、tab、回车
scanf("%d %d %d", &a, &b, &c);

note:  
scanf的第一个参数中不要包含\n，比如scanf(“%d\n”, &a); 这将导致scanf函数无法结束


类型转换

自动类型转换
int a = 10.6;
int b = 10.5 + 1.7;
自动将大类型转换为了小类型，会丢失精度
自动类型提升
int b = 10.5 + 10;
将右边的10提升为了double类型
double b = 1.0 / 2;
解决除法的精度问题
强制类型转换
double a = (double)1 / 2;
double b = (double)(1 / 2);


sizeof( 数据类型 ): 数据类型的长度

main函数
返回值：0，正常退出；1，异常退出

signed int等价于signed，
unsigned int等价于unsigned

| 按位或
^ 按位异或
~ 按位取反


数组：
int ages[5] = {19, 19, 20, 21, 25}

初始化方式
u int a[3] = {10, 9, 6};
u int a[3] = {10,9};
u int a[] = {11, 7, 6};
u int a[4] = {[1]=11,[0] = 7};

习题
1.提示输入5个学生的成绩，算出平均分、最高分、最低分，然后输出
2.设计一个函数：int arrayMax(int a[], int count)，找出数组元素的最大值
3.设计一个函数：int arraySum(int a[], int n)，求一维数组a前n个数的和
4.设计一个函数：将一维整型数组中的元素逆序存放。比如本来是1,3,4,2，逆序存放就变成了：2，4，3，1



二维数组初始化
l int a[3][4] = {1,2,3,4,5,6};
l int a[3][4] = {{},{},{}};
l 数组元素简单访问
l int a[][5] = {3,21,31,2,32,1};

习题
编写一个函数char_contains(char str[],char c)，如果字符串str中包含字符c则返回数值1，否则返回数值0



指针
定义：
int a = 10;
int *p = &a;

#include <stdio.h>
int main(int argc, char const *argv[])
{
    int a=10;
    int *pa; //如果要写成一行，用int *pa=&i;
    pa=&a;  //单独一行的时候，不能写成*pa=&i(编译报错),或者*pa=i（出来的值报错）
    *pa=20;
    printf("%d\n", a); //20
    printf("%d\n", *pa); //20
    return 0;
}

清空指针：
p = 0;
p = NULL;

指针探究：
1.指针变量所占用的存储空间？
2.为何指针变量要分类型？
3.指针遍历字符和整型的数组？
4.设计一个函数：int arraySum(int a[], int n)，求一维数组a前n个数的和。现在利用int *p替换int a[]

习题：
1.编写一个int string_len(char *s)，返回字符串s的字符长度

返回指针的函数的一般形式为：类型名 * 函数名(参数列表)
指向函数的指针一般形式：函数的返回值类型 (*指针变量名)(形参1, 形参2, ...);

// 循环遍历数组：
#include <stdio.h>
int main(int argc, char const *argv[])
{
int i, a[] = {3,4,5,6,7,3,7,4,4,6}; 
for (i = 0; i <= 9; i++) {
    printf("%d\n", a[i]); } 
    return 0;
}

// 指针遍历数组：
#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, *pa, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    pa = a; //数组名a直接赋值给了指针*pa
    for (i = 0; i <= 9; i++) {
        printf("%d\n", pa[i]); }  //通过pa[i]取值，又把指针当做了一个数组
    return 0;
}

#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, *pa, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    pa = a; //数组名a直接赋值给了指针*pa
    for (i = 0; i <= 9; i++) {
        printf("%d\n", *(pa+i); }  //通过*(pa+i)取值
    return 0;
}

#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, *pa, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    pa = a; //数组名a直接赋值给了指针*pa
    for (i = 0; i <= 9; i++) {
        printf("%d\n", *pa); //直接取指针
        pa++; //地址加1
        }  //通过*(pa+i)取值
    return 0;
}

#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    for (i = 0; i <= 9; i++){
        printf("%d\n", *(a+i)); } //可以直接取a,数组名也就是指针,前面没定义指针a
    return 0;
}

// 数组名和指针的区别：（某种意义上可以认为一样）
// 指针是一个指针变量，可以被修改；而数组是一个指针常量，不能被修改；

#include <stdio.h>
int main(int argc, char const *argv[]){
    int i, a[] = {3,4,5,6,7,3,7,4,4,6}; 
    int *const pa = a; //注意const位置，不是const int *pa,常量指针
    for (i = 0; i <= 9; i++) {
        printf("%d\n", *(pa+i)); //直接取指针
        // pa++; //地址加1,这儿不能这么写，认为pa是一个常量了，所以pa的值不能被改变
        }  //通过*(pa+i)取值
    return 0;
}

note:
常量：
const int i=3
int const i=5
指针常量：
const int *p  //p的值可以被修改
int *const p  //p的值不能被修改

==============================================

#include <stdio.h>
void Exchg2(int *px, int *py){
    int tmp = *px; 
    *px = *py; 
    *py = tmp; 
    printf("*px = %d, *py = %d.\n", *px, *py);
} 
int main(){ 
    int a = 4; 
    int b = 6; 
    Exchg2(&a, &b); //6,4；函数的参数是个指针的话，传入的应该是一个地址
    printf("a = %d, b = %d.\n", a, b); //6,4,这里交换了指针地址，即对a，b进行了修改
    return(0);
} 


#include <stdio.h>
void Exchg3(int x, int y){
    int tmp = x; 
    x = y; 
    y = tmp; 
    printf("x = %d,y = %d\n", x, y); 
} 
int main(){ 
    int a = 4; 
    int b = 6; 
    Exchg3(a, b);  //6,4
    printf("a = %d, b = %d\n", a, b); 
    return(0);  //4,6 前一个函数引起的只是x,y形参的变化，不影响实参a,b
}

-------------------------------------------------
指向指针的指针
int **ppi;
int *pi;
int i=50;
pi=&i;
*ppi=&pi;
// *ppi的值就是*pi的值作为地址，然后去寻值


双指针的运用栗子：

#include <stdio.h>
void find1(char array[], char search, char *pa)
{
    int i;
    for (i = 0; *(array + i) != 0; i++){
    if ( *(array+i) == search){
        pa = array + i;
        // printf("找到了,pa=%s\n", pa); //找到了,pa=dfsdfdf
        break;
        }
    else if (*(array+i) == 0){
        pa = 0;
        // printf("没找到,pa=%s\n", pa);
        break;
        }
    }
}

int main()
{
    char str[] = {"afsdfsdfdf\0"}; /* 待查找的字符串 */
    char a = 'd'; /* 设置要查找的字符 */
    char *p = 0; /* 如果查找到后指针 p 将指向字符串中查找到的第 1 个字符的地址。 */
    find1(str, a, p); /* 调用函数以实现所要操作。这儿的p是传入的地址值 */
    if (0 == p){
        printf("没找到！\n"); /* 如果没找到则输出此句 */
        }
    else{
        printf("找到了，p = %s", p); /* 如果找到则输出此句*/
        }
    return(0);
}

//函数的结果是"没有找到"
array = str;
search = a;
pa = p; /* 请注意：以上三句是调用时隐含的动作。*/ 
// 址传递其实就是地址值传递！！！
// 这也是对形参的改变不影响实参；对pa的修改，并不影响函数外部p的值；
// 解决的一种方法是函数内部直接输出


// 还有一种方法就是双指针：
#include <stdio.h>
void find1(char array[], char search, char **ppa)
{
    int i;
    for (i = 0; *(array + i) != 0; i++){
    if ( *(array+i) == search){
        *ppa = array + i;
        // printf("找到了,pa=%s\n", pa);
        break;
        }
    else if (*(array+i) == 0){
        *ppa = 0;
        // printf("没找到,pa=%s\n", pa);
        break;
        }
    }
}
int main()
{
    char str[] = {"afsdfsdfdf\0"}; /* 待查找的字符串 */
    char a = 'd'; /* 设置要查找的字符 */
    char *p = 0; /* 如果查找到后指针 p 将指向字符串中查找到的第 1 个字符的地址。 */
    find1(str, a, &p); /* 调用函数以实现所要操作。这儿传入的是p的地址 */
    if (0 == p){
        printf("没找到！\n"); /* 如果没找到则输出此句 */
        }
    else{
        printf("找到了，p = %s\n", p); /* 如果找到则输出此句*/
        }
    return(0);
}

// 运行结果：找到了，p = dfsdfdf
 array = str;
 search = a;
 ppa = &p; /* 请注意：以上三句是调用时隐含的动作。 */ 
// ppa 指向指针 p 的地址。
// 对*ppa 的修改就是对 p 值的修改。

======================================================

函数名与指针：
note:
1.函数名就是指针；
2.赋值时，即可 FunP = &MyFun 形式，也可 FunP = MyFun。
void MyFun(int x); =  void MyFun(int);   /*不能写成 void (*MyFun)(int)。*/
void(*FunP)(int x); = void (*FunP)(int);  /*不能写成 void FunP(int)。*/ 



#include <stdio.h>

void MyFun(int x); /* 此处的声明也可写成：void MyFun(int) */

int main(int argc, char* argv[]){
    MyFun(10); /* 这里是调用 MyFun(10) 函数 */
    return(0);
}

void MyFun(int x){ /* 这里定义一个 MyFun 函数 */
    printf("%d\n",x);
}



#include <stdio.h>

void MyFun(int x); /* 这个声明也可写成：void MyFun( int )*/

void (*FunP)(int ); /*也可声明成 void(*FunP)(int x)，但习惯上一般不这样。 */

int main(int argc, char* argv[]){
    MyFun(10); /* 这是直接调用 MyFun 函数 ，10*/ 
    FunP = &MyFun; /* 将 MyFun 函数的地址赋给 FunP 变量 ；这儿类似于 pi=&i */
    (*FunP)(20); /* （★）这是通过函数指针变量 FunP 来调用MyFun 函数的。20 */
    // FunP(20); //这儿也可以这样写
    // (*MyFun)(20); //也可以这样
}

void MyFun(int x){ /* 这里定义一个 MyFun 函数 */
    printf("%d\n",x);
}



#include <stdio.h>

void MyFun(int x);

void (*FunP)(int );/* 声明一个用以指向同样参数，返回值函数的指针变量。 */

int main(int argc, char* argv[]){
    MyFun(10); /* 这里是调用 MyFun(10)函数-----10 */
    FunP = MyFun; /* 将 MyFun 函数的地址赋给 FunP 变量 ，相当于直接将函数名赋值给了指针*/
    FunP(20); /* （★）这是通过函数指针变量来调用 MyFun 函数的。---20*/
    // (*FunP)(20); //这儿也可以这样写
    // (*MyFun)(20); //也可以这样
    return 0;
}
void MyFun(int x){//这里定义一个 MyFun 函数
    printf("%d\n",x);
}




自动变量：
auto修饰
所有的局部变量在默认情况下都是自动变量

静态变量：
所有的全局变量都是静态变量
被关键字static修饰的局部变量也是静态变量

寄存器变量：
被关键字register修饰的自动变量都是寄存器变量
只有自动变量才可以是寄存器变量，全局变量和静态局部变量不行
寄存器变量只限于int、char和指针类型变量使用


结构体：
c语言中数组只能是一个类型，python可以是多个，于是引入了结构体来解决这个问题；
结构体跟对象不一样；

struct Student {
    char *name; // 姓名
    int age; // 年龄
    float height; // 身高
};


结构体的三种定义：
// 1.先定义结构体类型，再定义变量，结构体变量名为stu
struct Student {
    char *name;
     int age;
 };
struct Student stu;
// 2.定义结构体类型的同时定义变量
struct Student {
    char *name;
    int age;
} stu;
// 3.直接定义结构体类型变量，省略类型名
struct {
    char *name;
    int age;
} stu;


结构体的注意点:
1.不允许对结构体本身递归定义
2.结构体内可以包含别的结构体
3.定义结构体类型，只是说明了该类型的组成情况，并没有给它分配存储空间，就像系统不为int类型本身分配空间一样。
只有当定义属于结构体类型的变量时，系统才会分配存储空间给该变量
struct Student {
    char *name;
    int age;
};
struct Student stu;
// 第1~4行并没有分配存储空间，当执行到第6行时，系统才会分配存储空间给stu变量。
4.结构体变量占用的内存空间是其成员所占内存之和，而且各成员在内存中按定义的顺序依次排列

结构体初始化：
struct Student {
     char *name;
     int age;
};
 
struct Student stu = {"MJ", 27};
// 不能分开，下方的就是错误的：
// struct Student stu;
// stu = {"MJ", 27};

// 访问stu的age成员
stu.age = 27;

连续使用成员运算符"."访问最低一级成员
struct Date {
     int year;
     int month;
     int day;
};
struct Student {
    char *name;
    struct Date birthday;  // 结构体嵌套
};
struct Student stu;
stu.birthday.year = 1986; // 两个点访问深层
stu.birthday.month = 9;
stu.birthday.day = 10;


相同类型的结构体变量之间可以进行整体赋值
struct Student {
    char *name;
    int age;
};
struct Student stu1 = {"MJ", 27};
// 将stu1直接赋值给stu2
struct Student stu2 = stu1;
printf("age is %d", stu2.age);



结构体数组定义：
struct Student {
    char *name;
    int age;
};
struct Student stu[5]; //定义1，数组元素个数是5
 
struct Student {
    char *name;
    int age;
} stu[5]; //定义2
 
struct {
    char *name;
    int age;
} stu[5]; //定义3


结构体初始化：
struct {
    char *name;
    int age;
} stu[2] = { {"MJ", 27}, {"JJ", 30} };


结构体作为函数参数：

#include <stdio.h>

// 定义一个结构体
struct Student {
    int age;
};

void test(struct Student stu) {
    printf("修改前的形参：%d \n", stu.age);
    // 修改实参中的age
    stu.age = 10;    
    printf("修改后的形参：%d \n", stu.age);
}

int main(int argc, const char * argv[]) {   
    struct Student stu = {30};
    printf("修改前的实参：%d \n", stu.age); //30
    
    // 调用test函数
    test(stu);    //前：30，后：10
      
    printf("修改后的实参：%d \n", stu.age); //30,  形参的改变并不会影响实参
    return 0;
}



结构体的指针形式：struct 结构体名称 *指针变量名
结构体的指针形式，有3种访问结构体成员的方式
1.结构体变量名.成员名
2.(*指针变量名).成员名
3.指针变量名->成员名


#include <stdio.h>
int main(int argc, const char * argv[]) {
    // 定义一个结构体类型
    struct Student {
        char *name;
        int age;
    };
    
    // 定义一个结构体变量，实例化结构体
    struct Student stu = {"MJ", 27};
    
    // 定义一个指向结构体的指针变量
    struct Student *p;
    
    // 指向结构体变量stu
    p = &stu;
/*
     这时候可以用3种方式访问结构体的成员
     */
    // 方式1：结构体变量名.成员名
    printf("name=%s, age = %d \n", stu.name, stu.age);
    
    // 方式2：(*指针变量名).成员名
    printf("name=%s, age = %d \n", (*p).name, (*p).age);
    
    // 方式3：指针变量名->成员名
    printf("name=%s, age = %d \n", p->name, p->age);
    
    return 0;
}




枚举：
一般形式为：enum枚举名{枚举元素1,枚举元素2,……};
enum Season {spring, summer, autumn, winter}; 
枚举的三种定义：
enum Season {spring, summer, autumn, winter};
enum Season s;
enum Season {spring, summer, autumn, winter} s;
enum {spring, summer, autumn, winter} s;

note:
1.C语言编译器会将枚举元素(spring、summer等)作为整型常量处理,称为枚举常量。
2.默认情况下，第一个枚举元素的值为0，第二个为1，依次顺序加1。
enum Season {spring, summer, autumn, winter}; 
也就是说spring的值为0，summer的值为1，autumn的值为2，winter的值为3
3.也可以在定义枚举类型时改变枚举元素的值
enum season {spring, summer=3, autumn, winter};
没有指定值的枚举元素，其值为前一元素加1。也就说spring的值为0，summer的值为3，autumn的值为4，winter的值为5

枚举变量的基本操作：
1.赋值：
enum Season {spring, summer, autumn, winter} s;
s = spring; // 等价于 s = 0;
s = 3; // 等价于 s = winter;
2.遍历：
enum Season {spring, summer, autumn, winter} s;
// 遍历枚举元素
for (s = spring; s <= winter; s++) {
    printf("枚举元素：%d \n", s);
}




宏定义：
// C语言提供的预处理指令主要有：宏定义、文件包含、条件编译
// 预处理指令可以出现在程序的任何位置，它的作用范围是从它出现的位置到文件尾。习惯桑写在程序的开头
一般形式：
#define 宏名 字符串
比如#define ABC 10
注意宏跟常量的区别：
#define A 3       //会把全文中所有的a替换为3
const int A = 3;  //会把a常量的值赋值为3


#include <stdio.h>
// 源程序中所有的宏名PI在编译预处理的时候都会被3.14所代替
#define PI 3.14
// 根据圆的半径计radius算周长
float girth(float radius) {
    return 2 * PI *radius;
}
int main ()
{
    float g = girth(2);
    
    printf("周长为：%f \n", g);
    return 0;
}


note:
1.宏名一般用大写字母，以便与变量名区别开来，但用小写也没有语法错误
2.对程序中用双引号扩起来的字符串内的字符，不进行宏的替换操作。比如：
#include <stdio.h>
#define R 10
int main ()
{
    char *s = "Radio";
    printf("%s\n", s);
}
3.如果需要终止宏定义的作用域，可以用#undef命令
#define PI 3.14
/*
.
.
.
*/
#undef PI
4.定义一个宏时可以引用已经定义的宏名


带参数的宏定义
#define 宏名(参数列表) 字符串
#include <stdio.h>
#define average(a, b) (a+b)/2    //感觉宏又有点像函数,average跟参数之间不能有空格,否则编译不过
int main ()
{
    int a = average(10, 4);
    
    printf("平均值：%d \n", a);
    return 0;
}

note:
1.宏名和参数列表之间不能有空格，否则空格后面的所有字符串都作为替换的字符串，导致编译不过
2.宏后面的参数一般需要用括号括起来，即使是一个参数,如下：

#include <stdio.h> 
#define D(a) 2*(a) // 括起来
int main ()
{
    int b = D(3+4);  //2*(3*4)
    
    printf("%d \n", b);
    return 0;
}
#include <stdio.h> 
#define D(a) 2*a // 不括起来
int main ()
{
    int b = D(3+4);  //2*3+4
    
    printf("%d \n", b);
    return 0;
}

3.计算结果最好也用括号括起来
#include <stdio.h>
#define Pow(a) (a) * (a)  //平方的结果没有括起来
int main(int argc, const char * argv[]) {
    int b = Pow(10) / Pow(2);   //(10) * (10) / (2) * (2)=100
    printf("%d\n", b);
    return 0;
}

#include <stdio.h>
#define Pow(a) ((a) * (a))  //平方的结果括起来
int main(int argc, const char * argv[]) {
    int b = Pow(10) / Pow(2);   //((10) * (10)) / ((2) * (2))=25
    printf("%d\n", b);
    return 0;
}


宏与函数的区别：
1.宏定义不涉及存储空间的分配、参数类型匹配、参数传递、返回值问题
2.函数调用在程序运行时执行，而宏替换只在编译预处理阶段进行。所以带参数的宏比函数具有更高的执行效率



条件编译：

#if 条件1
 ...code1...
#elif 条件2
 ...code2...
#else
 ...code3...
#endif   //需要写endif

举个栗子：
#include <stdio.h>
#define MAX 11

int main ()
{
#if MAX == 0
    printf("MAX是0");
#elif MAX > 0
    printf("MAX大于0");  //因为max=11,所以这句会被编译到代码里面去
#else
    printf("MAX小于0");
#endif
    return 0;
}

其他用法：
#if defined(MAX) //如果前面定义过这个宏，则编译code
    ...code...
#endif

#if !defined(MAX) //如果没定义过这个宏，则编译code
    ...code...
#endif

#ifdef MAX   //和#if defined()的用法基本一致
    ...code...
#endif

#ifndef MAX  //和#if !defined()的用法基本一致致
    ...code...
#endif



预处理#include.h

1.#include指令允许嵌套包含，比如a.h包含b.h，b.h包含c.h，但是不允许递归包含，比如 a.h 包含 b.h，b.h 包含 a.h。
2.为了解决重复编译，导致程序变慢的问题：需要在每个xx.h文件中写上：
#ifndef _ONE_H_  //如果没有被定义one.h文件，则定义one.h
#define _ONE_H_
#endif

如下栗子：
#include "one.h"
#ifndef _ONE_H_
#define _ONE_H_

void one();
#endif

// #include "two.h"
#ifndef _TWO_H_
#define _TWO_H_

// #include "one.h"
#ifndef _ONE_H_
#define _ONE_H_

void one();
#endif

void two();
#endif

// 编译后就只有两个声明，就不会有重复的声明：
void one();
void two();


外部函数：
如果在当前文件中定义的函数允许其他文件访问、调用，就称为外部函数。
C语言规定，不允许有同名的外部函数。

内部函数：
如果在当前文件中定义的函数不允许其他文件访问、调用，只能在内部使用，就称为内部函数。
C语言规定不同的源文件可以有同名的内部函数，并且互不干扰。


栗子：
在main.c中调用one.c中定义的one函数
main.c如下：
#include <stdio.h>  //include的意思相当于拷贝
#include "one.h"  //引用one.h文件，这儿.h文件是头文件的意思，是否跟one.c不一致？
int.int main(int argc, char const *argv[])
{
    void one();
    return 0;
}

one.h如下：
#include <stdio.h>
void one() //void前面省略了extern， 因为函数默认可以被外部调用
{
    printf("调用了one函数\n");
    return 0;
}


栗子：内部函数
#include <stdio.h> 
static void test();  //加上static，针对于内部函数使用，函数外部无法调用
int main(int argc, const char * argv[])
{
    test();
    return 0;
}

static void test() {
    printf("调用了test函数");
}

Note:
所谓编译，就是单独检查每个源文件的语法是否合理，并不会检查每个源文件之间的关联关系，一个源文件编译成功就生成一个目标文件。
所谓链接，就是检查目标文件的关联关系，将相关联的目标文件组合在一起，生成可执行文件。
定义和声明完全是两码事



全局变量：

// java中，可以调用在后面定义的变量：
public class Test(){
    public void test(){
        a=10;  //可以调用后面的a
    }
    int a;
}

// 然而在c语言中如此调用编译会报错，一般有两种解决方法：
1.把int a 在调用之前定义
int a;
int main(){
    a=10
    return 0;
}
2.在函数前面进行声明,需要用关键字extern
extern int a;  // 声明，这儿的extern声明，表示可以用自己文件内的全局变量，或者其他源文件的变量；
int main(){
    a=10;
    return 0; 
}
int a;  // 定义,定义的位置可以随便定


// 注意区别下面两个程序：
int a;
int main(){
    extern int a;  //这儿有extern,这其中的几个a都是全局变量
    a=10;
    return 0;
}
int a;  //可以重复定义a的值


int a;
int main(){
    int a;  //如果去掉了extern,那么这个花括号里面的a都是局部变量了，外面两个为全局变量
    a=10;
    return 0;
}
int a;  //可以重复定义a的值


note:
// 假如在另一个源文件中也有全局变量int a;，那么这两个源文件的所有全局变量int a;都代表着同一个变量。
// 如果不想其他源文件共享，相当于私有的全局变量，那么就得用static关键字来定义变量   static int a;
// extern是用来声明已经定义过而且能够访问的变量，如果外部文件变量私有化了，就不用能用  extern int a; 
// extern可以用来声明一个全局变量，但是不能用来定义变量；


类型别名： typedef

// 一般用法：
#include <stdio.h> 
typedef int Integer;  //int别名
typedef unsigned int UInterger; //unsinged int
typedef float Float; //float
int main(int argc, const char * argv[]) {
    Integer i = -10;
    UInterger ui = 11;   
    Float f = 12.39f;    
    printf("%d  %d  %.2f", i, ui, f);
    
    return 0;
}

// * 也可以在别名的基础上再起一个别名
typedef int Integer;
typedef Integer MyInteger;


typedef与指针：
#include <stdio.h>
typedef char *String;   // 给指针类型char *起别名为String
int main(int argc, const char * argv[]) {
    String str = "This is a string!";   // 相当于char *str = "This is a string!";
    printf("%s", str);   
    return 0;
}

typedef结构体：

// 以前结构体的写法
struct MyPoint { // 定义一个结构体
    float x;
    float y;
};
int main(int argc, const char * argv[]) {
    // 定义结构体变量
    struct MyPoint p;
    p.x = 10.0f;
    p.y = 20.0f;
    
    return 0;
}

// 用别名的结构体的写法
struct MyPoint { // 定义一个结构体
    float x;
    float y;
};
// 起别名
typedef struct MyPoint Point;   //方法一
int main(int argc, const char * argv[]) {
    // 定义结构体变量
    Point p;
    p.x = 10.0f;
    p.y = 20.0f;    
    return 0;
}

// 结构体取别名可以在定义的步骤就开始：
typedef struct MyPoint { //方法二
    float x;
    float y;
} Point;

typedef struct {  //方法三
    float x;
    float y;
} Point;


typedef与结构指针：

#include <stdio.h>
typedef struct {
    float x;
    float y;
} Point;  // 定义一个结构体并起别名

typedef Point *PP;  // 起别名，指向结构体的指针定义了别名PP
int main(int argc, const char * argv[]) {
    // 定义结构体变量
    Point point = {10, 20};   
    // 定义指针变量
    PP p = &point;    
    // 利用指针变量访问结构体成员
    printf("x=%f，y=%f", p->x, p->y); //x=10.000000，y=20.000000 
    return 0;
}


typedef与枚举类型：


// 定义枚举类型的第一种方式：
enum Season {spring, summer, autumn, winter};
// 给枚举类型起别名
typedef enum Season Season;
// 定义枚举类型的第二种方式：
// typedef enum Season {spring, summer, autumn, winter} Season
// 定义的第三种方式：
// typedef enum {spring, summer, autumn, winter} Season;
int main(int argc, const char * argv[]) {
    // 定义枚举变量
    Season s = spring; 
    printf("%u\n", s); //这里的s为unsigned int类型  
    return 0;
}


typedef与函数指针：

#include <stdio.h>
 // 定义一个sum函数，计算a跟b的和
 int sum(int a, int b) {
     int c = a + b;
     printf("%d + %d = %d", a, b, c);
     return c;
 } 
 int main(int argc, const char * argv[]) {
     int (*p)(int, int) = sum;       // 定义一个指向sum函数的指针变量p
     // 利用指针变量p调用sum函数
     (*p)(4, 5); //9
     
     return 0;
 }

//另外一种写法：
#include <stdio.h>
 // 定义一个sum函数，计算a跟b的和
 int sum(int a, int b) {
     int c = a + b;
     printf("%d + %d = %d", a, b, c);
     return c;
 } 
 typedef int (*MySum)(int, int);//给指向函数的指针类型，起了个别名叫MySum，被指向的函数接收2个int类型的参数，返回值为int类型。
 int main(int argc, const char * argv[]) {
     // 定义一个指向sum函数的指针变量p
     MySum p = sum;
     // 利用指针变量p调用sum函数
     (*p)(4, 5);
     
     return 0;
 }


typedef与#define

typedef char *String1; //char *起了个别名String1

#define String2 char * //定义了宏String2

int main(int argc, const char * argv[]) {
    String1 str1, str2;  //定义了两个指向char类型的指针    
    String2 str3, str4;  //char *替换了Sting2的字段
    return 0;
}

// 结果：只有str1、str2、str3才是指向char类型的指针变量，str4只是个char类型的变量。
Note:
以后给类型起别名，最好使用typedef，而不是使用#define
