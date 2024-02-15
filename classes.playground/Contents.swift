import Foundation

/// needs to have initializer
class Person {
  var name: String
  var age: Int
  
  init(
    name: String,
    age: Int
  ) {
    self.name = name
    self.age = age
  }
  
  func increaseAge() {
    self.age += 1
  }
}


let foo = Person(
  name: "Foo",
  age: 20
)
foo.age
foo.increaseAge()
foo.age

foo.age
let bar = foo
bar.increaseAge()
foo.age
bar.age

if foo === bar {
  "Foo and Bar point to the same memory"
} else {
  "They dont point to the same memory"
}

/// == tests if two variable hold values are internally equal
/// === tests if two variables point to same memory location

/// classes can have inheritance

class Vehicle {
  func goVruum() {
    "Vroom vroom"
  }
}

class Car: Vehicle {
  
}

let car = Car()
car.goVruum()

class Person2 {
  private(set) var age: Int
  init(age: Int) {
    self.age = age
  }
  func increaseAge() {
    self.age += 1
  }
}

let baz = Person2(age: 20)
baz.age
// baz.age += 1


class Tesla {
  let manufacturer = "Tesla"
  let model: String
  let year: Int
  
  // designated initializer
  init() {
    self.model = "X"
    self.year = 2024
  }
  
  // designated initializer
  init(model: String, year: Int) {
    self.model = model
    self.year = year
  }
  
  // convenience initializer
  convenience init(model: String) {
    self.init(
      model: model,
      year: 2024
    )
  }
}

class TeslaModelY: Tesla {
  override init() {
    super.init(
      model: "Y",
      year: 2024
    )
  }
}


// designated initializer in subclasses can only call designated initializer of a super class
// inside any class designated initializer cannot delegate to any other initializer
// convenience initializers can inside subclasses and inside their own classes call designated initializer

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

let fooBar = Person2(age: 20)
fooBar.age

func doSomething(with person: Person2) {
  person.increaseAge()
}

doSomething(with: fooBar)
fooBar.age

// deinitialzers are invoked automatically by Swift when it goes out of memory

class MyClass {
  init() {
    "initialized"
  }
  func doSomething() {
    "Do something"
  }
  deinit {
    "Deinitialized"
  }
}

let myClosure = {
  let myClass = MyClass()
  myClass.doSomething()
}

myClosure()
