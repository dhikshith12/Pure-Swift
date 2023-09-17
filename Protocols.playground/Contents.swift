import Foundation

protocol CanBreathe {
    func breathe()
}

struct Animal: CanBreathe {
    func breathe() {
        print("Breathing....")
    }
}


struct Person: CanBreathe, CanJump, HasName{
    var age: Int = 10
    
    let name: String = "Human"
    func breathe() {
        print("Person is Breathing...")
    }
}

let dog = Animal()
dog.breathe();

let person = Person()
person.breathe()


protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
       print("Jumping...")
    }
}



person.jump();


protocol HasName {
    var name: String { get }
    var age: Int { get set }
}

struct Dog: HasName
{
    let name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 10)

print(woof.name)
print(woof.age)

extension HasName {
    var describe: String {
        "My name is \(name) and I'm \(age) years old"
    }
    mutating func increaseAge(){
        age += 1;
    }
}

print(woof.describe)
woof.increaseAge();
print(woof.age)

protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(
        by value: Int
    ) {
        self.speed+=value;
    }
}

struct Bike: Vehicle {
    var speed: Int = 0
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed


func describe(obj: Any) {
    if obj is Vehicle {
        "Obj confirms to the Vehicle protocol"
    
    } else {
        "Obj doesn't confirm to the Vehicle protocl"
    }
}

describe(obj: bike)


func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        print(vehicle.speed)
        vehicle.increaseSpeed(by: 10)
        print(vehicle.speed)
    } else {
        "This is not a vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike)

bike.speed
