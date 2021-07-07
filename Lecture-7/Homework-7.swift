//
//  Homework-7.swift
//  
//
//  Created by Vyacheslav Pronin on 07.07.2021.
//

import Foundation

var array = [6, 0, 131, -22, 91, 0, 2]

var mapArray = array.reduce([]) {
    $0 + [$1 * 2]
}

var filter = 10

var filtArray = array.reduce([]) {
    $0 + ($1 > filter ? [$1] : [])
}

print(mapArray)
print(filtArray)
