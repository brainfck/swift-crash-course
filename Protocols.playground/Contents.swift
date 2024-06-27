import Foundation

protocol CanBreathe {
  func breathe()
}

struct Animal: CanBreathe {
  func breathe() {
    "Animal breathing..."
  }
}

struct Person: CanBreathe {
  func breathe() {
    "Person breathing..."
  }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

protocol CanJump {
  func jump()
}

// only way to add default implementation
extension CanJump {
  func jump() {
    "jumping..."
  }
}

struct Cat: CanJump {
  
}

let cat = Cat()
cat.jump()


protocol HasName {
  var name: String { get }
  var age: Int { get set }
}

extension HasName {
  func describeMe() -> String {
    return "Your name is \(name) and you are \(age) years old"
  }
  
  mutating func increaseAge() {
    self.age += 1
  }
}

struct Dog: HasName {
  let name: String
  var age: Int
}

var woof = Dog(name: "Woof", age: 2)
woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()
woof.increaseAge()

protocol Vehicle {
  var speed: Int { get set }
  mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
  mutating func increaseSpeed(by value: Int) {
    self.speed += value
  }
}

struct Bike: Vehicle {
  var speed: Int = 0
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

func describe(obj: Any) {
  if obj is Vehicle {
    "obj conforms to the Vehicle protocol"
  } else {
    "obj does not conform to the  Vehicle protocol"
  }
}

describe(obj: bike)

func increaseSpeedIfVehicle(obj: Any) {
  if var vehicle = obj as? Vehicle {
    vehicle.increaseSpeed(by: 10)
  } else {
    "This was not a vehicle"
  }
}

increaseSpeedIfVehicle(obj: bike)
// its still 10 because Struct is a value type!
bike.speed
