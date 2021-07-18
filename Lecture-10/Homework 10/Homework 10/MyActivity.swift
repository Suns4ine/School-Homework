//
//  MyActivity.swift
//  Homework 10
//
//  Created by Vyacheslav Pronin on 18.07.2021.
//

import Foundation
import  UIKit

class MyActivity: UIActivity {
    
    override var activityTitle: String? { "Жми сюда" }
    override var activityImage: UIImage? { UIImage(named: "icon") }
    override var activityType: UIActivity.ActivityType? { .none }
    override class var activityCategory: UIActivity.Category { .share }
    
    override var activityViewController: UIViewController? {
        let text = "Спасибо за регистрацию на сайти JoyCasino.com"
        let alertController = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let thankAction = UIAlertAction(title: "Не за что", style: .default) { [weak self] _ in
            self?.activityDidFinish(true)
        }
        alertController.addAction(thankAction)
        return alertController
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool { true }
}
