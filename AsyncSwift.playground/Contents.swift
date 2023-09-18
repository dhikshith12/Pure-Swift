import Foundation
import PlaygroundSupport


PlaygroundPage
    .current
    .needsIndefiniteExecution = true


func calculateFullName(
    firstName: String,
    lastName: String
) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}


Task {
    let result1 = await calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    )
    async let result2 = calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    )
    await result2
}

enum Cloth {
    case socks, shirt, trousers
}

func buySocks() async throws -> Cloth {
    try await Task.sleep(for: .seconds(1))
    return Cloth.socks
}

func buyShirt() async throws -> Cloth {
    try await Task.sleep(for: .seconds(1))
    return Cloth.shirt
}

func buyTrousers() async throws -> Cloth {
    try await Task.sleep(for: .seconds(1))
    return Cloth.trousers
}

struct Ensemble: CustomDebugStringConvertible{
    
    let clothes: [Cloth]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trousers = buyTrousers()
    
    let ensemble = Ensemble(
        clothes: await [
            try socks,
            try shirt,
            try trousers
        ], totalPrice: 200
    )
    return ensemble
}



Task {
    if let ensemble = try? await buyWholeEnsemble() {
        print(ensemble)
    } else {
        print("Something Went Wrong")
    }
}

func getFullName (
    delay: Duration,
    calculator: () async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}


func fullName() async -> String {
    "Foo Bar"
}

Task {
    await getFullName(delay: .seconds(1), calculator: fullName)
}
