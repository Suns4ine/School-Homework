//
//  CreateMemViewController.swift
//  Homework 20
//
//  Created by Vyacheslav Pronin on 02.08.2021.
//

import Foundation
import UIKit
import PhotosUI

final class CreateMemViewController: UIViewController {
 
    private let saveItem: UIBarButtonItem = UIBarButtonItem(title: "Сохранить",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(saveMeme))
    private let addImage: UIBarButtonItem = UIBarButtonItem(title: "Добавить картинку",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveMeme))
    
    private let settingView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.textColor.cgColor
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItems = [ saveItem, addImage]
        
        [settingView].forEach{ view.addSubview($0)}
    }
    
    @objc
    private func saveMeme() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            settingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension CreateMemViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
    }
}
