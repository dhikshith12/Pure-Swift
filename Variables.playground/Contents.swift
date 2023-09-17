import Foundation


let myname = "Dhikshith"
let yourname = "Foo"
var iterim = "Iter"


var names = [
    myname,
    yourname,
    iterim
]

// MARK: - let doesn't let you to mutate the value

names.append("Bar");
names.append("Baz");

let foo = "Foo";
var foo2 = foo;

foo2 = "Foo 2";

foo
foo2

let moreNames = [
    "Foo",
    "Bar"
]

var copy = moreNames;
copy.append("Baz");

moreNames
copy

