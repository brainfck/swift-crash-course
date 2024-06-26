import Foundation

// NOT VERY GOOD OPTION TO CREATE SOMETHING LIKE THIS

struct Animal {
  let type: String
  
  init(type: String) {
    if type == "Rabbit" || type == "Cat" {
      self.type = type
    } else {
      preconditionFailure()
    }
  }
}

enum Animals {
  case cat
  case dog
  case rabbit
}

let cat = Animals.cat

if cat == .cat {
   "This is a cat"
} else if cat == .dog {
  "This is a dog"
} else {
  "This is something else"
}

func describeAnimal(_ animal: Animals) {
  switch animal {
  case .cat:
    "This is a cat"
  case .dog:
    "This is a dog"
  case .rabbit:
    "This is a rabbit"
  }
}

describeAnimal(cat)

// when you add associated values there is no equality by default anymore
enum Shortcut {
  case fileOrFolder(path: URL, name: String)
  case wwwUrl(path: URL)
  case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

switch wwwApple {
case .fileOrFolder(path: let path, name: let name):
  path
  name
case .wwwUrl(path: let path):
  path
case .song(artist: let artist, songName: let songName):
  artist
  songName
}

switch wwwApple {
case .fileOrFolder(let path, let name):
  path
  name
case .wwwUrl(let path):
  path
case .song(let artist,  let songName):
  artist
  songName
}

switch wwwApple {
case let .fileOrFolder(path, name):
  path
  name
case let .wwwUrl(path):
  path
case let .song(artist, songName):
  artist
  songName
}


// pay attention to = not ==
if case let .wwwUrl(path) = wwwApple {
   path
}

let withoutYou = Shortcut.song(artist: "Symphone X", songName: "Without You")

if case let .song(_, songName) = withoutYou {
  songName
}

enum Vehicle {
  case car(manufacturer: String, model: String)
  case bike(manufacturer: String, yearMade: Int)
  
  var manufacturer: String {
    switch self {
    case let .car(manufacturer, _),
      let .bike(manufacturer, _):
      return manufacturer
    }
  }
}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")
let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1978)

car.manufacturer
bike.manufacturer


enum FamilyMember: String {
  case father = "Dad"
  case mother = "Mom"
  case brother = "Bro"
  case sister = "Sis"
}

FamilyMember.brother.rawValue

enum FavoriteEmoji: String, CaseIterable {
  case blush = "😊"
  case rock = "🤘"
  case fire = "🔥"
}

FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊") {
  "Found the blush emoji"
  blush
} else {
  "This emoji does not exist"
}

enum Height {
  case short, medium, long
  
  mutating func makeLong() {
    self = Height.long
  }
}

var myHeight = Height.medium
myHeight.makeLong()

indirect enum IntOperation {
  case add(Int, Int)
  case subtract(Int, Int)
  case freeHand(IntOperation)
    
  func calculateResult(of operation: IntOperation? = nil) -> Int {
    switch operation ?? self {
    case let .add(lhs, rhs):
      return lhs + rhs
    case let .subtract(lhs, rhs):
      return lhs + rhs
    case let .freeHand(operation):
      return calculateResult(of: operation )
    }
  }
}

let freeHand = IntOperation.freeHand(.add(2, 4))
freeHand.calculateResult()


var luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
var resultNumbers = luckyNumbers.filter {
  !$0.isMultiple(of: 2)
}.sorted {
  $0 < $1
}.map { 
  "\($0) is a lucky number"
}

for number in resultNumbers {
  print(number)
}
