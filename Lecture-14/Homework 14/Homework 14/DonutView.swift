//
//  DonutView.swift
//  Homework 14
//
//  Created by Vyacheslav Pronin on 23.07.2021.
//

import Foundation
import UIKit

final class DonutView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
      let half: CGFloat = min(bounds.size.width / 2, bounds.size.height / 2)
      
      let circlePath = UIBezierPath(arcCenter: CGPoint(x:half,y:half) ,
                                    radius: half,
                                    startAngle: 0,
                                    endAngle: .pi * 2,
                                    clockwise: true)
      let shape = CAShapeLayer()
      shape.path = circlePath.cgPath
      shape.lineWidth = half / 2
      shape.fillColor = UIColor.clear.cgColor
      shape.strokeColor = UIColor.systemPink.cgColor
      layer.addSublayer(shape)
      }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view === self {
            return nil
        }
        return view
    }
}
