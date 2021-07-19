//
//  ViewController.swift
//  Homework 13
//
//  Created by Vyacheslav Pronin on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {

    private var sizeIcon: CGFloat = 80
    var flowHeightConstraint: NSLayoutConstraint?
    var flowWidthConstraint: NSLayoutConstraint?
    
    private var lessButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Меньше", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return button
    }()
    
    private var moreButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Больше", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return button
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "DamascusMedium", size: 16)
        label.numberOfLines = 0
        label.text = "Тут что-то отображается"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGreen
        
        flowHeightConstraint = imageIcon.heightAnchor.constraint(equalToConstant: sizeIcon)
        flowWidthConstraint = imageIcon.widthAnchor.constraint(equalToConstant: sizeIcon)
        flowWidthConstraint?.isActive = true
        flowHeightConstraint?.isActive = true
        
        setup()
    }
    
    private func setup() {
        [lessButton, moreButton, textLabel, imageIcon].forEach { self.view.addSubview($0) }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let const: CGFloat = 20
        
        NSLayoutConstraint.activate([
            lessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: const),
            lessButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -const),
            //lessButton.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -const),
            lessButton.heightAnchor.constraint(equalToConstant: const * 2),
            lessButton.widthAnchor.constraint(equalToConstant: view.frame.width/3),
            
            moreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -const),
            moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -const),
            moreButton.heightAnchor.constraint(equalToConstant: const * 2),
            //moreButton.leadingAnchor.constraint(equalTo: lessButton.trailingAnchor, constant: const)
            moreButton.widthAnchor.constraint(equalToConstant: view.frame.width/3),
            
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: const),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: const * 2),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -const * 2),
            textLabel.heightAnchor.constraint(equalToConstant: const * 2),
            
            imageIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc
    private func changeView(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            sizeIcon = sizeIcon * 0.7 < 60 ? sizeIcon : sizeIcon * 0.7
            textLabel.text = sizeIcon * 0.7 < 60 ? "Уже некуда" : "Стало чуть меньше"
        case 2:
            sizeIcon = sizeIcon * 1.2 > view.frame.width - 40 ? sizeIcon : sizeIcon * 1.2
            textLabel.text = sizeIcon * 1.2 > view.frame.width - 40 ? "Уже некуда" : "Стало чуть больше"
        default:
            break
        }
        
        UIView.animate(withDuration: 0.4,
                       delay: 0.1,
                       options: .allowAnimatedContent,
                       animations: {
                                    self.imageIcon.rotate()
                                    self.flowHeightConstraint?.constant = self.sizeIcon
                                    self.flowWidthConstraint?.constant = self.sizeIcon
                                    self.view.layoutIfNeeded()
                                    },
                       completion: nil)
    }
    
}

extension UIImageView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1.2
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
