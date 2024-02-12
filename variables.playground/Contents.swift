import Foundation

let myName = "Mykhailo" // after creating a let constant you cant assign a new value
let yourName = "Foo"

var names = [
    myName,
    yourName
]

names = ["Bla"] // mutating variable itself, Concept I

names.append("Bar") // mutating what is inside the variable, Concept II
names.append("Baz") // mutating what is inside the variable, Concept II

// value types:
let foo = "Foo"
var foo2 = foo
foo2 = "Foo 2"

foo
foo2

let moreNames = [
    "Foo",
    "Bar"
]

// cannot do this: moreNames.append("Baz")

var copy = moreNames // creates entire copy
copy.append("Baz")
moreNames
copy

// just for demo purposes:
let oldArray = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
oldArray.add("Baz")
var newArray = oldArray
newArray.add("Qux")
// exact SAME array:
oldArray
newArray


let someNames = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray
    copy.add("Baz")
}
changeTheArray(someNames)
someNames
