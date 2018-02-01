
/************************************************.01*/
 // 1. 代码块的作用？？？


#include <stdio.h>
int main()
{
    int a = 20;
    int score = a + 100;
    printf("%d\n", score); //120
    
    {
        int score = 50; // 定义的只作用于代码块
        {
            score = 10;
            printf("%d\n", score);//10
        }
        a = 10;
    }
    printf("%d\n", a); //10
    printf("%d\n", score); //120
    {
        score = a + 250;
        // printf("%d\n", a); //10   -----------? 这儿是因为上面代码块对a重新赋值了；
        // printf("%d", score); //260
        int score = 30;
        printf("%d\n", score); //30
    }
    printf("%d\n", score); //260              // ----------------  这看不懂，为啥不是120？
    return 0;
}
/*
 结果：
 120
 10
 120
 30
 260
 */


// 全局变量：a、b、c
// 局部变量：v1、v2、e、f

#include <stdio.h>
// 变量a的初值是10
int a = 10;

// 变量b的初值是0
// 变量c的初值是20
int b , c = 20;

int sum(int v1, int v2)
{
    return v1 + v2;
}

void test()
{
    b++; //1
    
    int i = 0;
    i++; //1
    
    printf("b=%d, i=%d\n", b, i);
}

int main()
{
    test();  //1,1
    test();  //2,1
    test();  //3,1
    printf("%d\n",sum(b, c)); //23
    int e = 10;
    
    {
        {
            int f = 30;
        }
    }
    
    return 0;
}

/************************************************.02*/
// 2.自增和自减，？？

// NO2.
#include <stdio.h>
int main()
{
    int x = 1,y = 1;
    if(x++==2 && ++y==2) { //0 && 1
        x =7;            //这里if没有执行完，所以y值还停留在1
    }
    printf("x=%d, y=%d\n", x, y); //2,1
    return 0;
}


// NO.3
#include <stdio.h>
int main()
{
    int x = 1,y = 1;
    if(x++==2 || ++y==2) {  0||1
        x =7;               //这里执行了if,所以y就变成了2了
    }
    printf("x=%d, y=%d\n", x, y); //7,2
    return 0;
}


/************************************************.03*/


// 二进制形式输出：

#include <stdio.h>
int main()
{
    void putBinary(int);
    
    putBinary(-12);
    
    putBinary(13);
return 0;
}
// 输出一个整数的二进制存储形式
void putBinary(int n)
{
    int bits = sizeof(n) * 8;              // ----------------  这看不懂
    while (bits-->0) {
        printf("%d", n>>bits&1);
        if (bits%4==0) printf(" ");
    }
    printf("\n");
}

/*
1111 1111 1111 1111 1111 1111 1111 0100 
0000 0000 0000 0000 0000 0000 0000 1101 
*/


/************************************************.04*/

// 二进制形式输出：

/*
写一个函数，用来输出整数在内存中的二进制形式
*/
#include <stdio.h>
void printBinary(int number);
int main()
{
    /*
     0000 0000 0000 0000 0000 0000 0000 0000
     0000 0000 0000 0000 0000 0000 0000 1111
     
     9 : 0000 0000 0000 0000 0000 0000 0000 1001
     -10 : 1111 1111 1111 1111 1111 1111 1111 0110
     */
    
    
    //printf("%d\n", ~9);
    
    
    printBinary(-10);
    return 0;
}
void printBinary(int number)
{
    
    // 记录现在挪到第几位
    // (sizeof(number)*8) - 1 == 31
    int temp = ( sizeof(number)<<3 ) - 1;              // ----------------  这看不懂
    
    while ( temp >= 0 )
    {
        // 先挪位，再&1，取出对应位的值
        int value = (number>>temp) & 1;
        printf("%d", value);
        
        // 
        temp--;
        
        // 每输出4位，就输出一个空格
        if ( (temp + 1) % 4 == 0 )
        {
            printf(" ");
        }
    }
    
    printf("\n");
}

/************************************************.05*/

/*
编写一个函数char_contains(char str[],char c)，
 如果字符串str中包含字符c则返回数值1，否则返回数值0
*/

#include <string.h>
#include <stdio.h>

// 可读性 -> 性能 -> 精简（重构）

int char_contains(char str[], char c);

int main()
{
    //int result = char_contains("itc8ast", '8');
    
    char name[] = "itcast";
    
    int result = char_contains(name, 'o');
    
    printf("%d\n", result);
    return 0;
}

// "itc"  '7'
int char_contains(char str[], char c)
{
    int i = -1;
    
    /*
     i  3
     str[++i] 'c'
     c  '7'
     */
    
    // 1.遍历整个字符串
    while ( str[++i] != c && str[i] != '\0' ) ;
    
    //return str[i] == '\0' ? 0 : 1;                 // ----------------  这看不懂
    return str[i] != '\0';
}

