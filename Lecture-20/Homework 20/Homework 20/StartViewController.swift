//
//  ViewController.swift
//  Homework 20
//
//  Created by Vyacheslav Pronin on 02.08.2021.
//

import UIKit

final class StartViewController: UIViewController {
    
    private let constraintSize: CGFloat = 40

    private lazy var createMemButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .standartColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        button.layer.cornerRadius = constraintSize / 2.5
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.textColor.cgColor
        button.setTitle("Создать мем", for: .normal)
        button.setTitleColor(.textColor, for: .normal)
        button.addTarget(self, action: #selector(createMeme), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()
    
    @objc private func createMeme() {
        let vc = CreateMemViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .standartColor
        
        self.navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.tintColor = .textColor
        [createMemButton].forEach{ view.addSubview($0)}
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            createMemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createMemButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            createMemButton.heightAnchor.constraint(equalToConstant: constraintSize),
        ])
    }
}

extension UIColor {
    
    static let standartColor: UIColor = .black
    static let textColor: UIColor = .white
}
