//: [Previous](@previous)

 // 初始化空的数组/字典
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// 初始化
let array = [Int](arrayLiteral: 1,2,4,5)
for i in array{
    print(i)
}

// 初始化相同的元素：
var list = Array (repeating: 3.0, count: 4)
var anotherList = Array(repeating: 2.5, count: 3)
// 数组可以直接相加来添加元素
print(list + anotherList)
// 数组的长度.count
// .isEmpty来判断是否为空

// 初始化时候字面量标明类型：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)

// 通过for..in来遍历数组和字典

// shoppingList = []
// occupations = [:]

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

// 通过enumerated()来遍历
for (index, value) in list.enumerated() {
   print("list[\(index)] = \(value)")
}

 // 可以通过下标来取值, 最后一个元素后面允许有逗号
 var names = ["Tony", "Jack", "Sparrow", "QiQi", "Jony"]
 for name in names[0...3]{ // for name in names{..}
     print(name)
 }

 for name in names{ // 遍历所有
     print(name)
 }

 // 0...3    [0,3]
 // 0..<3    [0,3)
 // 单侧区间，一边可以理解为无穷大
 for name in names[...2]{  // 括号可以理解为python的切片
     print(name)
 }
 for name in names[..<2]{
     print(name)
 }
 for name in names[2...]{
     print(name)
 }


 // 单侧区间也可以用来赋值
 let range = ...5
 range.contains(7)   // false
 range.contains(4)   // true
 range.contains(-1)  // true


 // 添加
 names.append("blue paint")

// names.insert(ele, at index)

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
 

 
 // 对于字符的可选类型，条件转换可以用逗号

 // 可选项绑定用于在数组中，逗号理解为且
 let numbers3 = ["10", "20", "30", "-10", "50", "-kk30"]
 var sum3 = 0
 var index = 0
 while let num = Int(numbers3[index]), num > 0 {
     sum3 += num
     index += 1
 }
 print(sum3) // 当解包为负数的时候，中断了
 


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
 
 
/*
  使用自定义的类型作为集合值的类型或者是字典键的类型，需要遵循Hashable协议
  一个字典的 Key 类型必须遵循 Hashable 协议，就像Set的值类型。
*/



// 集合Set:
// --与数组的区别是：没有重复的数据
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = []
// letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] // 也可以通过字面量来推断


/*
set.insert("xx")
set.count
set.isEmpty
set.contains
set.remove
for..in 遍历
set.sorted


交，a.intersection(b)
并，a.union(b)
对称差分，a.symmetricDifference(b)
减去， a.subtracting(b)


==                 两个集合的元素是否相等

.isSubset(of:)     为子集
.isSuperset(of:)   为父集

.isStrictSubset(of:)       为子集且不相等
.isStrictSuperset(of:)     为父集且不相等

.isDisjoint(with:)   是否没有交集

*/


// []可以创建数组和字典，最后一个元素后面都允许有个逗号，
let num = [1,2,3]
var namess = ["i","j"]
let dic = ["one":1, "two":2]


// 创建为空字典：
var namesOfIntegers = [Int: String]()


// 字典为无序
 let dict = ["a": 1, "b": 2, "c": 3]
 for (key, value) in dict {
     print(key + "===" , value)
     print("\(key) = \(value)")
 }


/*
字典方法
.isEmpty()
.count

设置value：
dict[key] = value   // 返回value
dict.updateValue(Value, forKey: key) // 返回旧值，如果没有旧值返回nil

移除
dict[key] = nil
dict.removeValue(forKey: key) // 返回value/nil

dict.keys
dict.values
*/


// 元组数据可以为不同类型
let http404Error = (404, "Not Found")
// 忽略的部分用下划线
let (justTheStatusCode, _) = http404Error
print("justTheStatusCode：\(justTheStatusCode)")

let t = (1,3,5)
t.0  // 通过.取值
t.1

// 你可以在定义元组的时候给单个元素命名,可以用名字来取值
let http200Status = (statusCode: 200, description: "OK") // 字典用的是[]
http200Status.description


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
