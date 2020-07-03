//: [Previous](@previous)

 // 在 if 语句中，条件必须是一个布尔表达式
 // ——这意味着像 if score { ... } 这样的代码将报错，而不会隐形地与 0 做对比。


 // while...do
 var i = 100
 while i < 100 {
     i += 1
 }
 print(i)

 
 // 类似do...while
 // 从swift3中取消了自增，自减的运算符
 repeat {
     i += 1
 } while i < 100
 print(i)

 // if else ..

 // if else if ..



 // switch:
 // 1.不存在隐式的贯穿：不用加break,这个是跟其他语言的区别
 // 2.支持区间匹配
 let someInt = 3
 switch someInt {
 case 0...3:
     print("0...3")
 case 3...10:
     print("3...10")
 default:
     print("default")
 }

 // 3.支持元组匹配
 // 4.值绑定
 // 5.支持where条件
 // 6.支持复合条件匹配
 let point = (1, 3)
 switch point {
 case (0,0), (1,3):
     print("(0,0)/(1,3)")
 case (_,0):
     print("x轴")
 case(0,let y):
     print("y轴坐标", y)
     print("y=\(y)")
 case let(x, y) where x == -y:
     print("x = ", x, "y =", y)
     fallthrough // 这个是贯穿的意思
 case (-2...2, -2...2):
    print("inside the square!")
 default:
     print("other")
 }
 
 // 7.switch必须能处理所有的情况
 
 // 枚举类型, switch中也可以不加default. default可以排除没有列举完的类型
 enum Answer {case right, wrong}
 let answer = Answer.right
 switch answer {
 case Answer.right:
     print("right")
 case Answer.wrong:
     print("wrong")
 }
 
 // 8.switch在oc中只支持整形，在swift中支持字符串，字符类型
 
 // 不能像其他语言那样写两个case，可以case 1, 2: 或者case1后加fallthrough
 /*
  var a = 3
  switch a {
  case 1:
  case 2:
      print("1")
  default:
      print("2")
  }
 */

 
 // continue, break用在for语句中
 let numbers = [1,2,3,4,5,6,7,8]
 for num in numbers{
     if num == 5{
         continue// break
     }
     print(num, terminator: "")
 }
 // fallthrough用在switch中
 // return用在函数中
 // throw用在try中




//: [Next](@next)
