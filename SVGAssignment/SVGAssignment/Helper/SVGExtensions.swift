//
//  SVGExtensions.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import Foundation
import UIKit


extension UIButton{
    
    /// For Button
    /// - Parameters:
    ///   - title: Title on button
    ///   - titleColor: title color of buttone text
    ///   - cornerRadius: Rounded corner radius
    func configureButton(title:String,titleColor:UIColor,cornerRadius:CGFloat){
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor =  UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1.0)
        self.layer.cornerRadius = cornerRadius
    }
    
}
