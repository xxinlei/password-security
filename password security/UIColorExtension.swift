//
//  UIColorExtension.swift
//  password security
//
//  Created by 楊昕蕾 on 2021/12/14.
//

import Foundation
import UIKit

extension UIColor{
    
    class func hexToRGB(hex:String) -> UIColor{
        let nInt = Int(hex, radix: 16)
        let rColor = (nInt! >> 16) & 0xFF
        let gColor = (nInt! >> 8) & 0xFF
        let bColor = nInt! & 0xFF
        
        return UIColor(red: CGFloat(rColor) / 255, green: CGFloat(gColor) / 255, blue: CGFloat(bColor) / 255, alpha: 1)
        
    }

}
