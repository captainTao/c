
/************************************************.01*/
 // 1. 代码块的作用？？？

#include <stdio.h>
int main()
{
    int a = 20;
    int score = a + 100;
    printf("%d\n", score); //120
    
    {
        int score = 50;
        {
            score = 10;
            printf("%d\n", score);//10
        }
        a = 10;
    }
    
    {
        score = a + 250;
        // printf("%d\n", a); //10
        // printf("%d", score); //260
        int score = 30;
        printf("%d", score); //30
    }
    
    printf("%d\n", score); //260
    return 0;
}
/*
结果：
120
10
30260
*/

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
    int bits = sizeof(n) * 8;
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
    int temp = ( sizeof(number)<<3 ) - 1;
    
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
    
    //return str[i] == '\0' ? 0 : 1;   // 这一句不懂
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