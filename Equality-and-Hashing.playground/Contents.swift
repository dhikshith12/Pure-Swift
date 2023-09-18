import Foundation

struct Dog: Equatable{
    
}

struct Person: Equatable {
    let id: String
    let name: String
    
    static func == (
        _ lhs: Person,
        _ rhs: Person
    ) -> Bool {
        lhs.id == rhs.id
    }
}

let foo1 = Person(
    id: "1",
    name: "Bar"
)

let foo2 = Person(id: "1", name: "Dod")

if foo1 == foo2 {
    "They are equal!"
} else {
    "They are not equal"
}

enum AnimalType: Equatable {
    case dog(breed: String)
    case cat(breed: String)
//    
//    static func == (
//        _ lhs: AnimalType,
//        _ rhs: AnimalType
//    ) -> Bool {
//        switch (lhs, rhs) {
//        case let (.dog(lhsBreed), .dog(rhsBreed)), let (.cat(lhsBreed), .cat(rhsBreed)):
//            return lhsBreed == rhsBreed
//            
//        default:
//            return false
//        }
//    }
}

struct Animal: Equatable{
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Whiskers", type: .cat(breed: "Street cat"))

let cat2 = Animal(name: "Whoosh", type: .cat(breed: "Street cat"))

if cat1 == cat2 {
    "They are equal because of their type"
} else {
    "They are not equal"
}

struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)

let house2 = House(number: 123, numberOfBedrooms: 3)

print(house1.hashValue)
print(house2.hashValue)

let houses = Set([house1, house2])

print(houses.count)


struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
}

let houseN1 = House(number: 123, numberOfBedrooms: 3)
let houseN2 = House(number: 123, numberOfBedrooms: 3)

let housesN = Set([houseN1, houseN2])

print(housesN.count)

enum CarPart {
    case roof, tire, trucnk
}

let uniqueParts: Set<CarPart> = [.roof, .tire, .roof, .trucnk]

print(uniqueParts.count)

enum HouseType: Hashable{
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType
    .bigHouse(
        NumberedHouse(number: 1, numberOfBedrooms: 2)
    )

let bigHouse2 = HouseType
    .bigHouse(
        NumberedHouse(number: 1, numberOfBedrooms: 2)
    )
let smallHouse1 = HouseType
    .smallHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))

let uniqueHouseTypes: Set<HouseType> = Set([bigHouse1, bigHouse2, smallHouse1])
                            
print(uniqueHouseTypes.count)
