// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Stack Challenges
 
 ## #1. Reserve an Array
 
 Create a function that prints the contents of an array in reversed order.
 */

let array: [Int] = [1, 2, 3, 4, 5]

func printInReverse(_ array: [Int]) {
    var stack = Stack(array)
    while !stack.isEmpty {
        print(stack.pop()!)
    }
}

printInReverse(array)
//: [Next Challenge](@next)
