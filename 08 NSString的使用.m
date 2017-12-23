/*

NSString常用创建初始化方法

1、NSString *string0 = @"string";

2、NSString *string1 = [NSString stringWithFormat:@"it is %@",@"string"];

3、char *c = "string";

    NSString *string2 = [[NSString alloc] initWithCString:c encoding:nil];

4、const char *utf8 = "utf";

    NSString *string3 = [NSString  stringWithUTF8String:utf8];
*/

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //char *_name;
    NSString *_name;
}
@end

int main()
{
    /*
    // 最简单的创建字符串的方式
    NSString *str = @"itcast";
    
    char *name = "itcast";
    
    
    NSLog(@"我在%@上课", str);
    //NSLog(@"%s", name);
    */
    
    int age = 15;
    int no = 5;
    NSString *name = @"哈哈jack";
    // length方法算的是字数
    int size = [name length]; //计算字数，包括中文字数，与传统意义上的length不一样,传统一个汉字的长度为3，在这里为1；
    
    NSLog(@"%d", size);
    
    // 创建OC字符串的另一种方式
    NSString *newStr = [NSString stringWithFormat:@"My age is %d and no is %d and name is %@", age, no, name];
    
    
    NSLog(@"---- %ld", [newStr length]);
    
    return 0;
}