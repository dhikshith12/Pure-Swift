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


enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(url: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(url: URL(string: "https://folksable.com")!)

switch wwwApple {
    
    case let .fileOrFolder(path, name):
        path
        name
        break
    case let .wwwUrl(url):
        url
        break
    case let .song(artist, songName):
        artist
        songName
        break;
}

if case let .wwwUrl(path) = wwwApple {
    path;
}

let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "Without You"
)

if case let .song(_, songName) = withoutYou {
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var manufacturer: String{
     switch self {
         case
            let .car(manufacturer, _),
            let .bike(manufacturer,_):
          return  manufacturer
     }
}

}

let car = Vehicle
    .car(manufacturer: "Tesla", model: "X")

let bike = Vehicle
    .bike(manufacturer: "HD", yearMade: 1987)

switch car {
    case let .car(manufacturer, _):
        manufacturer
    case let .bike(manufacturer, _):
        manufacturer
}

switch bike {
    case let .bike(manufacturer,_):
        manufacturer
        
    case let .car(manufacturer, _):
        manufacturer
}

bike.manufacturer
car.manufacturer


enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}
