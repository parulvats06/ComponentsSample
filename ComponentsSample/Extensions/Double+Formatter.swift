//
//  Double+Formatter.swift
//  ComponentsSample
//
//  Created by Parul Vats on 20/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import Foundation

extension Double {
    
    static let formatter = NumberFormatter()
    func decimalFormatter(minimumFractionDigits: Int = 2, maximumFractionDigits: Int = 2) -> String {
        guard let code = Locale.current.languageCode else {
            return Double.formatter.string(for: self)!
        }
        
        Double.formatter.locale = Locale(identifier: code)
        Double.formatter.minimumFractionDigits = minimumFractionDigits
        Double.formatter.maximumFractionDigits = maximumFractionDigits
        Double.formatter.numberStyle = NumberFormatter.Style.decimal
        Double.formatter.usesGroupingSeparator = true
        return Double.formatter.string(for: self)!
    }
    
    func getAmountText(amount: Double, minimumFractionDigits: Int = 5) -> String {
        return amount.decimalFormatter(minimumFractionDigits: minimumFractionDigits)
    }
}
