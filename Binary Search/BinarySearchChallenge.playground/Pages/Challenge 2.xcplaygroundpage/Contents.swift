// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 [Previous Challenge](@previous)
 ### Challenge 2: Searching for a range
 Write a function that searches a **sorted** array and that finds the range of indices for a particular element. For example:

```swift
let array = [1, 2, 3, 3, 3, 4, 5, 5]
findIndices(of: 3, in: array)
```

`findIndices` should return the range `2..<5`, since those are the start and end indices for the value `3`.
*/
import Foundation

// O(log n)
func findIndices<Elements: RandomAccessCollection>(of value: Elements.Element, in elements: Elements) -> Range<Elements.Index>? where Elements.Element: Comparable {
    guard let found = elements.binarySearch(for: value) else {
        return nil
    }

    var startIndex = found
    while(startIndex > elements.startIndex && elements[elements.index(before: startIndex)] == value) {
        startIndex = elements.index(before: startIndex)
    }

    var endIndex = found
    while(endIndex < elements.endIndex && elements[elements.index(after: endIndex)] == value) {
        endIndex = elements.index(after: endIndex)
    }

    return startIndex..<elements.index(after: endIndex)
}

let array = [1, 2, 3, 3, 3, 4, 5, 5]
print(findIndices(of: 3, in: array))
