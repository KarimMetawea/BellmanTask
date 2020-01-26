//
//  CardView.swift
//  Curex
//
//  Created by Diaa SAlAm on 1/3/20.
//  Copyright © 2020 Diaa SAlAm. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    @IBInspectable var cornerrRadius: CGFloat = 6
//    @IBInspectable var shadowOffSetWidth: CGFloat = 2
//    @IBInspectable var shadowOffSetHeight: CGFloat = 3
//    @IBInspectable var shadowOpacity: CGFloat = 0.5
//    @IBInspectable var shadowColor = UIColor.gray
    @IBInspectable var borderColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
    @IBInspectable var borderWidth : CGFloat = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerrRadius
//        layer.shadowColor = shadowColor.cgColor
        
//        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerrRadius)
//        layer.shadowPath = shadowPath.cgPath
//        layer.shadowOpacity = Float(shadowOpacity)
        layer.borderColor = borderColor.cgColor
        layer.borderWidth =  borderWidth
    }
    
}
