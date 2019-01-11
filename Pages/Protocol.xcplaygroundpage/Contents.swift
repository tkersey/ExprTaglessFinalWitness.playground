protocol Expr {
    static func int(_ x: Int) -> Self
    static func add(_ lhs: Self, _ rhs: Self) -> Self
    static func mul(_ lhs: Self, _ rhs: Self) -> Self
}

extension Int: Expr {
    static func int(_ x: Int) -> Int {
        return x
    }

    static func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }

    static func mul(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
}

extension String: Expr {
    static func int(_ x: Int) -> String {
        return "\(x)"
    }

    static func add(_ lhs: String, _ rhs: String) -> String {
        return "(\(lhs) + \(rhs))"
    }

    static func mul(_ lhs: String, _ rhs: String) -> String {
        return "(\(lhs) * \(rhs))"
    }
}

func test<E: Expr>() -> E {
    return E.add(E.int(1), E.mul(E.int(2), E.int(3)))
}

print(test() as Int)
print(test() as String)
