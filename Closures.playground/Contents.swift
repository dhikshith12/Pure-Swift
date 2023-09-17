import Foundation

//func add(_ lhs: Int, _ rhs: Int) -> Int {
//    lhs + rhs;
//}

let add: (Int, Int) -> Int;

add = { (lhs: Int, rhs: Int) -> Int in
    lhs + rhs;
}

add(10, 50)

func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int
) -> Int {
    function(lhs, rhs);
}

customAdd(
    10,
    50
) { lhs, rhs in
    lhs+rhs;
}

customAdd(
    10,
    50
) {
    $0 + $1;
}

customAdd(10, 50) { $0 + $1 }

let ages = [ 30, 20, 19, 40 ]

let res = ages.sorted(by: <)

print(res)




