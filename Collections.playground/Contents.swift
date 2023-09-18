import Foundation

let numbers = [1, 2, 3, 4]
numbers.first
numbers.last

numbers.count
numbers.map(-)

var mutatingNumbers = [4, 5, 6]

mutatingNumbers.append(7)
mutatingNumbers.insert(3, at: 0)

mutatingNumbers.insert(
    contentsOf: [1, 2],
    at: 0
)

for value in numbers {
    value
}

for value in numbers where value % 2 == 0 {
    value
}

let values = numbers.map{ (value: Int) -> String in
    String(value*2)
}

print(values)

let filtered = numbers.filter{ (value: Int) -> Bool in
    value >= 3
}

print(filtered)

numbers.compactMap { (value: Int) -> String? in
    value % 2 == 0
        ? String(value)
        : nil
}

let numbers2: [Int?] = [1, 2, nil, 4, 5]

numbers2.count

let noNils = numbers2.filter { (value: Int?) -> Bool in
        value != nil
}

let noNilsForReal = numbers2.compactMap{ (value: Int?) -> Int? in
    value
}


print(noNils)
print(noNilsForReal)

let numbers3 = [ 1, 2, 1, 2 ]
numbers3.count

let stuff1: [Any] = [1, "Hello", 2, "World"]
stuff1.count




let uniqueNumbers = Set([1,2, 1, 2, 3])

uniqueNumbers.count
print(uniqueNumbers.map(-))

let myNumbers = Set([1, 2, 3, nil, 5])

let noNilNumbers = Set(myNumbers.compactMap{
    $0
})

print(noNilNumbers)

let stuff3: Set<AnyHashable> = Set([1, 2, 3, "Dhikshith", [1]])

stuff3.count
print(stuff3)

let intsInStuff1 = stuff1.compactMap{ (value: Any) -> Int? in
        value as? Int
}

print(intsInStuff1)


let strsInStuff1 = stuff1.compactMap{ (value: Any) -> String? in
        value as? String
}

print(strsInStuff1)

let intsInStuff3 = stuff3.compactMap{ (value: Any) -> Int? in
        value as? Int
}

print(type(of: stuff3))
print(type(of: intsInStuff3));
print(intsInStuff3)

struct Person: Hashable{
    let id: UUID
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (
        lsh: Person,
        rhs: Person
    ) -> Bool {
        lsh.id == rhs.id
    }
}

let fooId = UUID()
let foo = Person(id: fooId, name: "Foo", age: 20)
let bar = Person(id: fooId, name: "Bar", age: 30)

let people: Set<Person> = [foo, bar]

people.count

// MARK: - Dictionaries
let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
        "postCode": "12345"
    ]
] as [String: Any]


print(userInfo["name"]!)
print(userInfo["age"]!)
print(userInfo["address"]!)

print((userInfo["address"] as! [String: String])["line1"]!)

print(userInfo.keys)
print(userInfo.values)


for (key, value) in userInfo {
    print(key, value)
}

for (key, value) in userInfo where value is Int {
    print(key, value)
}


for (key, value) in userInfo where value is Int && key.count > 2 {
    print(key, value)
}










