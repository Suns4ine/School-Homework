//
//  ViewController.swift
//  Example
//
//  Created by Vyacheslav Pronin on 01.08.2021.
//

import UIKit
import Homework_19

class ViewController: HomeworkViewController {
    
    var colors: [UIColor] = [.systemTeal, .systemGreen, .systemPink, .systemBlue, .systemOrange]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeBackground(withColor: colors[currentIndex])
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
    }
    
    @objc func handleClick() {
        currentIndex += 1
        
        if !colors.indices.contains(currentIndex) {
            currentIndex = 0
        }
        
        changeBackground(withColor: colors[currentIndex])
    }
}
