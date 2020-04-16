// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 2. Prioritize a Waitlist
 
 Your favorite T-Swift concert was sold out. Fortunately there is a waitlist for people who still want to go! However the ticket sales will first prioritize someone with a **military background**, followed by **seniority**. Write a `sort` function that will return the list of people on the waitlist by the priority mentioned.
 */
public struct Person: Equatable {
    let name: String
    let age: Int
    let isMilitary: Bool
}

func sort(person1: Person, person2: Person) -> Bool {
    if person1.isMilitary == person2.isMilitary {
        return person1.age >= person2.age
    }
    return person1.isMilitary
}


let kevin = Person(name: "kevin", age: 18, isMilitary: true)
let jason = Person(name: "jason", age: 20, isMilitary: true)
let edward = Person(name: "edward", age: 19, isMilitary: false)
let andrew = Person(name: "andrew", age: 22, isMilitary: false)

var priorityQueue = PriorityQueue(sort: sort, elements: [kevin, jason, edward, andrew])
while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}
//: [Next Challenge](@next)
