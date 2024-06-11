import Foundation

let myName = "Michael"
let yourName = "Foo"
let myAge = 20
let yourAge = 22

if myName == "michael" {
  "Your name is \(myName)"
} else {
  "Oops I guessed it wrong"
}

if myName == "Michael" {
    "Now I guessed it correctly"
} else if myName == "Foo" {
    "Are you Foo?"
} else {
  "OK, I give up"
}

if myName == "Michael" && myAge == 30 {
  "Name is Michael and age is 30"
} else if myAge == 20 {
  "I only guessed the age right"
} else {
  "I don't know what I'm doing"
}

if myAge == 20 || myName == "Foo" {
  "Either age is 20, name is Foo or both"
} else if myName == "Vandad" || myAge == 20 {
  "It's too late to get into this clause"
}

// && and || same priority, no precedence, executed from left to right
if myName == "Michael"
    && myAge == 22
    && yourName == "Foo"
    || yourAge == 22 {
  "My name is Michael and I'm 20 and your name is Foo OR you are 22"
}

if (myName == "Michael"
    && myAge == 22)
    && 
    (yourName == "Foo"
    || yourAge == 22) {
  "My name is Michael and I'm 20 AND your name is Foo or you are 22"
} else {
  "Hmm, that didn't work so well"
}
