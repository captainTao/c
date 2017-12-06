#include <stdio.h>

int main(int argc, char const *argv[])
{
enum Season {spring, summer, autumn, winter} s;
// 遍历枚举元素
for (s = spring; s <= winter; s++) {
    printf("枚举元素：%d \n", s);
}
	return 0;
}
