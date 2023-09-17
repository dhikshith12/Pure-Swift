import Foundation


let x = 10
let y = 20

let z = x + y // -, *, /

func perform<T>(
    _ op: (T, T) -> T,
    on lhs: T,
    and rhs: T
) -> T {
    op(lhs, rhs);
}


perform(+, on: 10, and: 20)
perform(-, on: 10, and: 20)
perform(/, on: 10, and: 20)
perform(*, on: 10, and: 20)


perform(+, on: 10.0, and: 12.5)
perform(-, on: 10.0, and: 12.5)
perform(/, on: 10.0, and: 12.5)
perform(*, on: 10.0, and: 12.5)


// MARK: -Generics

// Generics: Similar to Java and C#. Use the `where` keyword to specify the
//   requirements of the generics.

func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
findIndex(array: [1, 2, 3, 4], valueToFind: 3) // Optional(2)

// You can extend types with generics as well
extension Array where Array.Element == Int {
    var sum: Int {
        var total = 0
        for el in self {
            total += el
        }
        return total
    }
}

// MARK: -Operators

// Custom operators can start with the characters:
//      / = - + * % < > ! & | ^ . ~
// or
// Unicode math, symbol, arrow, dingbat, and line/box drawing characters.
prefix operator !!!

// A prefix operator that triples the side length when used
prefix func !!! (shape: inout Int) -> Int{
    shape *= 3
    return shape
}

var mySquare = 4

// current value
print(mySquare) // 4

// change side length using custom !!! operator, increases size by 3
!!!mySquare
print(mySquare) // 12

// Operators can also be generics
infix operator <->
func <-><T> (a: inout T, b: inout T) {
    let c = a
    a = b
    b = c
}

var foo: Float = 10
var bar: Float = 20

foo <-> bar
print("foo is \(foo), bar is \(bar)") // "foo is 20.0, bar is 10.0"

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        print("Jumping...")
    }
    
    func run() {
        print("Running...")
    }
}

func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
    value.jump();
    value.run()
}

let person = Person();

jumpAndRun(person)

let names: Array<String> = ["Foo", "Bar"]

// new syntax
extension [String] {
    func findLongestString() -> String? {
        var longest: String?=nil;
        
        forEach({a in
            if(a.count >= (longest?.count ?? 0)){
                longest = a;
            }
        })
        
        return longest;
    }
}


[
    "Foo",
    "Bar Baz",
    "Qux"
].findLongestString()

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
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view: ViewType,
        on superView: View
    )
}


extension PresentableAsView {
    func configure(
        superView: View,
        thisView: ViewType
    ) {
        // empty by default
    }
    
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }
    func configure(superView: View, thisView: Button) {
        
    }
    func present(view: Button, on superView: View) {
        
    }
}


extension PresentableAsView {
    func doSomethingWithView() {
        "This is a View"
    }
}

let button = MyButton()
button.doSomethingWithView();


struct MyTable: PresentableAsView {
    func produceView() -> Table {
        Table()
    }
    
}

let myTable = MyTable()

myTable.doSomethingWithView()

extension [Int] {
    func averate() -> Double {
//        self.reduce(0.0){ (prev: Double, this: Int) -> Double in
//            prev + Double(this)/Double(count);
//        }
        Double(self.reduce(0, +))/Double(count);
    }
}

let myitems = [
    1,
    2,
    3,
    4,
    5,
    6,
    7
]

print(myitems.averate())
