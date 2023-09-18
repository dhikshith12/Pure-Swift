import Foundation


let firstName: String? = "Foo"

let lastName: String? = "Bar"

// Binary Infix Operator
func +(lhs: String?, rhs: String?) -> String? {
    switch (lhs, rhs) {
    case (.none, .none):
        return nil
    case let (.some(value), .none), let (.none, .some(value)):
        return value
    default:
        return "\(lhs!) \(rhs!)"
    }
}

let fullName = firstName + lastName

prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}

// Unary Prefix Operator
let lowerCaseName = "Foo Bar"
let upperCaseName = ^lowerCaseName


postfix operator ***
postfix func *** (value: String) -> String {
    "*** \(value) ***"
}

let withStars = lowerCaseName***

struct Person {
    let name: String
}

struct Family {
    let members: [Person]
    var count: Int {
        members.count
    }
}

func + (
    lhs: Person,
    rhs: Person
) -> Family {
    Family(members: [
        lhs,rhs
    ])
}

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var members = family.members;
    members.append(rhs);
    return Family(members: members)
}

func + (
    rhs: Person,
    lhs: Family
) -> Family {
    var members = family.members;
    members.append(rhs);
    return Family(members: members)
}

func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var members = lhs.members;
    members.append(contentsOf: rhs)
    return Family(members: members)
}


func + (
    rhs: [Person],
    lhs: Family
) -> Family {
    var members = family.members;
    print(members)
    members.append(contentsOf: rhs)
    return Family(members: members)
}



let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter 1")
let daughter2 = Person(name: "Daughter 2")

let family = mom + dad

print(family.count)

let familyWithSon = family + son

print(familyWithSon.count)

let familyWithDaughters = familyWithSon + [
    daughter1,
    daughter2
]

print(familyWithDaughters.count)




