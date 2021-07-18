//
//  ColorModel.swift
//  Homework 11
//
//  Created by Vyacheslav Pronin on 18.07.2021.
//

import Foundation
import UIKit

struct ColorModel {
    
    private var colorsArray: [UIColor] = [.blue, .red, .gray, .green, .brown, .purple, .darkGray, .green, .label, .orange]
    
    
    func giveArrayColor() -> [UIColor] {
        var set: Set<UIColor> = []
        
        while set.count != 4 {
            set.insert(colorsArray[.random(in: 0..<colorsArray.count)])
        }
        
//        var array = [UIColor]()
//        for _ in 0..<4 {
//            array.append(colorsArray[.random(in: 0..<colorsArray.count)])
//        }
        
        return Array(set)
    }
}
