import Foundation

// MARK: - Operators

let myAge = 22
let yourAge = 20


var greet = if myAge > yourAge {
    "I'm older than you"
} else if myAge < yourAge {
    "I'm younger than you"
} else {
    "Oh hey, we are the same age"
}

let myMothersAge = myAge + 30
let doubleMyAge = myAge * 2

//  1. unary prefix
let value = !true
if value {
    
} else {
    
}

//  2. unary postfix
let name = Optional("Vandad")
let unaryPostFix = name!
print(type(of: name))

//  3. binary infix

let c = 10 + 5;

let foobar = "Foo" + " " + "Bar"

// ternary operatator

let age = 30

let message = if age>=18 {
    "You are an adult"
} else {
    "You are not an adult"
}

print(message)

let message2 = age > 18
    ? "You are an adult"
    : "You are not yet an adult"


