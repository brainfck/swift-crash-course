import Foundation

func perform<N: Numeric>(
  _ op:(N, N) -> N,
  on lhs: N,
  and rhs: N
) -> N {
  op(lhs, rhs)
}

perform(+, on: 10, and: 20)

// alternative way of defining generic functions
func perform2<N>(
  _ op:(N, N) -> N,
  on lhs: N,
  and rhs: N
) -> N where N: Numeric{
  op(lhs, rhs)
}

perform2(+, on: 10, and: 20)


protocol CanJump {
  func jump()
}

protocol CanRun {
  func run()
}


struct Person: CanJump, CanRun {
  func jump() {
    "Jumping..."
  }
  
  func run() {
    "Running..."
  }
}

func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
  value.run()
  value.jump()
}

let person = Person()
jumpAndRun(person)


extension [String] {
  func longestString() -> String? {
    self.sorted { (lhs: String, rhs: String) -> Bool in
      lhs.count > rhs.count
    }.first
  }
}

[
  "Foo",
  "Baz Bar",
  "Boo"
].longestString()


protocol View {
  func addSubView(_ view: View)
}

extension View {
  func addSubView(_ view: View) {
    // empty
  }
}

struct Button: View {
}

struct Table: View {
}

protocol PresentableAsView {
  associatedtype ViewType: View
  func produceView() -> ViewType
  func configure(superView: View, thisView: ViewType)
  func present(view: ViewType, on superView: View)
}

extension PresentableAsView {
  func configure(superView: View, thisView: ViewType) {
    // empty
  }
  
  func present(view: ViewType, on superView: View) {
    superView.addSubView(view)
  }
}

struct MyButton: PresentableAsView {
  func produceView() -> Button {
    Button()
  }
}

struct MyTable: PresentableAsView {
  func produceView() -> Table {
    Table()
  }
}


extension PresentableAsView where ViewType == Button {
  func doSomethingWithButton() {
    "This is a button"
  }
}

let button = MyButton()
button.doSomethingWithButton()

let table = MyTable()
// does not have dosomethingwithbutton func

extension [Int] {
  func average() -> Double {
    Double(self.reduce(0, +)) / Double(self.count)
  }
}

[1, 2, 3, 4, 5].average()

