import Foundation

struct Person2 {
    let name: String
    let age: Int
}

let foo = Person2(
    name: "Foo",
    age: 18
)

foo.name
foo.age

struct CommodoreComputer {
    let name: String
    let manufacturer = "Commodore"
    
//    init(name: String) {
//        self.name = name
//        self.manufacturer = "Commodore"
//    }
}

let c64 = CommodoreComputer(
    name: "My commodore 64"
)

struct Person {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person(firstName: "Foo", lastName: "Bar")

fooBar.firstName
fooBar.lastName
fooBar.fullName

/// structures are immutable by default
/// so you should use mutating keyword
struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

/// since immutableCar is let
/// you cant call function that changes internal value
let immutableCar = Car(currentSpeed: 10)
/// immutableCar.drive(speed: 20)

var mutableCar = Car(currentSpeed: 10)
let copy = mutableCar

mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed

/// sturctures cannot subclass another structures

struct LivingThing {
    init() {
        "I'm a living thing"
    }
}

/// invalid code
//struct Animal: LivingThing {
//
//}

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike(
            manufacturer: self.manufacturer,
            currentSpeed: currentSpeed
        )
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copy(currentSpeed: 30)
bike1.currentSpeed
bike2.currentSpeed
