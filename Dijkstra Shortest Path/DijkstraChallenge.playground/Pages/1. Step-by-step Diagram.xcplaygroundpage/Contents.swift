// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Dijkstraʼs Algorithm Challenges
 
 ## 1. Step-by-step Diagram
 
 Given the following graph, step through Dijkstra’s algorithm to produce the
 shortest path to every other vertex starting from vertex A. Provide the
 final table of the paths as shown in the previous chapter.
 
 ![Graph](challenge1Question.png)
 
 */
/*
 
   |   B   |   C   |   D   |   E   |
 A |  1/A  | 12/A  |  nil  | 21/A  |
 B |  1/A  |  9/B  |  9/B  | 21/A  |
 C |  1/A  |  9/B  | 10/B  | 11/B  |
 D |  1/A  |  9/B  | 10/B  | 11/C  |
 E |  1/A  |  9/B  | 10/B  | 11/D  |

 */
//: [Next Challenge](@next)
