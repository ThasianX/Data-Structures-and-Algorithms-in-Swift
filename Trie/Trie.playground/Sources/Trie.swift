import Foundation

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {

    public typealias Node = TrieNode<CollectionType.Element>

    private let root = Node(key: nil, parent: nil)

    public init() { }

}

// MARK: Add Operations
extension Trie {

    // O(k) - k is the number of elements in collection
    public func insert(_ collection: CollectionType) {
        var current = root

        collection.forEach { element in
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }

        current.isTerminating = true
    }

}

// MARK: Search Operations
extension Trie {

    // O(k) - k is the number of elements in collection
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }

}

// MARK: Remove Operations
extension Trie {

    // O(k) - k is the number of elements in collection
    public func remove(_ collection: CollectionType) {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }

        guard current.isTerminating else {
            return
        }

        current.isTerminating = false

        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }

}

// MARK: Prefix Matching
extension Trie where CollectionType: RangeReplaceableCollection {

    /* O(k*m) - k represents the longest collection matching the prefix and
     m represents the number of collections that match the prefix */
    public func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        return collections(startingWith: prefix, after: current)
    }

    public func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        var results: [CollectionType] = []

        if node.isTerminating {
            results.append(prefix)
        }

        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
        }

        return results
    }

}