/*
int char_contains(char str[], char c)
{
    int i = -1;
    
    // 1.遍历整个字符串
    while ( str[++i] )
    {
        // 如果发现某个字符等于参数c，直接返回1，退出函数
        if (str[i] == c)
        {
            return 1;
        }
    }
    
    // 2.说明str里面不包含字符c
    return 0;
}*/

/*
int char_contains(char str[], char c)
{
    int i = 0;
    
    // 1.遍历整个字符串
    while ( str[i] != '\0' )
    {
        // 如果发现某个字符等于参数c，直接返回1，退出函数
        if (str[i] == c)
        {
            return 1;
        }
        
        i++;
    }
    
    // 2.说明str里面不包含字符c
    return 0;
}*/

/*
// 对自己来说，最常用的应该是这一种；
int char_contains(char str[], char c)
{
    // 1.遍历整个字符串
    for (int i = 0; i<strlen(str); i++)
    {
        // 如果发现某个字符等于参数c，直接返回1，退出函数
        if ( str[i] == c )
        {
            return 1;
        }
    }
    
    // 2.说明str里面不包含字符c
    return 0;
}*/

/************************************************.06*/

#include <stdio.h>
void change(int array[]);
int main()
{
    // 20个字节
    int ages[5] = {10, 11, 19, 78, 67};
    
    change(ages);
    
    return 0;
}

// 利用一个指针来接收一个数组，指针变量array指向了数组的首元素
void change(int *array)
{
    printf("%d\n", array[2]);
    printf("%d\n", *(array+2));  //这两个输出的都是19
}

/*
--为什么这儿返回的是2，如果在main函数中直接运用返回的是5？            // ----------------  这看不懂
void change(int array[])
{
    int s = sizeof(array);
    
    printf("%d\n", s);
}*/

void test()
{
    double d = 10.8;
    double *dp;
    dp = &d;
    
    printf("dp = %p\n", dp);
    printf("dp + 1 = %p\n", dp + 1);
    
    int ages[5] = {10, 9, 8, 67, 56};
    
    int *p;
    // 指针变量p指向了数组的首元素
    p = &ages[0];
    // 数组名就是数组的地址，也是数组首元素的地址
    //p = ages;
    
    /*
     p ---> &ages[0]
     p + 1 ---> &ages[1]
     p + 2 ---> &ages[2]
     p + i ---> &ages[i]
     */
    
    //printf("%d\n",  *(p+2));
    
    printf("%d\n",  p[2]);
    
    /*
     for (int i = 0; i<5; i++) {
     printf("ages[%d] = %d\n", i, *(p+i));
     }*/
    
    
    //    printf("%p\n", p);
    //    printf("%p\n", p + 1);
    //    printf("%p\n", p + 2);
}

/************************************************.07*/
#include <stdio.h>
/*
 (不包括\0)
 编写一个int string_len(char *s)，返回字符串s的字符长度
 
 */
int string_len(char *s);

int main()
{
    //char *name = "itcast";
    
   // 男 \u434\u4343\u434
    
    int size = string_len("tre777");
    
    printf("%d\n", size);
    return 0;
}

int string_len(char *s)
{
    // 1.定义一个新的指针变量指向首字符
    char *p = s;
    
    /*
    while ( *s != '\0' )
    {
        s++;
    }*/
    
    while ( *s++ ) ; 
    
    return s - p - 1;                // ----------------  这看不懂
}

/*
int string_len(char *s)
{
    // 记录字符的个数
    int count = 0;
    
    // 如果指针当前指向的字符不是'\0'
    // 首先*s取出指向的字符
    // 然后s++
    while ( *s++ )
    {
        // 个数+1
        count++;
        
        // 让指针指向下一个字符
        //s = s + 1;
        //s++;
    }
    
    return count;
}
*/

/*
int string_len(char *s)
{
    // 记录字符的个数
    int count = 0;
    
    // 如果指针当前指向的字符不是'\0'
    while ( *s != '\0')
    {
        // 个数+1
        count++;
        
        // 让指针指向下一个字符
        //s = s + 1;
        s++;
    }
    
    return count;
}*/

/************************************************.08*/

// 全局变量：a、b、c
// 局部变量：v1、v2、e、f

#include <stdio.h>
// 变量a的初值是10
int a = 10;

// 变量b的初值是0
// 变量c的初值是20
int b , c = 20;


int sum(int v1, int v2)
{
    return v1 + v2;
}

void test()
{
    b++; 
    
    int i = 0;
    i++;
    
    printf("b=%d, i=%d\n", b, i);
}

int main()
{
    test();
    test();
    test();               // ----------------  这看不懂
    
    int e = 10;
    
    {
        {
            int f = 30;
        }
    }
    
    return 0;
}

/*
b=1, i=1
b=2, i=1
b=3, i=1   // 这里b不是全局变量么，怎么值改变了？
*/
