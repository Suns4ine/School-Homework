//
//  GSViewController.swift
//  Homework 19
//
//  Created by Vyacheslav Pronin on 01.08.2021.
//

import Foundation
import UIKit

open class HomeworkViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemGray4
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        button.setTitle("Жми", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(changeButonColor), for: .touchUpInside)
        return button
    }()
    
    @objc public func changeButonColor(withColor color: UIColor) {
        button.backgroundColor = view.backgroundColor
    }
    
    @objc public func changeBackground(withColor color: UIColor) {
        view.backgroundColor = color
        
        if label.text == "Sber" {
            label.text = "School"
        } else {
            label.text = "Sber"
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        [label, button].forEach{ view.addSubview($0)}
        
        label.text = "Sber"
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            label.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 200),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
