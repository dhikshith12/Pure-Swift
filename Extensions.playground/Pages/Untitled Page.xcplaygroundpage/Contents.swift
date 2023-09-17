import Foundation

extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}

let two = 2
two.plusTwo()


struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName
            .components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName,
            lastName: components.last ?? fullName
        )
    }
}

let person = Person(fullName: "Foo Bar")

person.firstName
person.lastName

protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

let modelX = Car(
    manufacturer: "Tesla",
    model: "X"
)

modelX.goVroom()

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
    
}

// extensions can add convenience initializers to existing classes
extension MyDouble {
    convenience init() {
        self.init(value: 0.0)
    }
}

MyDouble().value

extension GoesVroom {
    func goVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}

modelX.goVroomEvenMore()
