//
//  String+Separation.swift
//  ComponentsSample
//
//  Created by Parul Vats on 19/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit

extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}



extension String {
    func asStylizedPrice(using font: UIFont) -> NSMutableAttributedString {
        let stylizedPrice = NSMutableAttributedString(string: self, attributes: [.font: font])
        
        guard let range = self.range(of: getLanguageDecimalSeparator()) else {
            return stylizedPrice
        }
        var changeRange = NSRange(range, in: self)
        
        changeRange.length = self.count - changeRange.location
        let changeFont = font.withSize(font.pointSize/1.5)
        let offset = font.capHeight - changeFont.capHeight
        

        stylizedPrice.addAttribute(.font, value: changeFont, range: changeRange)
        stylizedPrice.addAttribute(.baselineOffset, value: offset, range: changeRange)
        return stylizedPrice
    }
    
    fileprivate func getLanguageDecimalSeparator() -> String {
        switch Locale.current.languageCode {
        case "en":
            return "."
        default:
            return ","
        }
    }
}
