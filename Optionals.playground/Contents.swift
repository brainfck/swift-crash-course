import Foundation

// just to demonstrate optionals
func multiplyByTwo(_ value: Int? = nil) -> Int {
  if let value {
    return value * 2
  } else {
    return 0
  }
}

multiplyByTwo()

let age: Int? = nil
if age != nil {
  "Age is there how odd"
} else {
  "Age is nil. Correct"
}

if let age {
  "Age is there, its value is \(age)"
} else {
  "No age is present"
}

func checkAge() {
  guard let age else {
    "Age is nil as expected"
    return // YOU HAVE TO RETURN BECAUSE OF USING GUARD
  }
  
  "Age is not nil here \(age)"
}

checkAge()


switch age {
case .none:
  "Age has no value as expected"
case let .some(value):
  "Age has the value of \(value)"
}

let age2: Int? = 0
if age2 == 0 {
  "Age2 is 0 as expected and is not null"
} else {
  "Age 2 is not 0, how strange "
}

if age2 == .some(0) {
  "Age2 is 0 as expected and is not null"
} else {
  "Age 2 is not 0, how strange "
}

struct Person {
  let name: String
  let address: Address?
  
  struct Address {
    let firstLine: String?
  }
}

let foo = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine {
  fooFirstAddressLine
} else {
  "Foo doesn't have an address with first line"
}

let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))

if bar?.name == "Bar",
   bar?.address?.firstLine == nil {
  "Bar's name is bar and has not first line of address"
} else {
  "Seems like something is not working right"
}

let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz first line"))

switch baz?.address?.firstLine {
case let .some(firstLine) where firstLine.starts(with: "Baz"):
  "Baz first address line is \(firstLine)"
case let .some(firstLine):
  "Baz address line that didn't match the previous case"
  firstLine
case .none:
  "Baz first address is nil"
}


func getFullName(firstName: String, lastName: String?) -> String? {
  if let lastName {
    return "\(firstName) \(lastName)"
  } else {
    return nil
  }
}

getFullName(firstName: "Foo", lastName: nil)
getFullName(firstName: "Foo", lastName: "Bar")

func getFullName2(firstName: String, lastName: String?) -> String? {
  guard let lastName else {
    return nil
  }
  return "\(firstName) \(lastName)"
}

getFullName2(firstName: "Foo", lastName: nil)
getFullName2(firstName: "Foo", lastName: "Bar")
