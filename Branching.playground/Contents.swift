import Foundation


let myName = "Vandad"
let myAge = 20
let yourName = "Foo"
let yourAge = 19

if myName == "vandad" {
    "Your name is \(myName)"
} else {
    "Opps, I guessed it wrong"
}

if myName == "Vandad" {
    "Now I guessed it correctly"
} else if myName == "Foo" {
    "Are you foo?"
} else {
   "Something else"
}

if myName == "Vandad" && myAge == 30 {
    "Name is Vandad and age is 30"
} else if myAge == 20 {
    "I only guessed the age right"
} else {
    "I don't know what i'm doing"
}

if myAge == 20 || myName == "Foo" {
    "Either age is 20, name is Foo or both"
} else if myName == "Vandad" || myAge == 20 {
    "it's too late to get in this branch"
}

if myName == "Vandad"
    && myAge == 22
    && yourName == "Foo"
    || yourAge == 19 {
    "My name is Vandad and I'm 22 and your name is Foo.....OR... you are 19"
}

if (myName == "Vandad" && myAge == 22) && (yourName == "Foo" || yourAge == 19) {
    "My name is Vandad and I'm 22... AND... your name is foor or you are 19"
} else {
 "Hmm, that didn't work so well"
}
