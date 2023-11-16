//
//  UIColor+Extensions.swift
//
//
//  Created by Pavel Koyushev on 16.11.2023.
//

import Foundation
#if canImport(UIKit)
import UIKit

public extension UIColor {
    
    var hexValue: String {
        var color = self
        
        if color.cgColor.numberOfComponents < 4 {
            let c = color.cgColor.components!
            color = UIColor(red: c[0], green: c[0], blue: c[0], alpha: c[1])
        }
        
        if color.cgColor.colorSpace!.model != .rgb {
            return "#FFFFFF"
        }
        
        let c = color.cgColor.components!
        
        return String(format: "#%02X%02X%02X", Int(c[0]*255.0), Int(c[1]*255.0), Int(c[2]*255.0))
    }
    
    static var random: UIColor {
        let max = CGFloat(UInt32.max)
        let red = CGFloat(arc4random()) / max
        let green = CGFloat(arc4random()) / max
        let blue = CGFloat(arc4random()) / max
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
#endif
