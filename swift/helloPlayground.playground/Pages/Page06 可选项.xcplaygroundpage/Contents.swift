//: [Previous](@previous)
//: [Next](@next)

/*
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
 print(get(1))
 print(get(-1))
 print(get(-4))

 
 // 取出被包装的数据，解包用!
 var age: Int? = 10
 var ageInt: Int = age!
 ageInt += 10
 
 // 对nil 的可选项解包会产生运行时错误
 // Fatal error: Unexpectedly found nil while unwrapping an Optional value

 // var age: Int?
 // age!

 let number = Int("kk123") // 这里number是可选类型，可以通过编译器提示查看
 if number != nil {
     print("转换成功：\(number)")
 } else {
     print("转换失败")
 }
 */


/*
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
 
 
 // 下面两种写法等价：
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
 
 */


