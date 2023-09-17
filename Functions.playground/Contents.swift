import Foundation

func noArgumentsAndNoReturnValue() -> String{
    "I don't know what I'm doing"
}

let str = noArgumentsAndNoReturnValue()

func plusTwo(value: Int) -> Int {
    value+2;
}

var a = 2;

a = plusTwo(value: 2)

func customAdd(
    _ value1: Int,
    _ value2: Int
) -> Int {
    value1 + value2
}

func customSub(
    lhs: Int,
    rhs: Int
) -> Int {
    lhs - rhs;
}

let customAdded = customAdd(10, 20)

customSub(lhs: 9, rhs: 5)


@discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}

myCustomAdd(20, 30)

func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2;
    }
    return mainLogic(value: value + 3)
}

doSomethingComplicated(with: 30)

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)"
}

getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Foo")
getFullName(firstName: "Baz", lastName: "Qux")


type(of: getFullName)

typealias DefaultParamsClosure = (String, String) -> String

// Define the default closure.
let defaultClosure: DefaultParamsClosure = { (firstName, lastName) in
    return "\(firstName) \(lastName)"
}

// Use the default closure as a default argument for execute.
func aFuncThatTakesAnotherFunc(
    execute exe: DefaultParamsClosure = defaultClosure,
    parameter1 p1: String,
    parameter2 p2: String
) -> String {
    return exe(p1, p2)
}

aFuncThatTakesAnotherFunc(execute: getFullName, parameter1: "Red", parameter2: "Blue")
