//
//  Homework-9.swift
//  
//
//  Created by Vyacheslav Pronin on 14.07.2021.
//

import Foundation

// Facade

class AuthorFinder {
    func findAuthor(author: String) {
        print("Ищем автора \(author)")
    }
}

class BookDataBase {
    func findBook() {
        print("Ищем в недрах полок")
    }
    
    func foundBook() {
        print("Вот тебе Замок")
    }
}

class SchoolDictonary {
    func readingTo(author: String) {

        let authorName = AuthorFinder()
        let book = BookDataBase()
        
        authorName.findAuthor(author: author)
        book.findBook()
        book.foundBook()
        
    }
}

let schoolBook = SchoolDictonary()
schoolBook.readingTo(author: "Кафка")

//Mediator

protocol Mediator {
    func send(message: String, associate: Associate)
}

class Associate {
    let name: String
    let mediator: Mediator
    
    init(name: String, mediator: Mediator) {
        self.name = name
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, associate: self)
    }
    
    func receive(message: String) {
        print("Упс, ошибка  при сообщении: \(message)")
    }
}

class MessageMediator: Mediator {
    private var associates: [Associate] = []
    
    func addAssociate(associate: Associate) {
        associates.append(associate)
    }
    
    func send(message: String, associate: Associate) {
        for c in associates {
            if c !== associate {
                c.receive(message: message)
            }
        }
    }
}

class ConcreteAssociate: Associate {
    override func receive(message: String) {
        print("Ассистант \(name) получает: \(message)")
    }
}

let messagesMediator = MessageMediator()
let userFirst = ConcreteAssociate(name: "0", mediator: messagesMediator)
let userSecond = ConcreteAssociate(name: "1", mediator: messagesMediator)
messagesMediator.addAssociate(associate: userFirst)
messagesMediator.addAssociate(associate: userSecond)

userFirst.send(message: "Удачи")
