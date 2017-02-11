//
//  ZLCColorCategory.swift
//
//  Created by Leo on 2017/2/10.
//  Copyright © 2017年 Leo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /*
     *  @brief - return a UIColor with hex string
     *
     *  @param - param_in hexString - use this string make UIColor with RGB
     *  
     *  @return - return correct UIColor.
     *            But if hexString is not correctly RGB hex string, will return white color
     *
     */
    class func colorWithHexString(_ hexString: String) -> UIColor {
        
        // No input or error input
        if hexString == "", hexString.characters.count != 7 {
            return .white
        }
        
        let index:String.Index = hexString.index(hexString.startIndex, offsetBy: 1)
        
        // error input
        if hexString.substring(to: index) != "#" {
            return .white
        }
        
        let newHexString:String = hexString.substring(from: index)
        
        // error input
        for c:Character in newHexString.characters {
            if c < "0" || (c > "9" && c < "A") || (c > "F" && c < "a") || c > "f" {
                return .white
            }
        }
        
        // Split string
        // Part of red
        var start:String.Index = newHexString.startIndex
        var end:String.Index = newHexString.index(start, offsetBy: 2)
        var range:Range<String.Index> = start ..< end
        let redValueStr:String = newHexString.substring(with: range)
        
        // Part of green
        start = end
        end = newHexString.index(start, offsetBy: 2)
        range = start ..< end
        let greenValueStr:String = newHexString.substring(with: range)
        
        // Part of blue
        start = end
        end = newHexString.index(start, offsetBy: 2)
        range = start ..< end
        let blueValueStr:String = newHexString.substring(with: range)
        
        // Convert to Int with hexadecimal
        let redValue = Int(redValueStr, radix: 16)!
        let greenValue = Int(greenValueStr, radix: 16)!
        let blueValue = Int(blueValueStr, radix: 16)!
        
        // Make UIColor
        let newUIColor = UIColor(red: CGFloat(redValue)/255.0, green: CGFloat(greenValue)/255.0, blue: CGFloat(blueValue)/255.0, alpha: 1.0)
        
        return newUIColor
    }
    
    /*
     *  @brief - return a UIColor of transparency with hex string
     *
     *  @param - param_in hexString - use this string make UIColor with RGB
     *
     *  @param - param_in alpha - value of transparency
     *
     *  @return - return correct UIColor.
     *            But if hexString is not correctly RGB hex string, will return white color
     *
     */
    class func colorWithHexString(_ hexString: String, alpha:CGFloat) -> UIColor {
        
        // Make UIColor
        let newUIColor = self.colorWithHexString(hexString)
        newUIColor.withAlphaComponent(alpha)
        
        return newUIColor
    }
    
}
