import Foundation

public class Node<Value> {

    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }

}

extension Node: CustomStringConvertible {

    public var description: String {
        var description = "\(value)"
        guard let next = next else {
            return description
        }

        description += " -> " + String(describing: next) + " "
        return description
    }

}
