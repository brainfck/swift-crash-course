import Foundation

// implicit constructors

struct Person {
  let name: String
  let age: Int
}
let foo = Person(
  name: "Foo",
  age: 20
)

foo.name
foo.age

struct CommodoreComputer {
  let name: String
  let manufacturer: String
  init(name: String) {
    self.name = name
    self.manufacturer = "Commodore"
  }
}

let c64 = CommodoreComputer(name: "c64")
c64.name
c64.manufacturer

struct Person2 {
  let firstName: String
  let lastName: String
  var fullName: String {
    "\(firstName) \(lastName)"
  }
}

let p2 = Person2(firstName: "Foo", lastName: "Bar")
p2.firstName
p2.lastName
p2.fullName

// structures are immutable and are value types
struct Car {
  var currentSpeed: Int
  mutating func drive(speed: Int) {
    print("Driving...")
    currentSpeed = speed
  }
}

let immutableCar = Car(currentSpeed: 10)
// immutableCar.drive(speed: 20) - this will give an error, immutableCar is LET!

var mutableCar = Car(currentSpeed: 10)
//mutableCar.drive(speed: 30)
//mutableCar.currentSpeed

// structs are value types, value is copied
let copy = mutableCar
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed

struct LivingThing {
  init() {
    "I'm living thing"
  }
}

//struct Animal : LivingThing not possible, structs does not support inheritance or subclasses

struct Bike {
  let manufacturer: String
  let currentSpeed: Int
  
  func copy(currentSpeed: Int) -> Bike {
    Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
  }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copy(currentSpeed: 30)

bike1.currentSpeed
bike2.currentSpeed
