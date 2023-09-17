import Foundation

enum Animals {
    case cat, dog, rabbit, hedgehog
}

let animal = Animals.cat

animal

if animal == .cat {
    "This is a cat"
} else if animal == .dog {
    "This is a dog"
} else if animal == .rabbit {
    "This is a rabbit"
} else {
   "This is something else"
}

func describeAnimal(_ animal: Animals) {
    switch animal {
    case .cat:
        "This is a cat"
        break;
    case .dog:
        "This is a dog"
        break;
    case .hedgehog:
        "This is a hedgehog"
        break;
    default:
        "This is something else"
    }
}

describeAnimal(.hedgehog)
