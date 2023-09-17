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

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    convenience init(model: String) {
        self.init(
            model: model,
            year: 2023
        )
    }
}
let myTesla = Tesla(model: "S")

class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y",
            year: 2023
        )
    }
}

let modelY = TeslaModelY()

modelY.model
modelY.year
modelY.manufacturer



let fooBar = Person2(age: 20)
fooBar
    .age

func doSomething(with person: Person2) {
    person.increaseAge()
}

doSomething(with: fooBar)
fooBar.age


class MyClass {
    init() {
        print("Initialized")
    }
    
    func doSomething() {
        // empty
    }
    
    deinit {
       print("Deinitialized")
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}


myClosure();

class Shape {
    func getArea() -> Int {
        return 0;
    }
}

class Rect: Shape {
    var sideLength: Int = 1
    
    // Custom getter and setter property
    var perimeter: Int {
        get {
            return 4 * sideLength;
        }
        set {
            sideLength = newValue / 4
        }
    }
    
    // Computed properties must be declared as `var`, you know, cause' they can change
    var smallestSideLength: Int {
        return self.sideLength - 1;
    }
    
    // Lazily load a property
    // subShape remains nil (uninitialized) until getter's called
    lazy var subShape = Rect(sideLength: 4)
    
    // If you don't need a custom getter and setter,
    // but still want to run code before and after getting or setting
    // a property, you can use `willSet` and `didSet`
    var identifier: String = "defaultID" {
        // the `someIdentifier` arg will be the variable name for the new value
        willSet(someIdentifier) {
            print(someIdentifier)
        }
    }
    
    init(sideLength: Int) {
        self.sideLength = sideLength;
        // always super.init last when init custom properties
        super.init();
    }
    
    func shrink() {
        if sideLength > 0 {
            sideLength -= 1;
        }
    }
    
    override func getArea() -> Int {
        return sideLength * sideLength;
    }
}
