struct Expr<A> {
    let int: (Int) -> A
    let add: (A, A) -> A
    let mul: (A, A) -> A
}

let int = Expr<Int>(int: { $0 }, add: +, mul: *)
let string = Expr<String>(int: { "\($0)" }, add: { "(\($0) + \($1))" }, mul: { "(\($0) * \($1))" })

func test<A>(_ e: Expr<A>) -> A {
    return e.add(e.int(1), e.mul(e.int(2), e.int(3)))
}

print(test(int))
print(test(string))
