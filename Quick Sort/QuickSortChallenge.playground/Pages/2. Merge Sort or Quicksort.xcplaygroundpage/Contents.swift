// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
/*:
 ## 2. Merge Sort or Quicksort
 
 Explain when and why you would use merge sort over quicksort.
 */
/*
Merge sort and quick sort are relatively similar. They both partition an array into different pieces.
 Merge sort is a more stable algorithm, guaranteeing O(n log n) performance. However, quicksort can perform as bad as O(n^2).
 You typically want to use quicksort when elements are stored in a contiguous block in memory. Merge sort works better for larger data structures or data structures where elements are scattered throughout memory.
 Quicksort is also inefficient for larger arrays but requires less in place storage.
*/

//: [Next Challenge](@next)
