import Foundation

protocol CanBreathe {
  // no body
  // can have function declaration without body
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

/// adding default implementation
extension CanJump {
  func jump() {
    "Jumping..."
  }
}

struct Cat: CanJump {
}

let cat = Cat()
cat.jump()

protocol HasName {
  /// { get } { set } or { get set}
  var name: String { get }
  var age: Int { get set }
  mutating func increaseAge()
}

extension HasName {
  func describeMe() -> String {
    "Your name in \(name) and you are \(age) years old"
  }
  mutating func increaseAge() {
    self.age += 1
  }
}

struct Dog: HasName {
  let name: String
  var age: Int
}

var woof = Dog(
    name: "Woof",
    age: 10
)

woof.describeMe()
woof.increaseAge()
woof.age

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

  // can also be initialized in c-tor
  //  init() {
  //    self.speed = 0
  //  }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

/// use "is" to check if object conforms to a protocol or not
/// using "as?" syntax you can promote to other type

func describe(obj: Any) -> String {
  if obj is Vehicle {
    return "obj conforms to Vehicle protocol"
  }
  return "obj does not conforms to Vehicle protocol"
}

describe(obj: bike)

/// as?

func increaseSpeedIfVehicle(obj: Any) {
  if var vehicle = obj as? Vehicle {
    vehicle.speed += 10
  } else {
    "This was not a vehicle"
  }
}

/// bike is a struct, you are actually passing it by value not by ref, so speed stays at 10
increaseSpeedIfVehicle(obj: bike)
bike.speed

