//: [Previous](@previous)

var numbers = [20, 19, 7, 12]
// numbers.map({
//     (number: Int) -> Int in
//     let result = 3 * number
//     return result
// })


let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)


// 通过参数位置
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
// [20, 19, 12, 7]



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]


// 闭包表达式语法
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// 因为可以类型推断，上面的表达式可以写成：
//省略类型，箭头，括号
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
//单行表达式可以省略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//参数名称缩写
reversedNames = names.sorted(by: { $0 > $1 } )
//通过运算符方法
reversedNames = names.sorted(by: >)


/*
swift跟java刚好相反：

s1-s2  (s1>s2)
swift:降序   java: 升序

*/


/*
尾随闭包:
---------
闭包表达式可以放在函数sort的外面：
reversedNames = names.sorted() { $0 > $1 }
如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
reversedNames = names.sorted { $0 > $1 }

例如下面map函数，后没有()，直接跟尾随闭包
*/
 
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers1 = [16, 58, 510]

let strings = numbers1.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        print(output)
        number /= 10
    } while number > 0
    return output
}




// 值捕获
// 闭包是引用类型
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() //10

incrementByTen() //20

incrementByTen() //30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() //7

incrementByTen() //40

incrementBySeven() //14



/*
 逃逸闭包:
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
 在使用闭包参数名之前标注 @escaping，指明这个闭包是允许“逃逸”出这个函数的。
 逃逸闭包显式调用self
 非逃逸闭包隐式调用self
 */

var completionHandlers: [() -> Void] = []

// 返回函数闭包
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// 返回函数值
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } //显式调用self
        someFunctionWithNonescapingClosure { x = 200 }  //隐式调用self
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x) //200


completionHandlers.first?()
print(instance.x) //100



// 自动闭包：
// ——-------
// 闭包如何延迟求值：
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count) //5

let customerProvider = { customersInLine.remove(at: 0) } //它的类型为 () -> String，不是String
print(customersInLine.count) //5

print("Now serving \(customerProvider())!") //Now serving Chris!
print(customersInLine.count) //4


// 将闭包用作参数传递
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } ) //Now serving Alex


// 参数标记为 @autoclosure 来接受一个自动闭包。
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0)) //Now serving Ewa!,这儿省略了大括号


// 如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。
// customersInLine = ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.") // Collected 2 closures

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
//Now serving Barry!
//Now serving Daniella!

//: [Next](@next)
