//
//  ViewController.swift
//  Homework 10
//
//  Created by Vyacheslav Pronin on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {

    
    lazy private var button : UIButton = {
        let button = UIButton()
        button.setTitle("Подделиться", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.borderWidth = 1.0
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(shareSomething), for: .touchUpInside)
        button.frame = CGRect(x: Int(self.view.bounds.width/4), y: 300, width: 200, height: 40)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        setup()
    }

    private func setup() {
        self.view.addSubview(button)
    }

    @objc
    private func shareSomething() {
        let activity = MyActivity()
        let activityViewController = UIActivityViewController(activityItems: [], applicationActivities: [activity])
        
        activityViewController.excludedActivityTypes = [
            .postToFlickr,
            .saveToCameraRoll,
            .postToVimeo,
        ]
        present(activityViewController, animated: true)
    }
}

