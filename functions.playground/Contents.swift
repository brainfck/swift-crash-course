import Foundation

func noArgumentsAndNoReturnValue() {
    "I don't know what I'm doing"
}
noArgumentsAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
}
plusTwo(value: 30)

func newPlusTwo(value: Int) -> Int {
    value + 2
}
newPlusTwo(value: 30)

func customAdd(value1: Int, value2: Int) -> Int {
    value1 + value2
}
let cusotmAdded = customAdd(value1: 10, value2: 20)

func customMinus(_ lhs: Int, _ rhs: Int) -> Int {
    lhs - rhs
}
let customSubtractet = customMinus(20, 10)

customAdd(value1: 10, value2: 15)

@discardableResult
func myCustomAdd(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}

myCustomAdd(20, 30)

func doSomethingComplicated(_ value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    
    return mainLogic(value: value + 3)
}

doSomethingComplicated(30)

func getFullName(firstName: String = "Foo", lastName: String = "Bar") -> String {
    "\(firstName) \(lastName)"
}
getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Jazz")
getFullName(firstName: "Michael", lastName: "Jordan")
