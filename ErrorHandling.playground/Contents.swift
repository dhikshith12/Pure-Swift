import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum PersonErrors: Error{
        case firstNameIsNil,
        lastNameIsNil,
        bothNamesAreNil
    }
    func getFullname() throws -> String {
        guard let firstName, let lastName else {
            if firstName == nil && lastName == nil {
                throw PersonErrors.bothNamesAreNil
            }
            if firstName == nil {
                throw PersonErrors.firstNameIsNil
            }
            throw PersonErrors.lastNameIsNil
        }
        return "\(firstName) \(lastName)"
    }
    
    func getFullName2() throws -> String {
        switch (firstName, lastName) {
        case(.none, .none):
            throw PersonErrors.bothNamesAreNil
        case(.none, .some):
            throw PersonErrors.firstNameIsNil
        case(.some, .none):
            throw PersonErrors.lastNameIsNil
        case(.some, .some):
            return "\(firstName!) \(lastName!)"
        }
    }
}

var person1 = Person(firstName: nil, lastName: nil);

do {
    let fullName = try person1.getFullname();
} catch {
    "Got an error = \(error)"
}


do {
    let fullName = try person1.getFullname();
    fullName
} catch Person.PersonErrors.firstNameIsNil {
    "[ERROR]: First Name is Nil"
} catch Person.PersonErrors.lastNameIsNil {
    "[ERROR]: Last Name is Nil"
} catch Person.PersonErrors.bothNamesAreNil {
    "[ERROR]: Both Names are Nil"
}

struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(manufacturer: String) throws {
        if (manufacturer.isEmpty) {
            throw Errors.invalidManufacturer;
        }
        self.manufacturer = manufacturer
    }
}

do {
   let myCar = try Car(manufacturer: "")
} catch Car.Errors.invalidManufacturer {
    "Invalid Manufacturer"
} catch {
    "Some other error: \(error)"
}

if let yourCar = try? Car(manufacturer: "Tesla") {
   "Success, your car \(yourCar)"
} else {
    "Failed to construct your car, and error is not accessible now"
}


let theirCar = try! Car(manufacturer: "Ford")

theirCar.manufacturer


struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Running..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(isInjured: true, isSleeping: true)

do {
    try dog.barkAndRun()
    dog
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
        Dog.RunningErrors.cannotRunIsInjured {
    "Cannot-bark-is-sleeping OR Cannot-run-is-injured"
} catch {
    "Some other error"
}



do {
    try dog.barkAndRun()
    dog
} catch Dog.BarkingErrors.cannotBarkIsSleeping {
    "Cannot-bark-is-sleeping"
} catch Dog.RunningErrors.cannotRunIsInjured {
    "Cannot-run-is-injured"
} catch {
    "Some other error"
}

// rethrows keyword needs a a throwing function argument
func fullName(
    _ firstName: String?,
    _ lastName: String?,
    op: (String?, String?) throws -> String?
) rethrows -> String? {
   try op(firstName, lastName)
}


enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws -> String {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName("Foo", "Bar", op: +)
} catch NameErrors.firstNameIsInvalid {
   "First name is invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"
} catch let err {
    "Some other error = \(err)"
}


enum IntegerErrors: Error {
    case noPositiviveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(
            IntegerErrors.noPositiviveIntegerBefore(
                thisValue: int
            )
        )
    }
    return Result.success(int-1)
}

func performGet(
    forValue value: Int
) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousVaue):
        "Previous value is \(previousVaue)"
    case let .failure(error):
        switch error {
        case let .noPositiviveIntegerBefore(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(forValue: 12)


