//: [Previous](@previous)
//: [Next](@next)


 // 在类型后面加一个问号，定义一个可选项
 // 可选项初始化默认值为nil, 也可以赋值为nil
 var name: String? = "Jack"
 name = nil

 var age: Int? // 默认nil
 age = 10
 age = nil

 var array = [1, 15,40, 29]
 func get(_ index: Int) -> Int? {
     if index < 0 || index >= array.count {
         return nil
     }
     return array[index]
 }
// print(get(1))
// print(get(-1))
// 后面为一个default value
 print(get(-4) ?? 3)

 


 // 解包：
 // 取出被包装的数据，解包用!
 var age1: Int? = 10
 var ageInt: Int = age1!
 ageInt += 10
 
 // 对nil 的可选项解包会产生运行时错误
 // Fatal error: Unexpectedly found nil while unwrapping an Optional value
 // var age: Int?
 // age!

 // 隐式解包,类型后面加！，可以避免每次都要去解包
 let num1: Int! = 10
 let num2: Int! = num1
 
 let num3: Int! = nil
 //Fatal error: Unexpectedly found nil while .....
 


 let number = Int("kk123") // 这里number是可选类型，可以通过编译器提示查看
 if number != nil {
    // print("转换成功：\(number)")
    // 可选项用下面这个转换为字符串
    print("转换成功：\(String(describing: number))")
 } else {
     print("转换失败")
 }
 


 // 可选值绑定
 // 自动绑定，有值则赋值，并返回true. 无值则返回false
 if let number = Int("123") {
     print("转换成功：\(number)")
 } else {
     print("转换失败")
 }

 enum Season: Int {
     case spring = 1, summer, autumn, winter
 }

 if let season = Season(rawValue: 4) {
     switch season {
     case .spring:
         print("spring")
     case .winter:
         print("winter")
     default:
         print("other")
     }
 } else {
     print("no such reason")
 }
 
 
 //  可以用逗号来表达且的关系, 下面两种写法等价：
 if let first = Int("4") {
     if let second = Int("42") {
         if first < second && second < 100 {
             print("\(first) < \(second) < 100")
         }
     }
 }

 if let first = Int("4"), let second = Int("42"), first < second && second < 100 {
     print("\(first) < \(second) < 100")
 }
 

 // 可选项绑定用于在数组中：
 var strs = ["10", "20", "adb", "-20", "30"]
 var index = 0
 var sum = 0
 while let num = Int(strs[index]), num > 0 {
     sum += num
     index += 1
 }
 print(sum)
 



// 空合并运算
/*
 a ?? b
 a是可选项，b可以是或者不是可选项
 a,b 存储类型相同
 
 最终结果:类型，取决于b, 值取决于a是否为nil
*/
 let a: Int? = 1
 let b: Int? = 2
 let c = a ?? b  // Int?, Optional(1)
 
 let a1: Int? = nil
 let b1: Int? = 2
 let c1 = a1 ?? b1 // Int?, Optional(2)
 
 let a2: Int? = nil
 let b2: Int? = nil
 let c2 = a1 ?? b1 // Int?, nil
 
 let a3: Int? = 1
 let b3: Int = 2
 let c3 = a1 ?? b1 // Int, 1

 let a4: Int? = nil
 let b4: Int = 2
 let c4 = a1 ?? b1 // Int, 2


// ？？跟if let配合使用
// 类似 if a != nil || b != nil
 let a5: Int? = nil
 let b5: Int? = 2
 if let c = a5 ?? b5 {
    print(c)
 }
 
// 类似if a != nil && b != nil
 if let c = a, let d = b {
    print(c)
    print(d)
 }

 

/*
 guard语句：
 guard 条件 else {
    // do something
    // return, break, continue, throw error
 }
 1.guard条件为false时，就会执行大括号里面的代码，为true的时候，跳过guard语句
 2.特别适合做“提前退出”
 3.guard括号里的的常量，变量也能在外层作用域中使用
 */



/*
 字符串插值, 可选项输出
 */
var age3: Int? = 10
//print("age is \(age)")// 会报错
// 下面三种都可以解决报错的问题
print("age is \(age3!)")
print("age is \(String(describing: age3))")
print("age is \(age3 ?? 0)")



// 多重可选项

// 可以使用用lldb指令frame variable -R或者 fr v -R查看区别
/*
 var num1: Int? = 10
 var num2: Int?? = num1
 var num3: Int?? = 10
 print(num2 == num3) // true
 */



var num4: Int? = nil
var num5: Int?? = num4
var num6: Int?? = nil
print(num5 == num6) // false
(num5 ?? 1) ?? 2  // 2
(num6 ?? 1) ?? 2  //1

