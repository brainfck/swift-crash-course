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

// most powerful feature of extensions -> adding initializers
extension Person {
  init(fullName: String) {
    let components = fullName.components(separatedBy: " ")
    self.init(
      firstName: components.first ?? fullName,
      lastName: components.last ?? fullName)
  }
}

let person = Person(fullName: "Foo Bar")


protocol GoesVroom {
  var vroomValue: String { get }
  func goVroom() -> String
}

// adding default implementation to Protocols is also done using Exstensions
extension GoesVroom {
  func goVroom() -> String {
    "\(self.vroomValue) goes vroom!"
  }
}

struct Car {
  let manufacturer: String
  let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

// we can add protocols to already existing types
extension Car: GoesVroom {
  var vroomValue: String {
    "\(self.manufacturer) model \(self.model)"
  }
}

modelX.goVroom()


class MyDouble {
  let value: Double
  init(value: Double) {
    self.value = value
  }
}

// adding new convenience initializers
extension MyDouble {
  convenience init() {
    self.init(value: 0)
  }
}

MyDouble().value

extension GoesVroom {
  func goVroomVroomEvenMore() -> String {
    "\(self.vroomValue) is vrooming even more"
  }
}

modelX.goVroomVroomEvenMore()
