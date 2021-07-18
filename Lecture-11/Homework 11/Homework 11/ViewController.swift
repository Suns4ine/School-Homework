//
//  ViewController.swift
//  Homework 11
//
//  Created by Vyacheslav Pronin on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {

    private var colorModel: ColorModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorModel = ColorModel()
        self.view.backgroundColor = .systemPink
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        let arrayColor = colorModel?.giveArrayColor()
        
        for i in 0..<4 {
            let button = UIButton(frame: .init())
            button.backgroundColor = arrayColor?[i]
            button.layer.borderWidth = 1.0
            button.frame = CGRect(x: Int(self.view.bounds.width/4), y: 80 + 100 * i, width: 200, height: 40)
            button.addTarget(self, action: #selector(newBacgroundColor), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    @objc func newBacgroundColor(_ sender: UIButton) {
        self.view.backgroundColor = sender.backgroundColor
    }
    
}

