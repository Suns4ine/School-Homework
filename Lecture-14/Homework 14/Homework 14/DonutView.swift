//
//  DonutView.swift
//  Homework 14
//
//  Created by Vyacheslav Pronin on 23.07.2021.
//

import Foundation
import UIKit

final class DonutView: UIView {
    
//    let donutButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .yellow
//        button.titleLabel?.textAlignment = .center
//        button.title(for: .normal)
//        button.setTitle("Нажми", for: .normal)
//        button.clipsToBounds = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
 //       setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
//            donutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            donutButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            donutButton.heightAnchor.constraint(equalToConstant: self.frame.height / 2),
//            donutButton.widthAnchor.constraint(equalToConstant: self.frame.width / 2),
        ])
        
//        donutButton.layer.cornerRadius = self.frame.height / 4
//        donutButton.setTitleColor(self.backgroundColor, for: .normal)
    }
    
//    private func setup() {
//        [donutButton].forEach{ insertSubview($0, at: 1) }//addSubview($0)}
//    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view === self {
            return nil
        }
        return view
    }
}
