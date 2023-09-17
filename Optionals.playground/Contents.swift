import Foundation


func multiplyByTwo(_ value: Int? = nil) -> Int {
    (value ?? 0) * 2
}

multiplyByTwo()

let age: Int? = nil
if age != nil {
    "Age is there! How Odd!"
} else {
    "Age is nil. Correct."
}

if let age {
    "Age is there. How odd! It's value is \(age)"
} else {
    "No age is present. As expected"
}

func checkAge() {
    if age == nil {
        "Age is nil as expected"
        return;
    }
}

func checkAgeWithGuard() {
    guard age != nil else {
        "Age is nil as expected"
        // let x = age; x is still Optional
        return;
    }
    
    // unwrapping with guard-let
    guard let age2 else {
       return
    }
    let xxx = age2
    "Age is not nil as expected. Value = \(age2)"
}

let age2: Int? = 10;

checkAgeWithGuard();

switch age2 {
case .none:
    "Age has no value as expteced"
case let .some(value):
    "Age has the value of \(value)"
}

if age2 == 10 {
    "Age2 is 10 as expected, and is not nil"
} else {
    "Age2 is not 10, How Strange!"
}

if age2 == .some(10) {
    "Age2 is 10 as expected, and is not nil"
} else {
    "Age2 is not 10, How Strange!"
}

struct Person {
    let name: String
    let address: Address?
    
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(
    name: "Foo", address: nil
)

if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with first line. as expected."
}

if let fooAddress = foo.address,
   let firstLine = fooAddress.firstLine {
    fooAddress
    firstLine
}

let bar: Person? = Person(
    name: "Bar",
    address: Person.Address(firstLine: nil)
)

if bar?.name == "Bar",
   bar?.address?.firstLine == nil {
    "Bar's name is bar and has no first line of address"
} else {
    "Seems like something isn't working right!"
}

let baz: Person? = Person(
    name: "Baz",
    address: Person.Address(
        firstLine: "Baz first line"
    )
)

switch baz?.address?.firstLine {
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "Baz first address line = \(firstLine)"
case let .some(firstLine):
    "Baz first address line that didn't match the previous case"
    firstLine
case .none:
    "Baz first address line is nill??? Weird!"
}

func getFullName(
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    }
    return nil;
}

getFullName(firstName: "Foo", lastName: nil)
getFullName(firstName: "Foo", lastName: "Bar")


func getFullName2(
    firstName: String,
    lastName: String?
) -> String? {
    guard let lastName else {
        return nil;
    }
    return "\(firstName) \(lastName)"
}
