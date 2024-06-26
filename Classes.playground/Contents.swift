import Foundation

// by default requires initializer, not as Struct

class Person {
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  func increaseAge() {
    self.age += 1
  }
}

// let is allowing internal mutability (reference types)
let foo = Person(name: "Foo", age: 20)
foo.age
foo.increaseAge()
foo.age

foo.age
// reference types
let bar = foo
bar.increaseAge()
bar.age
foo.age

// that is === operator
if foo === bar {
  "Foo and Bar point to the same memory"
} else {
  "They don't point to the same memory"
}


class Vehicle {
  func goVroom() {
    "Vroom Vroom"
  }
}

class Car: Vehicle {
  
}

let car = Car()
car.goVroom()


class Person2 {
  private(set) var age: Int
  
  init(age: Int) {
    self.age = age
  }
  
  func increaseAge() {
    self.age +=  1
  }
}

let baz = Person2(age: 15)
//baz.age = 23
baz.increaseAge()


class Tesla {
  let manufacturer = "Tesla"
  let model: String
  let year: Int
  
  // designated initializer (any initializer that does not have convenience before them is designated\
  // designated init SHOULD DO ALL THE WORK THEMSELVES THey cannot delegate work to another initializer
  init() {
    self.model = "X"
    self.year = 2023
  }
  
  init(model: String, year: Int) {
    self.model = model
    self.year = year
  }
  
  // convenience init CAN delegate it's work
  convenience init(model: String) {
    self.init(model: model, year: 2023)
  }
}

class TeslaModelY: Tesla {
  // you can delegate init work in desegnated initializer calling super initializer(but only DESIGNATED)
  override init() {
    super.init(model: "Y", year: 2023)
  }
}

let modelY = TeslaModelY()
modelY.manufacturer
modelY.model
modelY.year

let fooBar = Person2(age: 20)

fooBar.age

func doSomething(with person: Person2) {
  person.increaseAge()
}

// reference TYPES
doSomething(with: fooBar)
fooBar.age


class MyClass {
  init() {
    "Initialized"
  }
  
  func doSomething() {
    "Do Something"
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
