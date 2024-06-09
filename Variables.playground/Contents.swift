import Foundation

let myName = "Michael"
let yourName = "Foo"

var names = [
  myName,
  yourName
]


names.append("Bar")
names.append("Baz")

let foo = "Foo"
var foo2 = foo

// value types -> String is A Type of Structure

foo2 = "Foo2"
foo
foo2

let moreNames = [
  "Foo",
  "Bar"
]

var copy = moreNames
copy.append("Baz")
moreNames
copy

// NSMutableArray is a class so behavior is different

let oldArray = NSMutableArray(
  array: [
    "Foo",
    "Bar"
  ]
)

oldArray.add("Baz")

var newArray = oldArray
newArray.add("Qux")
oldArray
newArray


let someNames = NSMutableArray(
  array: [
    "Foo",
    "Bar"
  ]
)

func changeTheArray(_ array: NSArray) {
  let array2 = array as! NSMutableArray
  array2.add("Baz")
}

changeTheArray(someNames)
someNames

