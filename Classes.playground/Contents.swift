import Foundation

// classes are reference types -> pass by reference

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 10
    }
}

let foo = Person(
    name: "Foo",
    age: 20
)

foo.increaseAge();
foo.age

let bar = foo
bar.increaseAge();
bar.age
foo.age

foo.age+=1

/// see if they are same memory
if foo === bar {
    "Foo and Bar point to the same Memory"
} else {
    "They don't point to the same Memory"
}

// classes unlike structs can have inheritance

class Vehicle {
    func start (){
        "Vroom Vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.start();


class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge(){
        self.age += 1
    }
}

let baz = Person2(age: 20)

baz.age
baz.increaseAge()
baz.age

