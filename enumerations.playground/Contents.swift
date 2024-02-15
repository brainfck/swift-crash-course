import Foundation

enum Animals {
    case cat, dog, rabbit
}

let cat = Animals.cat
cat

if cat == Animals.cat {
    "That is a cat"
}

/// must be exhaustive
switch cat {
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
case .rabbit:
    "This is a rabbit"
    break
}

enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

/// no more implicit equality, as soon as you have associated value Swift does not know how to compare them
/// anymore
//if wwwApple == Shortcut.wwwUrl(
//    path: URL(string: "https://apple.com")!
//)

switch wwwApple {
case .fileOrFolder(
    path: let path,
    name: let name
):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(
    artist: let artist,
    songName: let songName
):
    artist
    songName
    break
}

/// preferred way of writing it 1
switch wwwApple {
case .fileOrFolder(
    let path,
    let name
):
    path
    name
    break
case .wwwUrl(let path):
    path
    break
case .song(
    let artist,
    let songName
):
    artist
    songName
    break
}

/// preferred way of writing it 2
switch wwwApple {
case let .fileOrFolder(
    path,
    name
):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(
    artist,
    songName
):
    artist
    songName
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

if case let .fileOrFolder(path, name) = wwwApple {
    path
    name
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
    case bike(manufacturer: String, yearModel: Int)
    
    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _),
             let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let car = Vehicle.car(
    manufacturer: "Tesla",
    model: "X"
)

let bike = Vehicle.bike(
    manufacturer: "HD",
    yearModel: 1958
)

car.manufacturer
bike.manufacturer

enum FamilyMember: String {
    case mother = "Mom"
    case father = "Dad"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue
FamilyMember.mother.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊") {
    "Found the blush emoji"
    blush
} else {
    "This emoji doesn't exist"
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    "Snow exists?! Really"
    snow
} else {
    "As expected, snow doesn't exist in our enum"
}

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight


indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
        
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2,4))
freeHand.calculateResult()
