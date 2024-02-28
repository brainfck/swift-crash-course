import Foundation

let numbers = [1, 2, 3, 4, 5]
numbers.first
numbers.last
numbers.count
numbers.map(-)

var mutatingNumbers = [0, 1, 2]
mutatingNumbers.append(7)
mutatingNumbers.insert(3, at: 2)
mutatingNumbers.insert(
  contentsOf: [1, 2, 3, 4],
  at: 1
)

for value in numbers {
  value
}

for value in numbers where value.isMultiple(of: 2) {
  value
}

// allows actually to map ot anything
numbers.map { $0 * 2 }

// the more information you give to compiler the better app compiles in large scale applications
let values = numbers.map({ (value:Int) -> String in
  String(value * 2)
})

numbers.filter{(value: Int) -> Bool in
  value >= 3
}

// combination of map and filter
numbers.compactMap { (value: Int) -> String? in
  value.isMultiple(of: 2) ? String(value) : nil
}

let numbers2: [Int?] = [1, 2, nil, 3, 4, 5]
numbers2.count
let notNils = numbers2.filter{(value: Int?) -> Bool in
  value != nil
}
// notNils is still [Int?]

let notNils2 = numbers2.compactMap{(value: Int?) -> Int? in
  value
}

// notNils2 is [Int]


let numbers3 = [1, 2, 1, 2]

let stuff1 = [1, "Hello", 2, "World"] as [Any]
stuff1.count

let stuff2: [Any] = [1, "Hello", 2, "World"]
stuff2.count
