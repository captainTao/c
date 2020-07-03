//: [Previous](@previous)

 // 初始化空的数组/字典
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//shoppingList = []
//occupations = [:]

 // 取数组元素：
 
 // i默认为let类型，如果需要更改，则需要在变量i前面加上var
 let numbers = [1, 2, 3, 4]
 for i in numbers{
     print(i)
 }
 
 //如果不需要用i值，则用下划线代替
 for _ in numbers{
    print("hello, world!")
 }

 // 可以通过下标来取值, 最后一个元素后面允许有逗号
 var names = ["Tony", "Jack", "Sparrow", "QiQi", "Jony"]
 for name in names[0...3]{
     print(name)
 }

 // 0...3    [0,3]
 // 0..<3    [0,3)
 // 单侧区间，一边可以理解为无穷大
 for name in names[...2]{
     print(name)
 }
 for name in names[..<2]{
     print(name)
 }
 for name in names[2...]{
     print(name)
 }
 
 // 添加
 names.append("blue paint")


 // 数组步长,类似切片
 for tickMark in stride(from: 3, through: 11, by: 2){
     print(tickMark) // 3...11
 }

 for e in stride(from: 3, to: 11, by: 2){
     print(e) // 3...9
 }


 // for中用where来过滤数组
 let numbers2 = [10, 20, 30, -10, 50, -30]
 var sum = 0
 for num in numbers2 where num > 0 {
     sum += num
 }
 print(sum)
 
 /*
 // 对于字符的可选类型，条件转换可以用逗号

 // 可选项绑定用于在数组中，逗号理解为且
 let numbers2 = ["10", "20", "30", "-10", "50", "-kk30"]
 var sum = 0
 var index = 0
 while let num = Int(numbers2[index]), num > 0 {
     sum += num
     index += 1
 }
 print(sum)
 */


 // 标签语句
 outer: for i in 1...4 {
     for k in 1...4 {
         if k == 3 {
             continue outer
         }
         if i == 3 {
             break outer
         }
         print("i = \(i), k = \(k)")
     }
 }
 
 
 // 字典为无序
 let dict = ["a": 1, "b": 2, "c": 3]
 for (key, value) in dict {
     print(key + "===" , value)
     print("\(key) = \(value)")
 }

 
  // 数组和元组
 let num = [1,2,3]
 var namess = ["i","j"]
 let dic = ["one":1, "two":2]

  let t = (1,3,5)
  t.0  // 通过.取值
  t.1
 
 

// 求出一个二级字典中的最大值，字典是无序的
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//: [Next](@next)
