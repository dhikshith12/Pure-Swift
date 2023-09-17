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
