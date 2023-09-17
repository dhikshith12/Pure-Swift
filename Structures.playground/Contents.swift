import Foundation

// Constructurs are implicitly created by the compiler

struct Person {
    let name: String
    let age: Int
}

let foo = Person(
    name: "Foo",
    age: 20
)

foo.name
foo.age

struct CommodoreComputer {
    let name: String
    let manufacturer: String = "Commodore"
//    init(name: String) {
//        self.name = name
//        manufacturer = "Commodore"
//    }
}

let c64 = CommodoreComputer(
    name: "My Commodore"
);

let c128 = CommodoreComputer(
    name: "My Commodore 128"
)

print(c64.manufacturer, c128.manufacturer)

struct Person2 {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar");

fooBar
    .fullName
    .count


struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed;
    }
}


// can't have let
let immutableCar = Car(currentSpeed: 10)


var mutableCar = Car(currentSpeed: 20)

var copy = mutableCar; // copies the values

mutableCar.drive(speed: 10);


copy.currentSpeed;

copy.drive(speed: 15);

copy.currentSpeed;


struct LivingThing {
    init() {
        "I'm a living thing"
    }
}

//  structs can't inherit
//  struct Animal: LivingThing {
//
//  }

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    
    func copyWith(
        currentSpeed: Int? = nil,
        manufacturer: String? = nil
    ) -> Bike {
        Bike(
            manufacturer: manufacturer ?? self.manufacturer,
            currentSpeed: currentSpeed ?? self.currentSpeed
        )
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currentSpeed: 20
)

let bike2 = bike1.copyWith(currentSpeed: 30)

print(bike1)
print(bike2)


