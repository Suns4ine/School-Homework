//
//  Homework-3.swift
//  
//
//  Created by Vyacheslav Pronin on 30.06.2021.
//

import Foundation

private final class Link<T> {
    var value: T
    init (_ value: T) {
        self.value = value
    }
}

struct Copy<T> {
    private var link: Link<T>
    
    init (_ value: T) {
        self.link = Link(value)
    }
    var value: T {
        set {
            if !isKnownUniquelyReferenced(&link) {
                link = Link(newValue)
                return
            }
            link.value = newValue
        }
        get {
            link.value
        }
    }
    mutating func printAddress() { print(Unmanaged.passUnretained(link).toOpaque()) }
}

var first = Copy(21)
var second = first

first.printAddress()
second.printAddress()
second.value = 221
print("\n|-----------------|\n")
first.printAddress()
second.printAddress()
