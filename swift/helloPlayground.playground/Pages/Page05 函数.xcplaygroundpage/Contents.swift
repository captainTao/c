//: [Previous](@previous)
//: [Next](@next)

/*
  函数：

 1.可以隐式返回
 2.支持可变参数，参数默认值，参数标签，
 3.函数类型
 4.Inout参数
 */


// 形参默认是let,也只能是let
// 无参，无返回
func hello() {
    print("hello,HH")
}
hello()
// 有参，无返回
func helloSB(person: String) {
    print("hello,\(person)")
}
helloSB(person: "Captain")

// 有参，有返回
func Greeting(person: String, isGreeted: Bool) -> String{
    return !isGreeted ? "hello,\(person)!" : "\(person) has gretted!"
}
print(Greeting(person: "Captain", isGreeted: true))
print(Greeting(person: "Lemon", isGreeted: false))


// 多参，多返回
func mult(a: Int, b: Int) -> (product: Int, sum: Int){
    return (a * b, a + b)
}
print(mult(a: 3, b: 4))
let result = mult(a: 3, b: 4)
print(result.product) // 通过.来取值
print(result.sum)

 

// 函数隐式返回：
// 函数体内只有一个单一的表达式，那么这个函数会隐式返回,可以不用写return
func summ(v1: Int, v2: Int) -> Int {
    v1 + v2
}
summ(v1: 10, v2: 20)
 

// 函数的参数标签
func Greet(name person: String, from place: String) -> String{
    return "hello,\(person) from \(place)!"
}
print(Greet(name: "SongLi", from: "YiBing"))

// 用 _可以省略输入函数标签name，from, 开发过程中经常省略第一个标签

 
// 参数可以设置默认值
// c++默认参数必须从右边往左边写，不能跳过，但swift允许
func Greeta(_ person: String, _ place: String = "China") -> String{
    return "hello, \(person) from \(place)!"
}
print(Greeta("Avatar", "360"))
print(Greeta("QiQi"))

  
// 非固定参数,一个函数只能有一个可变参数
 func sumof(numbers: Int...) -> Int {
     var sum = 0
     for number in numbers{
         sum += number
     }
     return sum
 }
 print(sumof(numbers: 42, 597, 12))
 print(sumof())


 // 紧跟在可变参数后面的参数不能省略标签
 func test(_ numbers: Int..., string: String, _ other: String){}
 test(3, 4, 5, string: "test", "other")
 


// 函数类型：
 func sum(a: Int, b:Int) -> Int {
    a + b
 }   // (Int, Int) -> Int
 
// 定义变量为函数类型
 var fn: (Int, Int) -> Int = sum
 fn(2, 3) //5 调用时不需要参数标签
 
// 函数作为参数，同样需要传入函数类型
func Sum(a:Double, b:Double) -> Double{
    return a + b
}

func Product(a:Double, b:Double) ->Double{
    return a * b
}

func MathFunc(_ Fun: (Double, Double) -> Double, figureOne a: Double, figureTwo b: Double) -> String{
    return "Result = \(Fun(a, b))"
}

print(MathFunc(Sum(a:b:), figureOne: 3.4, figureTwo: 5.2))
print(MathFunc(Sum, figureOne: 3.4, figureTwo: 5.2)) // 或者直接输入函数名即可
print(MathFunc(Product(a:b:), figureOne: 3.2, figureTwo: 2.5))
// 上面这个函数也可以写成嵌套逻辑

 
// 函数作为返回类型
let value = 3
func forward(_ value: Int) -> Int {
    return value + 1
}

func backforward(_ value: Int) -> Int {
    return value - 1
}

func chooseFunc(_ value: Int) -> (Int) -> Int {
    return value > 0 ? forward : backforward
}

let Function = chooseFunc(4)
print(Function(4))
print(chooseFunc(3)(-2)) //选择函数然后计算

 
 // 输入输出参数：
 // inout参数：可以在函数内部更改函数外面的值，本质是引用传递
 // 可变参数不能标记为inout
 // inout参数不能有默认值
 // inout参数不能是常量，字面量，需要是变量，可以被多次赋值
 var number = 10
 func change(number: inout Int) {
     number = 20
 }
 change(number: &number)
 print(number) // 20
 

 // 交换系统默认有swap()
 var a = 1
 var b = 2
 (b, a) = (a, b)
 print(a, b)



/*
函数重载function overload
规则：
1.函数名相同
2.参数个数不同||参数类型不同||参数标签不同
Note:
默认参数和函数重载一起使用时候，编译器不会报错，（c++会报错）
可变参数，省略参数标签，函数重载一起使用时，编译器可能会报错
*/


/*
内联函数inline-function
定义:开启了编译优化，会将某些函数转换为内联函数
build setting中：debug是没有优化的，release有，想当于把函数调用变成了函数体

哪些不会被内联？
1.函数体比较长的时候
2.函数中包含递归
3.函数中有动态下发
 
在releae模式下，编译器已经开启优化，会自动决定谁需要内联，所以没必要使用 @inline
*/

// 永远不会被内联，即使开启了编译器优化
@inline(never) func test(){
    print("test")
}

// 一直会被内联
@inline(__always) func test1(){
    print("test")
}
