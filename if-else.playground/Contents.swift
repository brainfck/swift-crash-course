import Foundation

let myName = "Vandad"
let myAge = 20
let yourName = "Foo"
let yourAge = 19

if myName == "Vandad" {
    "Your name is \(myName)"
} else {
    "Oops, I guessed it wrong"
}

if myName == "Vandad" && myAge == 30 {
    "Name is Vandad and age is 30"
} else if myAge == 20 {
    "I only guessed age right"
} else {
    "I don't know what I'm doing"
}
