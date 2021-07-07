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
