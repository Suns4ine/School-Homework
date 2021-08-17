//
//  Homework-5.swift
//  
//
//  Created by Vyacheslav Pronin on 07.07.2021.
//

import Foundation

// Direct Dispatch

struct User {
    func isActive() {
        print("User is active")
    }
}

var userOne = User()
userOne.isActive()


// Witness Table Dispatch

class Castle { }

protocol Book {
    func nameAuthor()
    func genre()
}

extension Castle: Book {
    func nameAuthor() {
        print("Author is Kafka")
    }
    func genre() {
        print("Genre is a novel")
    }
}

let firstBook: Book = Castle()
firstBook.nameAuthor()

// Virtual Table Dispatch

class gameUser {
    func attack() {
        print("Attack")
    }
}

class Healer: gameUser {
    override func attack() {
        print("Healing")
    }
}

let healer = Healer()
healer.attack()

// Message Dispatch

class Transformer: NSObject {
    dynamic func nameAuto() {
        print("Don't name Auto")
    }
}

class AutoBot: Transformer {
    var name = "Optimus"
    override func nameAuto() {
        print("\(name) is a Freightliner Truck")
    }
}

var autoBot = AutoBot()
autoBot.nameAuto()

func sum(num1: String, num2: String) -> String {
    var first = String(num1.reversed())
    var second = String(num2.reversed())
        
    if first.count > second.count {
        first = String(num2.reversed())
        second = String(num1.reversed())
    }

    var result = ""
    var remnant = 0

    let firstNumb = first.map{ Int(String($0))}
    let secondNumb = second.map{ Int(String($0))}

    for index in firstNumb.indices {
        let sum = firstNumb[index]! + secondNumb[index]! + remnant
        remnant = sum / 10
        result += String(sum % 10)
    }

    if secondNumb.count > firstNumb.count {
        for index in firstNumb.count..<secondNumb.count {
            let sum = secondNumb[index]! + remnant
            remnant = sum / 10
            result += String(sum % 10)
        }
    }
    if remnant > 0 {
        result += String(remnant)
    }
    
    return String(result.reversed())
}
