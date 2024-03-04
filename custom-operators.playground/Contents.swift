import Foundation

let firstName: String? = "Foo"
let lastName: String? = "Bar"

let fullName = firstName + lastName

// binary infix
func + (
  lhs: String?,
  rhs: String?
) -> String? {
  switch(lhs, rhs) {
  case(.none, .none):
    return nil
  case let(.some(value), .none),
    let (.none, .some(value)):
    return value
  case let(.some(lhs), .some(rhs)):
    return lhs + rhs
  }
}



// unary prefix
prefix operator ^
prefix func ^ (value: String) -> String {
  value.uppercased()
}

let lowerCaseName = "foo bar"
let upperCaseName = ^lowerCaseName


postfix operator *
postfix func * (value: String) -> String {
  "*** \(value) ***"
}

let withStarts = lowerCaseName*





struct Person {
  let name: String
}

struct Family {
  let members: [Person]
}

func + (
  lhs: Person,
  rhs: Person
) -> Family {
  Family(
    members: [
      lhs,
      rhs
    ]
  )
}

func + (
  lhs: Family,
  rhs: Person
) -> Family {
  var members = lhs.members
  members.append(rhs)
  return Family(members: members)
}

func + (
  lhs: Family,
  rhs: [Person]
) -> Family {
  var members = lhs.members
  members.append(contentsOf: rhs)
  return Family(members: members)
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughet 1")
let daughter2 = Person(name: "Daughet 2")

let family = mom + dad
family.members.count
let familyWithSon = family + son
familyWithSon.members.count
let familyWithDaughetrs = familyWithSon + [daughter1, daughter2]
familyWithDaughetrs.members.count
